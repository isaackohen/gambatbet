<?php (defined('BASEPATH')) OR exit('No direct script access allowed'); ?><!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>General Error | Simple Forum</title>
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Ruda:400,700,900">
    <style type="text/css">
    body { margin: 0; padding: 10px; background-color: #ed5565; font-family: "Ruda",sans-serif; color: #FFF; }
    .middle-box { margin: 0 auto; max-width: 400px; padding-top: 30px; z-index: 100; text-align: center; }
    .middle-box h1 { font-size: 100px; color:white; margin:0; }
    </style>
</head>

<body class="bg-theme04">
    <div class="middle-box animated fadeInDown">
        <h1>Error!</h1>
        <h3 style="font-weight:bold;"><?php echo $heading; ?></h3>
        <div style="color:#F5F5F5;">
            <?php echo $message; ?>
        </div>
    </div>
</body>

</html>