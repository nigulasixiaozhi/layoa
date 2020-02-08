<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<form id="role_add_edit" class="layui-form" lay-filter="role_form">
		<div class="layui-form-item">
			<label class="layui-form-label">编号</label>
			<div class="layui-input-inline">
				<input type="text" name="roleCode" required lay-verify="required" placeholder="请输入编号" autocomplete="off" class="layui-input" value="${role.roleCode}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">姓名</label>
			<div class="layui-input-block">
				<input type="text" name="roleName" required lay-verify="required|checkName" placeholder="请输入姓名" autocomplete="off" class="layui-input" value="${role.roleName}">
			</div>
		</div>
		<div class="layui-form-item">
			<label class="layui-form-label">级别</label>
			<div class="layui-input-block">
				<input type="radio" name="roleKind" value="1" title="超级角色" ${role.roleKind==1?'checked':'' }> 
				<input type="radio" name="roleKind" value="0" title="普通角色" ${role.roleKind==0?'checked':'' }>
			</div>
		</div>
		<div class="layui-form-item layui-form-text">
			<label class="layui-form-label">角色简介</label>
			<div class="layui-input-block">
				<textarea name="roleInfo" placeholder="请输入内容" class="layui-textarea">${role.roleInfo }</textarea>
			</div>
		</div>
		<div class="layui-form-item">
			<div class="layui-input-block">
				<input id="rowId" type="hidden" name="rowId" value="${role.rowId}" />
				<button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
				<button type="reset" class="layui-btn layui-btn-primary">重置</button>
			</div>
		</div>
	</form>
<script type="text/javascript">
	layui.use('form',function(){
		var form = layui.form;
		form.render(null,'role_form');
	})
</script>