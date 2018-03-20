<?php
namespace Admin\Controller;

class GroupController extends BaseController {
    function index(){        
        $this->display();
    }

    function getdb(){
        $rows=M('group')->select();
        $this->setDate($rows);
        $this->ajaxReturn($rows);
    }

    function add(){
       if(IS_POST){
            $_POST['ctime']=time();
            $_POST['level']=implode(',', I('post.level'));           
            $i= M('group')->add(I('post.'));
            if($i>0){
                $this->getJson(1);
            }else{
                $this->getJson(21);
            }          
       }
       
        $rows=M('action')->field('id,title')->select();
        $this->assign('actions',$rows);
        $this->display();
    }

  
    
    function edit($id=0){
        if($id>0){
            $group=M('group');
            $row=$group->find($id);
            if($row){
                if(IS_POST){
                    $_POST['level']=implode(',', I('post.level'));
                    $_POST['utime']=time();
                    $group->where(array('id'=>$id))->save(I('post.'));
                    $this->getJson(2);
                }
               
                $this->assign('row',$row);
                $rows=M('action')->field('id,title')->select();
                $this->assign('actions',$rows);
                $this->assign('type','edit');
                $this->display();
                
            }else{
                die('该记录没有找到，可能已删除');
            }
            
        }else{
            die('该记录没有找到，可能已删除');
        }
        
    }
    
    function del($id=0){
        if($id>0){
           $i= M('group')->where(array('id'=>$id))->delete();
            if($i>0){
                $this->getJson(3);
            }else{
                $this->getJson(23);
            }
        }
    }

}

