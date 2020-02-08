<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="assert/layui/css/layui.css" />
</head>
<body>
	<button type="button" class="layui-btn" id="test1">
		<i class="layui-icon">&#xe67c;</i>上传图片
	</button>
	<input type="hidden" id="stuImg" />
	<input type="hidden" id="rowId" value="11" />
	<script src="assert/layui/layui.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		layui.use([ 'upload' ], function() {
			var upload = layui.upload;
			var $ = layui.$;
			upload.render({
				elem : '#test1', //绑定元素
				url : 'upload', //上传接口
				field:'uploadFile',
				data:{function(){
					return $("#rowId").val();
				}},
				done : function(res) {
					//上传完毕回调
					console.log(res);
					$("#stuImg").val(res.data);
				},
				error : function() {
					//请求异常回调
				}
			})
		})
	</script>
</body>
</html>