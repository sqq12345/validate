<?php
namespace Admin\Controller;
use Think\Controller;
class BaseController extends Controller {
    function __construct(){
        parent::__construct();
        $user=D('users');

        if($user->checkLogin()){
            //如果已登录，不能再去登录页面
            if(CONTROLLER_NAME=='Login' && ACTION_NAME=='index'){
                 
                $url=U('index/index');
                echo "<script>window.top.location='$url';</script>";
            }            
        }else{
            //如果没有登录，只能去登录 页面
            if(CONTROLLER_NAME!='Login'){
                 
                $url=U('login/index');
                echo "<script>window.top.location='$url';</script>";
            }  
        }
       if(!$user->checkLevel()){
           die('您没有访问此页面的权限，请与管理员联系！');
       }        
    }
    
    function logout(){
        
        D('users')->logout();
    }

    /**
     * 将数组中的时间戳字段转换为时间格式
     */
   protected function setDate(&$data,$field=array('ctime','utime'),$format='Y-m-d H:i:s'){
        foreach($data as &$v){
            foreach($field as $ctime){          
                if(!empty($ctime)){
                    if(!empty($v[$ctime])){
                        $v[$ctime]=date($format,$v[$ctime]);
                    }else{
                        $v[$ctime]='';
                    }
                }
            }

        }
    }
    
    
    protected function setImg(&$data,$field='image',$width=50,$height=50){
        $style=$width>0?"width:{$width}px;":'';
        $style.=$height>0?"height:{$height}px;":'';
        $fields=explode(',',$field);
        foreach($data as &$v){
            foreach($fields as $img){
                if(!empty($img)){
                    $images=explode('|',$v[$img]);
                    $str="";
                    foreach($images as $f){
                        $file=__ROOT__.'/'.$f;
                        $str.="<img src='{$file}' alt='loading...' style='{$style}' />";
                    }
                     
                    $v[$img]=$str;
                }
            }
            
        }
         
    }
    /**
     * 设置图标
     * @param unknown $data
     * @param string $field
     * @param number $width
     * @param number $height
     */
    protected function setIcon(&$data,$field='icon',$width=16,$height=16){
        $style=$width>0?"width:{$width}px;":'';
        $style.=$height>0?"height:{$height}px;":'';
        $fields=explode(',',$field);
        foreach($data as &$v){
            foreach($fields as $img){
                if(!empty($v[$img])){
                    $f='css/icons/'.str_replace('-', '_', $v[$img]).'.png';
                    $v[$img]="<img src='{$f}' alt='loading...' style='{$style}' />";
                     
                }
            }
            
        }
    }
    
    /**
     * 根据提供的值修改数组中某个字段的值
     * @param array $data
     * @param array $arr
     */
    protected function setValue(&$data,$arr){
        foreach($data as &$row){
            foreach($arr as $k=>$v){
                if(isset($row[$k])&&isset($v[$row[$k]])){
                    $row[$k]=$v[$row[$k]];
                    
                }
            }
             
        }
        
        
    }
    protected function getJson($code=0,$msg='',$url=''){
        $arr=array(
             
            '0'     =>      '执行成功了',
            '1'     =>      '添加成功',
            '2'     =>      '修改成功',
            '3'     =>      '删除成功',
            '4'     =>      '上传成功',
            '5'     =>      '发送成功',
            '20'    =>      '执行失败',
            '21'    =>      '添加失败',
            '22'    =>      '修改失败',
            '23'    =>      '删除失败',
            '24'    =>      '上传失败',
            '25'    =>      '发送失败',
            '30'    =>      '表单验证失败',
            '31'    =>      '用户名不能为空',
            '32'    =>      '你不够帅',
            
            
        );
        $result=array();
        $result['code']=isset($arr[$code])?$code:'1000';    
        $result['msg']=empty($msg)?$arr[$code]:$msg;
        $result['url']=empty($url)?__SELF__:$url;
        
        $this->ajaxReturn($result);
        
    }
   
    
}