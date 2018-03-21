<?php if (!defined('THINK_PATH')) exit();?>

    <form id="ff" method="post">
        <p>
            <label>名称:</label>
            <input class="easyui-textbox" type="text" name="title" data-options="required:true,width:220,height:28" />
        </p>
         <p>
            <label >模块:</label>
            <input class="easyui-textbox" type="text" name="module"  data-options="required:true,width:220,height:28" />
        </p>
         <p>
            <label >控制器:</label>
            <input class="easyui-textbox" type="text" name="controller"  data-options="required:true,width:220,height:28" />
        </p>
        <p>
            <label >操作:</label>
            <input type="checkbox" name="actions[]" value="index" checked>列表 
            <input type="checkbox" name="actions[]" value="add" checked>新增 
            <input type="checkbox" name="actions[]" value="edit" checked>修改 
            <input type="checkbox" name="actions[]" value="del" checked>删除 
           
        </p>
         <p>
            <label >其它操作:</label>
            <input class="easyui-textbox" type="text" name="other"  data-options="width:220,height:28" />用|隔开多个
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
		    url:'/index.php/Admin/Action/add.html?_=1521616627347',    
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