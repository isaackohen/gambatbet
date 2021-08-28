<?php
  /**
   * Language Manager
   *
   * @package Yoyo Framework
   * @author yoyostack.com
   * @copyright 2015
   */
  
  if (!defined("_YOYO"))
	  die('Direct access to this location is not allowed.');
?>
<h3 class="header"> <?php echo Lang::$word->LG_SUB5;?> </h3>
<form method="post" id="yoyo_form" name="yoyo_form">
  <div class="yoyo segment form">
    <div class="yoyo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_NAME;?> <i class="icon asterisk"></i></label>
      </div>
      <div class="field">
        <input type="text" placeholder="<?php echo Lang::$word->LG_NAME;?>" name="name">
      </div>
    </div>
    <div class="yoyo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_AUTHOR;?></label>
      </div>
      <div class="field">
        <input type="text" placeholder="<?php echo Lang::$word->LG_AUTHOR;?>" name="author">
      </div>
    </div>
    <div class="yoyo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_COLOR;?></label>
      </div>
      <div class="field">
        <div class="yoyo fluid right action input">
          <input type="text" name="color" readonly>
          <div class="yoyo big empty link label" data-lang-color="true"></div>
        </div>
      </div>
    </div>
    <div class="yoyo fields align-middle">
      <div class="field four wide labeled">
        <label class="content-right mobile-content-left"><?php echo Lang::$word->LG_ABBR;?> <i class="icon asterisk"></i></label>
      </div>
      <div class="field">
        <input type="text" placeholder="<?php echo Lang::$word->LG_ABBR;?>" name="abbr">
      </div>
    </div>
  </div>
  <div class="content-center">
    <a href="<?php echo Url::url("/admin/languages");?>" class="yoyo simple small button"><?php echo Lang::$word->CANCEL;?></a>
    <button type="button" data-action="processLanguage" name="dosubmit" class="yoyo primary button"><?php echo Lang::$word->LG_SUB5;?></button>
  </div>
</form>