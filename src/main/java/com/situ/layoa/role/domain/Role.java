package com.situ.layoa.role.domain;

import org.apache.ibatis.type.Alias;

import com.situ.layoa.base.BaseClass;

@Alias("role")
public class Role extends BaseClass{
	private static final long serialVersionUID = 1L;
	private String roleCode;//编号
	private String roleName;//名称 唯一
	private Integer roleKind;//角色类型 1：超级角色 0：普通角色
	private String roleInfo;//角色信息
	public String getRoleCode() {
		return roleCode;
	}
	public void setRoleCode(String roleCode) {
		this.roleCode = roleCode;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public Integer getRoleKind() {
		return roleKind;
	}
	public void setRoleKind(Integer roleKind) {
		this.roleKind = roleKind;
	}
	public String getRoleInfo() {
		return roleInfo;
	}
	public void setRoleInfo(String roleInfo) {
		this.roleInfo = roleInfo;
	}
	
}
