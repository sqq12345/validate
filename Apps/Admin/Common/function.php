<?php
function wrlog($str,$type='info'){
    $type=strtoupper($type);
    $file='dolist.log';
    $data=date('Y-m-d H:i:s').' '.__SELF__."\r\n [{$type}]:".$str."\r\n";
    file_put_contents($file, $data,FILE_APPEND);
    
}