<?php
  /**
   * payfast_common.inc
   *
   * Copyright (c) 2009-2012 PayFast (Pty) Ltd
   * 
   * LICENSE:
   * 
   * This payment module is free software; you can redistribute it and/or modify
   * it under the terms of the GNU Lesser General Public License as published
   * by the Free Software Foundation; either version 3 of the License, or (at
   * your option) any later version.
   * 
   * This payment module is distributed in the hope that it will be useful, but
   * WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
   * or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public
   * License for more details.
   * 
   * @author     Jonathan Smit
   * @copyright  2009-2012 PayFast (Pty) Ltd
   * @license    http://www.opensource.org/licenses/lgpl-license.php LGPL
   */
  if (!defined("_WOJO"))
      die('Direct access to this location is not allowed.');
	  
  //enable or disable debugging
  define('PF_DEBUG', false);
  define('PF_CURL', false);

  //// Create user agent string
  // User agent constituents (for cURL)
  define('PF_SOFTWARE_NAME', 'MembershipManagerPro');
  define('PF_SOFTWARE_VER', "3.0");
  define('PF_MODULE_NAME', 'PayFast-MembershipManagerPro');
  define('PF_MODULE_VER', '1.0');

  // Features
  $pfFeatures = 'PHP ' . phpversion() . ';';

  // - cURL
  if (in_array('curl', get_loaded_extensions())) {
      $pfVersion = curl_version();
      $pfFeatures .= ' curl ' . $pfVersion['version'] . ';';
  } else
      $pfFeatures .= ' nocurl;';

  // Create user agrent
  define('PF_USER_AGENT', PF_SOFTWARE_NAME . '/' . PF_SOFTWARE_VER . ' (' . trim($pfFeatures) . ') ' . PF_MODULE_NAME . '/' . PF_MODULE_VER);

  // General Defines
  define('PF_TIMEOUT', 15);
  define('PF_EPSILON', 0.01);

  // Messages
  // Error
  define('PF_ERR_AMOUNT_MISMATCH', 'Amount mismatch');
  define('PF_ERR_BAD_ACCESS', 'Bad access of page');
  define('PF_ERR_BAD_SOURCE_IP', 'Bad source IP address');
  define('PF_ERR_CONNECT_FAILED', 'Failed to connect to PayFast');
  define('PF_ERR_INVALID_SIGNATURE', 'Security signature mismatch');
  define('PF_ERR_MERCHANT_ID_MISMATCH', 'Merchant ID mismatch');
  define('PF_ERR_NO_SESSION', 'No saved session found for ITN transaction');
  define('PF_ERR_ORDER_ID_MISSING_URL', 'Order ID not present in URL');
  define('PF_ERR_ORDER_ID_MISMATCH', 'Order ID mismatch');
  define('PF_ERR_ORDER_INVALID', 'This order ID is invalid');
  define('PF_ERR_ORDER_PROCESSED', 'This order has already been processed');
  define('PF_ERR_PDT_FAIL', 'PDT query failed');
  define('PF_ERR_PDT_TOKEN_MISSING', 'PDT token not present in URL');
  define('PF_ERR_SESSIONID_MISMATCH', 'Session ID mismatch');
  define('PF_ERR_UNKNOWN', 'Unkown error occurred');
  define('PF_ERR_BAD_ATTENDEE_SESSION_ID', 'Incorrect attendee session id');

  // General
  define('PF_MSG_OK', 'Payment was successful');
  define('PF_MSG_FAILED', 'Payment has failed');
  define('PF_MSG_PENDING', 'The payment is pending. Please note, you will receive another Instant' . ' Transaction Notification when the payment status changes to' . ' "Completed", or "Failed"');

  /**
   * pflog
   *
   * Log function for logging output.
   *
   * @author Jonathan Smit
   * @param $msg String Message to log
   * @param $close Boolean Whether to close the log file or not
   */
  function pflog($msg = '', $close = false)
  {
      static $fh = 0;

      // Only log if debugging is enabled
      if (PF_DEBUG) {
          if ($close) {
              fclose($fh);
          } else {
              // If file doesn't exist, create it
              if (!$fh) {
                  $pathinfo = pathinfo(__file__);
                  $fh = fopen($pathinfo['dirname'] . '/payfast.log', 'a+');
              }

              // If file was successfully created
              if ($fh) {
                  $line = date('Y-m-d H:i:s') . ' : ' . $msg . "\n";

                  fwrite($fh, $line);
              }
          }
      }
  }

  /**
   * pfGetData
   *  
   * @author Jonathan Smit
   */
  function pfGetData()
  {
      // Posted variables from ITN
      $pfData = $_POST;

      // Strip any slashes in data
      foreach ($pfData as $key => $val)
          $pfData[$key] = stripslashes($val);

      // Return "false" if no data was received
      if (sizeof($pfData) == 0)
          return (false);
      else
          return ($pfData);
  }

  /**
   * pfValidSignature
   * 
   * @author Jonathan Smit
   */
  function pfValidSignature($pfData = null, $passPhrase = null, &$pfParamString = null)
  {
      // Dump the submitted variables and calculate security signature
      foreach ($pfData as $key => $val) {
          if ($key != 'signature')
              $pfParamString .= $key . '=' . urlencode($val) . '&';
      }

      // Remove the last '&' from the parameter string
      $pfParamString = substr($pfParamString, 0, -1);
	  $pfTempParamString = $pfParamString;
	  if( !empty( $passPhrase ) ) {
		  $pfTempParamString .= '&passphrase='.urlencode( $passPhrase );
	  }
	  $signature = md5( $pfTempParamString );

      $result = ($pfData['signature'] == $signature);

      pflog('Signature = ' . ($result ? 'valid' : 'invalid'));

      return ($result);
  }

  /**
   * pfValidData
   *
   * @author Jonathan Smit
   * 
   * @param string $pfHost String Hostname to use 
   * @param string $pfParamString String
   * @param string $curlUrl URL to curl to 
   */
  function pfValidData($pfHost = 'www.payfast.co.za', $pfParamString = '', $curlUrl = '')
  {
      pflog('beginning of function ' . __function__ );
      pflog('');
      pflog('Host = ' . $pfHost);
      pflog('Params = ' . $pfParamString);
      pflog('URL = ' . $curlUrl);
      pflog('');

      // Use cURL (if available)
      if (PF_CURL) {

          pflog('using CURL [' . $curlUrl . ']');

          // Create default cURL object
          $ch = curl_init();

          // Set cURL options - Use curl_setopt for freater PHP compatibility
          // Base settings
          curl_setopt($ch, CURLOPT_USERAGENT, PF_USER_AGENT); // Set user agent
          curl_setopt($ch, CURLOPT_RETURNTRANSFER, true); // Return output as string rather than outputting it
          curl_setopt($ch, CURLOPT_HEADER, false); // Don't include header in output
          curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
          curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

          // Standard settings
          curl_setopt($ch, CURLOPT_URL, "$curlUrl");
          curl_setopt($ch, CURLOPT_POST, true);
          curl_setopt($ch, CURLOPT_POSTFIELDS, $pfParamString);
          curl_setopt($ch, CURLOPT_TIMEOUT, PF_TIMEOUT);

          // Execute CURL
          $response = curl_exec($ch);
          pflog(print_r(curl_getinfo($ch), true));

          if (curl_errno($ch)) {
              pflog('CURL Error number ' . curl_errno($ch));
              return false;
          }
          curl_close($ch);
      }
      // Use fsockopen
      else {
          $pfHost = preg_replace('%^https://%', '', $pfHost);
          pflog("using fsockopen (ssl://{$pfHost}, 443, errno, errstr, {PF_TIMEOUT})");
          // Variable initialization
          $header = '';
          $res = '';
          $headerDone = false;
		  $response = '';

          // Construct Header
          $header = "POST /eng/query/validate HTTP/1.0\r\n";
          $header .= "Host: " . $pfHost . "\r\n";
          $header .= "User-Agent: " . PF_USER_AGENT . "\r\n";
          $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
          $header .= "Content-Length: " . strlen($pfParamString) . "\r\n\r\n";

          // Connect to server
          if (!$socket = fsockopen('ssl://' . $pfHost, 443, $errno, $errstr, PF_TIMEOUT)) {
              pflog("fsockopen[$pfHost] errno[$errno] errstr[$errstr] returned FALSE");
              return false;
          }

          // Send command to server
          fputs($socket, $header . $pfParamString);

          // Read the response from the server
          while (!feof($socket)) {
              $line = fgets($socket, 1024);

              // Check if we are finished reading the header yet
              if (strcmp($line, "\r\n") == 0) {
                  // read the header
                  $headerDone = true;
              }
              // If header has been processed
              else
                  if ($headerDone) {
                      // Read the main response
                      $response .= $line;
                  }
          }
      }

      pflog("Response:\n" . print_r($response, true));

      // Interpret Response
      $lines = explode("\r\n", $response);
      $verifyResult = trim($lines[0]);

      if (strcasecmp($verifyResult, 'VALID') == 0) {
          return (true);
      } else {
          return (false);
      }
  }

  /**
   * pfValidIP
   *
   * @author Jonathan Smit
   * @param $sourceIP String Source IP address 
   */
  function pfValidIP($sourceIP)
  {
      // Variable initialization
      $validHosts = array(
          'www.payfast.co.za',
          'sandbox.payfast.co.za',
          'w1w.payfast.co.za',
          'w2w.payfast.co.za',
          );

      $validIps = array();

      foreach ($validHosts as $pfHostname) {
          $ips = gethostbynamel($pfHostname);

          if ($ips !== false)
              $validIps = array_merge($validIps, $ips);
      }

      // Remove duplicates
      $validIps = array_unique($validIps);

      pflog("Valid IPs:\n" . print_r($validIps, true));

      if (in_array($sourceIP, $validIps)) {

          return (true);
      } else {

          return (false);
      }
  }

  /**
   * pfAmountsEqual
   * 
   * Checks to see whether the given amounts are equal using a proper floating
   * point comparison with an Epsilon which ensures that insignificant decimal
   * places are ignored in the comparison.
   * 
   * eg. 100.00 is equal to 100.0001
   *
   * @author Jonathan Smit
   * @param $amount1 Float 1st amount for comparison 
   * @param $amount2 Float 2nd amount for comparison
   */
  function pfAmountsEqual($amount1, $amount2)
  {
      if (abs(floatval($amount1) - floatval($amount2)) > PF_EPSILON)
          return (false);
      else
          return (true);
  }

?>