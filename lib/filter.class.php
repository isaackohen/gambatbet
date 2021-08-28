<?php
  /**
   * Filter Class
   *
   * @package Yoyo Framework
   * @author yoyostack.com
   * @copyright 2015
   */
  
  if (!defined("_YOYO"))
	  die('Direct access to this location is not allowed.');
  
  class Filter
  {
	  public static $id = null;
	  public static $get = array();
	  public static $post = array();
	  public static $cookie = array();
	  public static $files = array();
	  public static $server = array();
	  
	  
	  /**
	   * Filter::__construct()
	   * 
	   * @return
	   */
	  public function __construct(){}

	  /**
	   * Filter::run()
	   * 
	   * @return
	   */
	  public static function run()
	  {
		  $_GET = self::clean($_GET);
		  $_POST = self::clean($_POST);
		  $_COOKIE = self::clean($_COOKIE);
		  $_FILES  = self::clean($_FILES);
		  $_SERVER = self::clean($_SERVER);
		  
		  self::$get = $_GET;
		  self::$post = $_POST;
		  self::$cookie = $_COOKIE;
		  self::$files  = $_FILES;
		  self::$server = $_SERVER;
		  
		  self::$id = self::getId();
	  }
	  
	  
	  /**
	   * Filter::getId()
	   * 
	   * @return
	   */
	  private static function getId()
	  {
		  if (isset($_REQUEST['id'])) {
			  self::$id = intval($_REQUEST['id']);
			  return self::$id;
		  }
	  }
	  
	  /**
	   * Filter::clean()
	   * 
	   * @param mixed $data
	   * @param bool $utf8_encode
	   * @return
	   */
	  public static function clean($data, $utf8_encode = true)
	  {
		  
		  if (is_array($data)) {
			  return array_map(array(
				  'Filter',
				  'clean'
			  ), $data);
		  }
		  
		  // Fix &entity
		  $data = str_replace(array(
			  '&amp;',
			  '&lt;',
			  '&gt;'
		  ), array(
			  '&amp;amp;',
			  '&amp;lt;',
			  '&amp;gt;'
		  ), $data);

		  //$data = htmlspecialchars($data, ENT_QUOTES | ENT_HTML5, 'UTF-8');
		  $data = preg_replace('/(&#*\w+)[\x00-\x20]+;/u', '$1;', $data);
		  $data = preg_replace('/(&#x*[0-9A-F]+);*/iu', '$1;', $data);
		  $data = html_entity_decode($data, ENT_COMPAT, 'UTF-8');
		  
		  // Remove any attribute starting with "on" or xmlns
		  //$data = preg_replace('#(<[^>]+?[\x00-\x20"\'])(?:on|xmlns)[^>]*+>#iu', '$1>', $data);
		  $data = preg_replace('#(<[^>]+?[\x00-\x20"\'])(?:on)[^>]*+>#iu', '$1>', $data);
		  
		  // Remove javascript: and vbscript: protocols
		  $data = preg_replace('#([a-z]*)[\x00-\x20]*=[\x00-\x20]*([`\'"]*)[\x00-\x20]*j[\x00-\x20]*a[\x00-\x20]*v[\x00-\x20]*a[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2nojavascript...', $data);
		  $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*v[\x00-\x20]*b[\x00-\x20]*s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:#iu', '$1=$2novbscript...', $data);
		  $data = preg_replace('#([a-z]*)[\x00-\x20]*=([\'"]*)[\x00-\x20]*-moz-binding[\x00-\x20]*:#u', '$1=$2nomozbinding...', $data);
		  
		  // Only works in IE: <span style="width: expression(alert('Ping!'));"></span>
		  $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?expression[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
		  $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?behaviour[\x00-\x20]*\([^>]*+>#i', '$1>', $data);
		  $data = preg_replace('#(<[^>]+?)style[\x00-\x20]*=[\x00-\x20]*[`\'"]*.*?s[\x00-\x20]*c[\x00-\x20]*r[\x00-\x20]*i[\x00-\x20]*p[\x00-\x20]*t[\x00-\x20]*:*[^>]*+>#iu', '$1>', $data);
		  
		  // Remove namespaced elements (we do not need them)
		  $data = preg_replace('#</*\w+:\w[^>]*+>#i', '', $data);
		  
		  do {
			  // Remove really unwanted tags
			  $old_data = $data;
			  //$data = preg_replace('#</*(?:applet|b(?:ase|gsound|link)|embed(?:set)?|i(?:layer)|l(?:ayer|ink)|meta|object|title|xml)[^>]*+>#i', '', $data);
			  $data = preg_replace('#</*(?:applet|b(?:ase|gsound|link)|embed(?:set)?|i(?:layer)|l(?:ayer|ink)|meta|object|s(?:cript|tyle)|title|xml)[^>]*+>#i', '', $data);
		  } while ($old_data !== $data);
		  
		  // we are done...
		  return $data;

	  }
  }