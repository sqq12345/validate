<?php
namespace Admin\Controller;
use Util\Excel;
use Util\Upload;
class ConfigController extends BaseController {    
    function index(){
        //站点配置
        if(IS_POST){
            $up=new Upload(204800);
            $arr=$up->addImg();
            if($arr){
                $_POST['logo']=$arr[0];
            }
            unset($_POST['checking']);
           $this->setConfig(I('post.'));
           echo 'y';
           die;
        }
        $row=getConfig('web_title,web_keywords,web_address,web_tel,web_email,web_beian,web_description,logo');
        //print_r($row);die;
        $this->assign('row',$row);
        $this->display();
    }
    
    
    function email(){
       //邮件配置
        if(IS_POST){            
            $this->setConfig(I('post.'));
            echo 'y';
            die;
        }
        $row=getConfig('mail_host,mail_port,mail_username,mail_pwd,mail_from,mail_fromname');
        $this->assign('row',$row);
        $this->display();  
    }
    
    
    function advert(){
        //广告配置
        
        if(IS_POST){
        
            $this->setConfig(I('post.'));
            echo 'y';
            die;
        }
        $row=getConfig('');
        $this->assign('row',$row);
        $this->display();
        
    }   
    
    //将用户提交的设置信息提交到数据库
    private function setConfig($data){
        $tb=M('config');
        foreach($data as $k=>$v){
            $i=$tb->where(array('name'=>$k))->count();
            if($i>0){
                $tb->where(array('name'=>$k))->save(array('value'=>$v));
            }else{
                $tb->add(array('name'=>$k,'value'=>$v));
            }
            
        } 
        
    }
    
    /**
     * 导出数据库表结构到excel
     */
    function dbtoxls(){
         
        $style=array('border'=>1,'align'=>'C','fontsize'=>14);
        $xls=new Excel();
        $xls->setTitle('数据库结构表');
        $xls->setWidth ('a', 22 );
        $xls->setWidth ('b', 22 );
        $xls->setWidth ('c', 22 );
        $xls->setWidth ('d', 22 );
        $xls->setWidth ('e', 22 );
        $xls->setWidth ('f', 22 );
        $xls->setWidth ('g', 22 );
        $xls->setWidth ('h', 22 );
        $xls->setWidth ('i', 58 );
        $arr=[['字段名','类型','编码','是否为空','主键','默认值','扩展','权限','注释']];
        $row= $xls->setData('a1', $arr,['bold'=>true,'fontsize'=>16]);
        $tables=M()->query('show table status');        
        
      
       foreach($tables as $tab){
           $xls->mergeCells('a'.$row, 'i'.$row);
          $value=$tab['name'].$tab['comment'];
          $xls->setValue('a'.$row, $value);
          $row++;          
                
          $cols=M()->query('show full fields from '.$tab['name']);
          
          $row=$xls->setData('a'.$row, $cols);
          
           $row++;
       } 
       
       $xls->setStyle('a2', 'i'.$row, $style);
        
       $xls->output('结构表.xls');
    }
    

    
    
}