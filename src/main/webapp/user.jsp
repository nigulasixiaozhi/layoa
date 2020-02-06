<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assert/layui/css/layui.css" />
</head>
<body>
	<form class="layui-form" lay-filter="user_form">
  <div class="layui-form-item">
    <label class="layui-form-label">姓名</label>
    <div class="layui-input-block">
      <input type="text" name="userName" required  lay-verify="required|checkName" placeholder="请输入姓名" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">生日</label>
    <div class="layui-inline">
      <input type="text"  name="userBirthday" id="birthday" required  lay-verify="required" placeholder="请输入生日" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">年龄</label>
    <div class="layui-input-inline">
      <input type="text" name="userAge" required lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">爱好</label>
    <div class="layui-input-block">
      <input type="checkbox" name="userLike[0]" value="0" title="写作">
      <input type="checkbox" name="userLike[1]" value="1" title="阅读" checked>
      <input type="checkbox" name="userLike[2]" value="2" title="发呆">
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label">单选框</label>
    <div class="layui-input-block">
      <input type="radio" name="userSex" value="1" title="男">
      <input type="radio" name="userSex" value="0" title="女" checked>
    </div>
  </div>
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">文本域</label>
    <div class="layui-input-block">
      <textarea name="desc" placeholder="请输入内容" class="layui-textarea"></textarea>
    </div>
  </div>
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<script src="assert/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
layui.use(['form','laydate','layer'], function(){
	  var form = layui.form;
	  var laydate = layui.laydate;
	  var layer = layui.layer;
	  
	  var $ = layui.$;
	  
	  laydate.render({
		    elem: '#birthday' //指定元素
		  });
	  
	  form.verify({
		  checkName:function(value,item){//value：表单的值、item：表单的DOM对象
			  var msg;
			  $.ajax({
				  type:"get",
				  async:false,
				  url:"user/checkName",
				  data:{"userName":value},
				  success:function(res){
					  if(res==0){
						  msg='此名称已被占用';
					  }
				  }
			  	})
			  return msg;
		  }
	  })
	  
	  //监听提交
	  form.on('submit(formDemo)', function(data){
		  var data = form.val("user_form");
		  console.log(data);
	    $.ajax({
	    	type:"post",
	    	url:"user",
	    	data:data,
	    	success:function(res){
	    		if(res){
	    			layer.msg("成功");
	    		}
	    	}
	    })
	    return false;
	  });
	  
	});
</script>	
</body>
</html>