<?php
namespace Admin\Controller;
use Util\Upload;
class ImageController extends BaseController {
    
    private $fieldValues=array(
        'ctype'=>array('非成人','成人'),
        'rtype'=>array('无','非清真','清真'),
        'status'=>array('未审核','已审核')
        
    );
    function index(){
        $this->display();
    }
    
    function getdb(){
        $rows=M('images')->select();
        $this->setDate($rows);
        $this->setImg($rows,'name');
        $this->setValue($rows,$this->fieldValues);
        $this->ajaxReturn($rows);
    }
    
    function add(){
        if(IS_POST){
            $upload=new Upload(204800);
            $imgs=$upload->addImg();
            if($imgs){
                $_POST['name']=implode('|', $imgs);
                $_POST['ctime']=time();
                $i= M('images')->add(I('post.'));
                if($i>0){
                    $this->getJson(1);
                }else{
                    $this->getJson(21);
                }                
                
            }else{
                $this->getJson(24);
            }
           
        }
        
        $this->display();
    }
    
    function edit($id=0){
        //只能替换图片，不能删除原来的图片
        if($id>0){
            $images=M('images');
            $row=$images->where(array('id'=>$id))->find();
            if($row){
                if(IS_POST){
                    $upload=new Upload();               
                    $imgs_add=$upload->addImg();
                    if($imgs_add){
                        $_POST['name']=implode('|',$imgs_add);
                        $arr=explode("|",$row['name']);                        
                        $upload->delImg($arr);
                    }
                    $_POST['utime']=time();
                    $i=$images->where(array('id'=>$id))->save(I('post.'));
                    if($i>0){
                        $this->getJson(2);
                    }else{
                        $this->getJson(22);
                    }   
                    
                }
                if(!empty($row['name'])){
                    $files=explode('|',$row['name']);
                    $images=array();
                    foreach($files as $f){
                        $images[]=__ROOT__.'/'.$f;
                    }
                    $this->assign('images',$images);
                    
                }
                $this->assign('row',$row);
                $this->assign('type','edit');
                $this->display();
                
            }else{
                die('此ID没有找到，可能已删除了');
            }
        }else{
            die('此ID没有找到，可能已删除了');
        }
    }
    
    function del($id=0){
        if($id>0){
            $images=M('images');
            $row=$images->field('name')->where(array('id'=>$id))->find();
            if($row){
                 $arr=explode("|",$row['name']);
                  $upload=new Upload();
                  $upload->delImg($arr);
                  $images->where(array('id'=>$id))->delete();
                  $this->getJson(3);
            }else{
                $this->getJson(23);
            }
        }else{
            $this->getJson(23);
        }
        
    } 
    
}