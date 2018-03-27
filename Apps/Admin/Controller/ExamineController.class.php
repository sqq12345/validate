<?php
namespace Admin\Controller;

class ExamineController extends BaseController {
    function user(){
        if(IS_AJAX){
            $tb=M('customers');
            $count=$tb->count();
            $rows=$tb->page(I('post.page',1),I('post.rows',10))->select();
            $this->setDate($rows);
            $this->ajaxReturn(array('total'=>$count,'rows'=>$rows));
            die;
        }
        $this->display();
    }
    
     
}