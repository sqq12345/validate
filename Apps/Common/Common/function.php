<?php

/**
 * 获取config表中指定的配置项的值，
 * @param string $field   指定的配置项，如果用多个用,隔开
 * @return array 
 */
function getConfig($field){
    $result=array();
    $field=explode(',',$field);    
    $rows=M('config')->where(array('name'=>array('in',$field)))->select();
    if($rows){
        foreach($rows as $r){
            $result[$r['name']]=$r['value'];
        }
    }
    
    return $result;
    
}

function sendMail($to,$toname,$subject,$message){
    
    vendor('phpmailer.PHPMailerAutoload');
    $row=getConfig('mail_host,mail_port,mail_username,mail_pwd,mail_from,mail_fromname');
    $mail=new \PHPMailer();
    $mail->isSMTP(); // 使用SMTP
    $mail->SMTPDebug  = 0;  // 不开启调试
    $mail->Host = $row['mail_host']; //SMTP地址
    $mail->Port = $row['mail_port'];  //SMTP端口号 25
    $mail->SMTPAuth = true; // Enable SMTP authentication
    $mail->Username = $row['mail_username']; // SMTP 用户名 '13886128089@163.com'
    $mail->Password = $row['mail_pwd'] ; // SMTP 密码's123456'
    $mail->CharSet = 'utf-8';
    $mail->From = $row['mail_username'];  //发件人邮箱'13886128089@163.com'
    $mail->FromName =$row['mail_fromname']; //发件人姓名
    $mail->addAddress($to,$toname); // 添加一个收件人
    $mail->isHTML(true);// 使用HTML格式
    $mail->Subject = $subject;
    $message.='<hr /><p>'.$row['mail_fromname'].'</p><p>'.date('Y-m-d').'</p>';
    $mail->MsgHTML($message);
    
    if(!$mail->send()){
       return $mail->ErrorInfo;
    }else{
        return 'Y';
    }
    
    
}