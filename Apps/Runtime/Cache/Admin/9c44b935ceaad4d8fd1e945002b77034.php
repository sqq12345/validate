<?php if (!defined('THINK_PATH')) exit();?><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <base href="<?php echo (C("BASE")); ?>">
    <link rel="stylesheet" type="text/css" href="ui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">  
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <script type="text/javascript" src="ui/jquery.min.js"></script>     
    <script type="text/javascript" src="ui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="ui/locale/easyui-lang-zh_CN.js"></script> 
    <script src='layer/layer.js'></script>    
    <title>后台管理</title> 
    <style>
       
        #aa div p a{display:block;width:150px;height:25px;padding:0 10px;color:#333;line-height: 25px;text-decoration: none;}
         #aa div p a:hover{background-color:rgb(161, 161, 230);color:#eee;}
    </style>   
</head>
<body>
<div id="win" class="easyui-window" data-options="iconCls:'icon-add',modal:true,closed:true,title:'操作',collapsible:false,minimizable:false,
			maximizable:false,width:600,height:400"></div>   
 



<table id='tab' class="easyui-datagrid"  data-options="url:'<?php echo U('getdb');?>',pagination:true,fitColumns:true,singleSelect:true,toolbar: '#tool'">
    <thead>
        <tr>
            <th data-options="field:'id',width:100">ID</th> 
            <th data-options="field:'ctime',width:100">添加时间</th>
            <th data-options="field:'utime',width:100">修改时间</th>
            <th data-options="field:'title',width:100">名称</th>                
            <th data-options="field:'url',width:100">操作</th>
            
        </tr>
    </thead>
</table>

<div id="tool">
    <a id='addbtn' class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" >添加</a>
    <a id='editbtn' class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" >修改</a>
    <a id='delbtn' class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">删除</a>
</div> 


 <script>

 /**
  *  显示窗口
  */
 function showWin(url,width,height){
	 width=width?width:600;
	 height=height?height:400;
	 $('#win').window({
		 width:width,
		 heigth:height,
		 
	 });
 	$('#win').window('refresh', url);  
 	$('#win').window('open'); 
 	
 }
 
//当win关闭时刷新tab
 $('#win').window({
 	onClose:function(){
 		$('#tab').datagrid('reload');
 		
 	}
 });

 //删除按钮
 $('#delbtn').linkbutton({
     onClick: function () {
         var currow = $('#tab').datagrid("getSelected");
         if (currow != null) {
         	
         	layer.confirm('确定要删除吗？删除后不可恢复。', {icon:3,title: '删除'}, 
     		function(index){
         		var url = "/index.php/Admin/Action/del/id/" + currow.id;
         		
         		$.post(url,function(data){
         			 							  	    			    	
 			    	layer.msg(data.msg);  
 			    	$('#tab').datagrid('reload');
         			
         		},'json');
         		layer.close(index);
         		
     		});
         } else {
             $.messager.alert('错了', "请先选中一行！", 'warning');
         }
     }
 }); 

 //修改按钮
  $('#editbtn').linkbutton({
     onClick: function () {
         var currow = $('#tab').datagrid("getSelected");
         if (currow != null) {
         	var url = "/index.php/Admin/Action/edit/id/" + currow.id;
         	showWin(url);
         } else {
             $.messager.alert('错了', "请先选中一行！", 'warning');
         }
     }
 }); 
 //添加按钮
 $('#addbtn').linkbutton({
 	onClick:function(){
 		var url="<?php echo U('add');?>";
 		showWin(url);
 	}
 	
 });



 </script>
</body>
</html>