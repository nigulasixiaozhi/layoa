<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assert/layui/css/layui.css"/>
</head>
<body>
	<button id="add" type="button" class="layui-btn">新增</button>
	<div class="layui-row">
	    <div class="layui-col-md8">
		    <form class="layui-form" action="">
				<div class="layui-inline">
			    <label class="layui-form-label">选择框</label>
			    <div class="layui-input-inline">
			      <select name="roleKind">
			      	<option value="">请选择</option>
			        <option value="1">超级角色</option>
			        <option value="0">普通角色</option>
			      </select>
			    </div>
			  </div>		
			   <div class="layui-inline">
			   			<label class="layui-form-label">输入框</label>
			   			<div class="layui-input-inline">	
			      		<input type="text" name="roleName" required  placeholder="请输入名称" autocomplete="off" class="layui-input">
			   	 		</div>
			  	</div>
			  	<div class="layui-inline">
	    			<div class="layui-input-inline">
	     				 <button class="layui-btn" lay-submit lay-filter="formSearch">搜索</button>
	      					<button type="reset" class="layui-btn layui-btn-primary">重置</button>
	    			</div>
  				</div>
			 </form>
		</div>
  </div>
	<table id="roleList" lay-filter="roleList"></table>

<script src="assert/layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script type="text/html" id="barDemo">
  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>
<script type="text/javascript">
		layui.use([ 'form', 'layer','table' ], function() {
			var form = layui.form;
			var laydate = layui.laydate;
			var layer = layui.layer;
			var table = layui.table;

			var $ = layui.$;
			
			//打开添加弹窗
			$("#add").click(function(){
				$.ajax({
					type:"get",
					url:"role/roleAdd",
					success:function(res){
						layer.open({
							area:'500px',
							type:1,
							content:res
						})
					}
				})
				
			})
			
			//自定义效验
			form.verify({
				checkName : function(value, item) {//value：表单的值、item：表单的DOM对象
					var msg;
					//判断是否有修改的值的id
					var rowId =$("#rowId").val();
					 $.ajax({
						type : "get",
						async : false,
						url : "role/checkName/"+value+'/'+rowId,
						success : function(res) {
							if (res == 0) {
								msg = '此名称已被占用';
							}
						}
					})
					return msg;
				}
			})

			//搜索按钮
			form.on('submit(formSearch)',function(data){
				console.log(data.field);
				 table.reload('roleList',{
					 where : data.field,
					  page: {
						    curr: 1 //重新从第 1 页开始
						  }
				  });
				 return false;
			})
			
			//表格按钮提交
			form.on('submit(formDemo)', function(data) {
				var data = form.val("role_form");
				var type = "post";
				var msg = "添加成功";
				//console.log(data);
				if($("#rowId").val()){
					//修改角色
					type = "put";
					msg = "修改成功"
				}
					//添加角色
					$.ajax({
						type : type,
						url : "role",
						data : data,
						success : function(res) {
							if (res) {
								layer.msg(msg);
								table.reload('roleList');
								layer.closeAll('page'); 
							}
						}
					})
							
				return false;
			});
			
			//表格渲染
			 table.render({
				    elem: '#roleList',
				    height: 312,
				    page:true,
				    limit:3,
				    limits:[3,6,9,12],
				    url: 'role/findAll', //数据接口
				    cols: [[ //表头
				      {field: 'roleCode', title: '编号', sort: true, fixed: 'left'},
				      {field: 'roleName', title: '名称'},
				       {field: 'roleKind', title: '角色级别',templet: function(d){
				          return d.roleKind==0?'<span class="layui-badge layui-bg-green">普通角色</span>':'<span class="layui-badge layui-bg-cyan">超级角色</span>'
				      }}, 
				      {field: 'roleInfo', title: '角色简介'},
				      {fixed: 'right', width:150, align:'center',width:200, toolbar: '#barDemo'} 
				    ]]
				  });
			//监听工具条 
			 table.on('tool(roleList)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
			   var data = obj.data; //获得当前行数据
			   var layEvent = obj.event; //获得 lay-event 对应的值（也可以是表头的 event 参数对应的值）
			   var tr = obj.tr; //获得当前行 tr 的 DOM 对象（如果有的话）
			 /*   console.log(data);
			   console.log(layEvent);
			   console.log(tr); */
			   //修改角色
			   if(layEvent=='edit'){
				   $.ajax({
						type:"get",
						url:"role/roleEdit/"+data.rowId,
						success:function(res){
							layer.open({
								area:'500px',
								type:1,
								content:res
							})
						}
					})
			   }
			   //删除角色
				if(layEvent=='del'){
					layer.confirm('是否要删除?', {title:'提示'}, function(index){
						  $.ajax({
							  type:"delete",
							  url:"role/"+data.rowId,
							  success:function(res){
								  if(res){
									  table.reload('roleList',{
										  page: {
											    curr: 1 //重新从第 1 页开始
											  }
									  });
									  layer.close(index);
								  }
							  }
						  })
					});
			   }
			 });

		});
</script>
</body>
</html>