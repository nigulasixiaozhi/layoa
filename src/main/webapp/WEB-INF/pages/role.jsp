<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assert/layui/css/layui.css" />
</head>
<body>
	<table id="roleList" lay-filter="roleList"></table>

	<form class="layui-form" lay-filter="role_form">
		<div class="layui-form-item">
			<label class="layui-form-label">编号</label>
			<div class="layui-input-inline">
				<input type="text" name="roleCode" required lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				<input type="text" name="roleName" required lay-verify="required|checkName" placeholder="请输入姓名" autocomplete="off" class="layui-input">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">级别</label>
			<div class="layui-input-block">
				<input type="radio" name="roleKind" value="1" title="超级角色"> 
				<input type="radio" name="roleKind" value="0" title="普通角色" checked>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">角色简介</label>
			<div class="layui-input-block">
				<textarea name="roleInfo" placeholder="请输入内容" class="layui-textarea"></textarea>
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
		layui.use([ 'form', 'layer','table' ], function() {
			var form = layui.form;
			var laydate = layui.laydate;
			var layer = layui.layer;
			var table = layui.table;

			var $ = layui.$;

			form.verify({
				checkName : function(value, item) {//value：表单的值、item：表单的DOM对象
					var msg;
					 $.ajax({
						type : "get",
						async : false,
						url : "role/checkName/"+value,
						success : function(res) {
							console.log(res);
							if (res == 0) {
								msg = '此名称已被占用';
							}
						}
					})
					return msg;
				}
			})

			//监听提交
			form.on('submit(formDemo)', function(data) {
				var data = form.val("role_form");
				//console.log(data);
				$.ajax({
					type : "post",
					url : "role",
					data : data,
					success : function(res) {
						if (res) {
							layer.msg("成功");
							table.reload('roleList', {
								  url: 'role/findAll'
								});
						}
					}
				})
				return false;
			});
			
			 table.render({
				    elem: '#roleList',
				    height: 312,
				    url: 'role/findAll', //数据接口
				    cols: [[ //表头
				      {field: 'roleCode', title: '编号', width:'25%', sort: true, fixed: 'left'},
				      {field: 'roleName', title: '名称', width:'25%'},
				       {field: 'roleKind', title: '角色级别', width:'25%',templet: function(d){
				          return d.roleKind==1?'超级角色':'普通角色'
				      }}, 
				      {field: 'roleInfo', title: '角色简介', width:'25%'},
				    ]]
				  });

		});
	</script>
</body>
</html>