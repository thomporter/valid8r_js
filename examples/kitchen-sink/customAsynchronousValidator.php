<?php

$v = @$_GET['value'];
$array = Array('err' => false);
if ($v != 'custom') $array['err'] = 'Example error from custom asynchronous validator';
echo json_encode($array);
