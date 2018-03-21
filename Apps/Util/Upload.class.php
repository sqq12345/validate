<?php
namespace Util;
use Think\Upload as tupload;
/**
 * 调用ThinkPHP上传、确认、删除图片 
 * 
 * @author fzf 2017/12/21
 *
 */
class Upload{
    public $rootPath='Public/Uploads/';
    public $checked='checked';
    public $checking='checking';
     
    
    function __construct(){
        if(!is_dir($this->rootPath)){
            mkdir($this->rootPath,777,true);
        }
    }
    
    /**
     * 上传图片，会比较POST中的数组，会删除用户不想上传的图片
     * @return array 最后确定已上传的图片地址数组
     */
    function addImg(){
        $result=array();
        $upload = new tupload();
        $upload->maxSize   =    204800; 
        $upload->exts      =     array('jpg', 'gif', 'png', 'jpeg'); 
        $upload->rootPath  =$this->rootPath;  
        $info   =   $upload->upload();
        if($info){
            $arr=I('post.'.$this->checking);
            foreach($info as $k=>$v){
                $v=$this->rootPath.$v['savepath'].$v['savename'];
                if(in_array($k,$arr)){
                    $result[]=$v;                    
                }else{
                   
                    if(is_file($v)){
                        unlink($v);
                    } 
                    
                }
            }
        }
        return $result;
        
    }
    
    /**
     * 获取一个文件的绝对路径，如果文件存在，就返回此绝对路径，否则返回false
     * 
     * 这里不要绝对路径，没有存在的价值
     * 
     * @param string $path
     * @return string|boolean
     */
    private function getPath($path){
         if(!empty($path)){               
              $f=$path;               
              if(is_file($f)){                   
                  return $f;
              }
         }
         
         return false;
     }
     
     
     /**
      * 比对POST中的$this->checked数组，删除用户想删除已上传的图片
      * @param array $paths
      * @return array 最后确认保留的图片
      */
     function checkImg($paths){
         $result=array();
         $arr=I('post.'.$this->checked);
         if(is_array($paths)){
             foreach($paths as $k=>$path){
                 if(in_array($k,$arr)){
                     $result[]=$path;                     
                 }else{
                    
                     if(is_file($path)){
                         unlink($path);
                     } 
                 }
             }
         }
         return $result;
     }
     
     
     /**
      * 删除指定的图片数组
      * @param array $paths
      */
     function delImg($paths){
         if(is_array($paths)){
             foreach($paths as $k=>$path){                
                 
                 if(is_file($path)){
                     unlink($path);
                 } 
             }
         }
     }
    
}