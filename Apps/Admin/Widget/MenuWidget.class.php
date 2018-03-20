<?php
namespace Admin\Widget;
use Think\Controller;
class MenuWidget extends Controller {   

    function getMenu(){
       $menu=M('menu');
       $action=M('action');
       $gid=session('groupid');
       $mainMenu=$menu->field('id,title,aid,icon')->where(array('pid'=>0,'hidden'=>0,'deleted'=>0))->select();
       $level=M('group')->where(array('id'=>$gid))->getField('level');
       $level=explode(',',$level);
        
       $data=array();
       foreach($mainMenu as $v){
            $subMenu=$menu->field('id,title,aid,icon')->where(array('pid'=>$v['id'],'hidden'=>0,'deleted'=>0))->order('sort desc')->select();
            if($subMenu){
                foreach($subMenu as $av){
                    if(in_array($av['aid'],$level)or($gid==1)){
                        $herf=$action->where(array('id'=>$av['aid']))->getField('url');
                        $herf=U($herf);
                        if(!empty($av['icon'])){
                            $img='css/icons/'.str_replace('-', '_', $av['icon']).'.png';                          
                        }else{
                            $img='css/icons/folder.png';                          
                        }
                        $data[$v['title']][]=array(
                            'title'=>$av['title'],
                            'icon'=>$av['icon'],
                            'img'=>$img,
                            'url'=>$herf
                        );
                        
                    }
                }
            }
              
              
       }
      
       
        $this->assign('data',$data);
        $this->display('menu/widget');
    }

   
}
