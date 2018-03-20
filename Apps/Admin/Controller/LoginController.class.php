<?php
namespace Admin\Controller;
use Think\Verify;
class LoginController extends BaseController {
    public function index(){
        
       if(IS_POST){
           if(D('users')->checkPwd(I('post.'))){
               $this->redirect('index/index');
           }else{
               $this->assign('error','用户名或密码错误，请注意密码区分大小写');
           }
           
       }
        
        $this->display();
        
    }

    function getCode(){
        $verify=new Verify();
        $verify->entry();

    }

    function checkcode(){
        $verify=new Verify();
        if($verify->check(I('get.code'))){
            echo 1;
        }else{
            echo 0;
        }
    }
}