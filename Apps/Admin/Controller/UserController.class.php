<?php
namespace Admin\Controller;

class UserController extends BaseController {

    function index(){

        $this->display();
    }
    
    function getdb(){
        $data=M('users')->field("tp_users.*,tp_group.title,tp_group.level")->join("tp_group on tp_group.id=tp_users.groupid")->select();
        $this->setDate($data,array('utime','ctime','lastlogin'));
        $this->ajaxReturn($data);
    }
    
    function add(){
        $this->display();
    }
    
    function edit(){
        $this->display();
    }
    
}