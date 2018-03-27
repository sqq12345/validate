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
    $mail->isSMTP();  
    $mail->SMTPDebug  = 0;   
    $mail->Host = $row['mail_host'];  
    $mail->Port = $row['mail_port'];   
    $mail->SMTPAuth = true;  
    $mail->Username = $row['mail_username'];  
    $mail->Password = $row['mail_pwd'] ;  
    $mail->CharSet = 'utf-8';
    $mail->From = $row['mail_username'];   
    $mail->FromName =$row['mail_fromname'];  
    $mail->addAddress($to,$toname);  
    $mail->isHTML(true); 
    $mail->Subject = $subject;
    $message.='<hr /><p>'.$row['mail_fromname'].'</p><p>'.date('Y-m-d').'</p>';
    $mail->MsgHTML($message);
    
    if(!$mail->send()){
       return $mail->ErrorInfo;
    }else{
        return 'Y';
    }
    
    
}