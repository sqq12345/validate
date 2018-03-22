<?php
namespace Admin\Controller;

class ActionController extends BaseController {
    
    private $action=array(
        'index'=>'列表',
        'add'=>'添加',
        'edit'=>'编辑',
        'del'=>'删除',
    );
    public function index(){
        $this->assign('title','操作表');
        $this->display();
        
    }

    public function getdb(){
        $action=M('action');
        $total=$action->count();        
        $rows=M('action')->page(I('post.page',1),I('post.rows',10))->select();
        $this->setDate($rows);
        $this->ajaxReturn(array('total'=>$total,'rows'=>$rows));

    }

    function add(){
        if(IS_POST){            
            $_POST['ctime']=time();
            $arr=explode('|',I('post.other'));            
            $arr=array_merge(I('post.actions',array()),$arr);
            $module=I('post.module');
            $controller=I('post.controller');
            $title=I('post.title');
            $time=time();
            $data=array();
             
            if($arr){
                foreach($arr as $v){
                    if(!empty($v)){
                        $_title=isset($this->action[$v])?"{$title}{$this->action[$v]}":"{$title}_{$v}";
                        $url=strtolower("{$module}/{$controller}/{$v}");
                        $data[]=array(
                            'ctime'=>$time,
                            'title'=>$_title,
                            'url'=>$url
                        );
                    }
                   
                }
            }
             
            M('action')->addAll($data);
            $this->getJson(1);
            
        }        
        $this->display();
    }

    function edit($id=0){
        if($id>0){
            if(IS_POST){
                $_POST['utime']=time();
                $_POST['url']=I('post.module').'/'.I('post.controller').'/'.I('post.action');
                $_POST['url']=strtolower($_POST['url']);
                M('action')->where(array('id'=>$id))->save(I('post.'));
                $this->getJson(2);
            }
            $row=M('action')->find($id);
           
            if($row){
                $arr=explode('/',$row['url']);               
                $this->assign('arr',$arr);
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
            if(IS_POST){                
                M('action')->where(array('id'=>$id))->delete();
                $this->getJson(3);
            }             
        }else{
            die('此ID没有找到，可能已删除了');
        }
        
    }

}