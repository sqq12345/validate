<?php
namespace Admin\Controller;

class MenuController extends BaseController {
    public function index(){
        $this->assign('title','菜单');
        $this->display();
        
    }

    public function getdb(){
     
        $rows=$this->getNames();
        $this->setDate($rows);
        $this->setIcon($rows);
        $this->ajaxReturn($rows);

    }
    
    function getIconImg(){
        if(IS_POST){
            $v=I('post.value');
            $path=M('icons')->where(array('name'=>$v))->getField('path');
            if($path){
                echo "css/icons/{$path}";
            }else{
                echo '';
            }
        }
    }
    function add(){
        if(IS_POST){            
            $_POST['ctime']=time();                       
            M('menu')->add(I('post.'));  
            
            $this->getJson(1);
            
        }
        $arr=$this->getNames();
        $action=M('action')->select();
        $icons=M('icons')->select();
        $this->assign('titles',$arr);
        $this->assign('actions',$action);
        $this->assign('icons',$icons);
        $this->display();
    }

    function edit($id=0){
         if($id>0){
             if(IS_POST){            
                $_POST['utime']=time();  
                if(empty($_POST['hidden'])){
                    $_POST['hidden']=0;
                }
                M('menu')->where(array('id'=>$id))->save(I('post.')); 
               
                $this->getJson(2);
            }

            $row=M('menu')->find($id);
            if($row){
                $this->assign('row',$row);
                $arr=$this->getNames();
                $action=M('action')->select();            
                $this->assign('titles',$arr);
                $this->assign('actions',$action);
                $this->assign('type','edit');
                
                $this->display();
            }else{
                 
                die('此ID没有找到，可能已删除了');
            }
         }else{
             
             die('此ID没有找到，可能已删除了');
         }
       
    }
    
    function getIcons(){
        $icons=M('icons')->field('id,name')->select();
        $this->ajaxReturn($icons);
        //$this->assign('icons',$icons);
    }
    /**
     * 删除菜单以及它的子菜单
     * @param number $id
     */
    function del($id=0){
        if($id>0){
            M('menu')->where(array('id'=>$id,'pid'=>$id,'_logic'=>'or'))->delete();
            $this->getJson(3);
        }else{
            $this->getJson(20);
        }
    }
    
    private  function getNames($pid=0,$arr=array(),$level=0){
        $rows=M('menu')->field('tp_menu.*,tp_action.url')->join("tp_action on tp_action.id=tp_menu.aid",'LEFT')->where(array('tp_menu.pid'=>$pid))->select();
        if($rows){
            foreach($rows as $v){
                $str='';
                for($i=0;$i<$level;$i++){
                    $str.='__';
                }
                $v['title']=$str. $v['title'];

                $arr[]=$v;
                $arr=$this->getNames($v['id'],$arr,$level+1);
            }
        }
        return $arr;

    }
    
    /**
     * 将目录下的icons写入数据库
     */
   private function getAllIcons(){
        $path='.'.C('base').'css/icons/';
        $icons=M('icons');
        
        if(is_dir($path)){
            $list=scandir($path);
            if($list){
                foreach($list as $f){
                    if(is_file($path.$f)){
                        $i=strpos($f,'.png');
                        
                        if($i>0){
                            $name=substr($f,0,$i);
                            $name=str_replace("_", "-", $name);
                            $icons->add(array('name'=>$name,'path'=>$f));
                            echo "path:{$f}  --   name:{$name}<br />";
                        }
                    }
                }
            }
            
        }else{
            echo 1;
        }
        
        
        
    }

}