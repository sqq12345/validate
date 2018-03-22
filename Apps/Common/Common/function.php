<?php

/**
 * 获取config表中指定的配置项的值，
 * @param string|array $field   指定的配置项，如果用多个用,隔开
 * @return array 
 */
function getConfig($field){
    $result=array();
    $field=explode(',',$field);    
    $rows=M('config')->where(array('name'=>array('in',$field)))->select();
    if($rows){
        foreach($rows as $r){
            $result[$r['name']]=$r['value'];
        }
    }
    
    return $result;
    
}