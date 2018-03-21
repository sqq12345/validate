<?php
namespace Admin\Controller;

class ImageController extends BaseController {
    function index(){
        $this->display();
    }
    
    function getdb(){
        $rows=M('images')->select();
        $this->setDate($rows);
        $this->ajaxReturn($rows);
    }
    
}