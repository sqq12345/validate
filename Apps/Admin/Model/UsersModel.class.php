<?php
namespace Admin\Model;

use Think\Model;
use Think\Crypt;

class UsersModel extends Model{
    
    private $authcode='yT94?B0q';
    private $cookt=28800;
    private $authc='77eYc8';
    private $tokenc='0Ops51';
        
    
    function addUser($data){
        if($this->create($data)){
            $this->add();
            return 'y';
        } 
        return $this->getError();
    }
    
    function editUser($id,$data){
        if($this->create($data)){
            $this->where(array('id'=>$id))->save();
            return 'y';
        }
        return $this->getError();
    }
    
    function checkPwd($data){
        if(!empty($data['username'])){
            $row=$this->where(array('username'=>$data['username']))->find();
            if($row){
                $pwd=$this->md5($data['password'],$row['salt']);
                if($pwd==$row['password']){
                    $arr=array('lastlogin'=>time(),'lastip'=>get_client_ip());
                    $this->where(array('id'=>$row['id']))->save($arr);
                    session('username',$row['username']);
                    session('nkname',$row['nkname']);
                    session('groupid',$row['groupid']);
                    if($data['remember']){                        
                        $auth_arr=array(Crypt::encrypt($row['username'], $this->authc),Crypt::encrypt($pwd, $this->tokenc));
                        cookie('_auth_',$auth_arr,$this->cookt);                        
                    }
                    return true;
                }  
            }            
        }       
        return false;
    }
    
    function logout(){        
        session(null);
        cookie('_auth_',null);
        //cookie('_token_',null);        
        redirect(U('login/index'));
    }
    
    /**
     * 检测用户是否已登录
     * @return boolean
     */
    function checkLogin(){
        if(!session('?username')){
            $cook_u=cookie('_auth_');
            if(empty($cook_u)){              
                return false;
            }else{  
                
                $cook_u=Crypt::decrypt($cook_u[0], $this->authc);
                $cook_p=Crypt::decrypt($cook_u[1], $this->tokenc);
                
                $row=$this->where(array('username'=>$cook_u,'password'=>$cook_p))->find();
                if($row){
                    session('username',$row['username']);
                    session('nkname',$row['nkname']);
                    session('groupid',$row['groupid']);
                    return true;
                }else{
                    cookie('_auth_',null);                   
                   return false;
                }
                
            }
            
        }
        
        return true;
        
    }
    
    function checkLevel(){
        if(session('groupid')==1){
            return true;
        }
        $levelurl=MODULE_NAME.'/'.CONTROLLER_NAME.'/'.ACTION_NAME;
        $levelurl=strtolower($levelurl);
        $id=M('action')->where(array('url'=>$levelurl))->getField('id');
        if($id){
            $level=M('group')->where(array('id'=>session('groupid')))->getField('level');
            if($level){
                $levelarr=explode(',',$level);
                if(in_array($id,$levelarr)){
                    return true;
                }else{
                    return false;
                }
            }else{
                // 如果通过session中的组ID没有找到权限，表示没有权限
                return false;
            }

        }else{
            return true;
        }
    }

    function md5($str,$salt=''){
        $str=md5($str);
        $arr=array($str,$this->authcode,$salt);        
        sort($arr);
        $str=implode('',$arr);
        return md5($str);  
        
    }
    
    
    function getRandStr($len=8){
        $str='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789?%$#@!()';        
        $strlen=strlen($str)-1;
        $result='';
        for($i=0;$i<$len;$i++){
            $j=rand(0,$strlen);
            $result.=substr($str,$j,1);
            
        }
        
        return $result;
        
    }
    
    function addDefaultUser($username='admin',$password='admin',$nkname='Admin'){
        
        $row=$this->where(array('username'=>$username))->find();
        if(!$row){
            $salt=$this->getRandStr();
            $pwd=$this->md5($password,$salt);
            $data=array(
                'username'=>$username,
                'nkname'=>$nkname,
                'ctime'=>time(),
                'status'=>1,
                'password'=>$pwd,
                'salt'=>$salt,
                'groupid'=>1,
                'email'=>'admin@test.com' 
                
            );
            
            $this->addUser($data);
        }
        
    }
    
    
    
}

