<?php if (!defined('THINK_PATH')) exit();?>

    <form id="ff" method="post">
        <p>
            <label>用户名:</label>
            <input class="easyui-textbox" type="text" name="username" data-options="width:220,height:28" />
        </p>
        <p>
            <label >呢称:</label>
            <input class="easyui-textbox" type="text" name="nkname"  data-options="width:220,height:28" />
        </p>
        <p>
            <label >邮箱:</label>
            <input class="easyui-textbox" type="text" name="email"  data-options="width:220,height:28" />
        </p>
        <p>
            <label >用户组:</label>
            <input class="easyui-textbox" type="text" name="groupid"  data-options="width:220,height:28" />
        </p>
        <p>
            <label> </label>
             <a id='submit' class="easyui-linkbutton" data-options="iconCls:'icon-ok'" >提交</a>
        </p>
    </form>
	<script>
//添加修改表单提交
var type='<?php echo ((isset($type) && ($type !== ""))?($type):"add"); ?>';
$('#submit').linkbutton({
	onClick:function(){
		$('#ff').form('submit', {    
		    url:'/index.php/Admin/User/add.html?_=1521516779865',    
		    onSubmit: function(param){    
		          var isvalidate=$(this).form('validate');
		          return isvalidate;
		    },    
		    success:function(data){		    	 
		   		var data=eval('('+data + ')');
		   		if(data.code<10){
		   			if(type=='add'){
		   				$('#win').window('refresh');
		   			}else{
		   				$('#win').window('close');
		   			}
		   			
		   		}else{
		   			layer.msg(data.msg);  
		   		}
		        
		   		 
		    }    
		});  

		
	}
});
</script>