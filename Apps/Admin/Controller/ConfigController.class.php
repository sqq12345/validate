<?php
namespace Admin\Controller;
use Util\Excel;
class ConfigController extends BaseController {
    function index(){
        $this->display();
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