package com.situ.layoa.role.service;

import com.situ.layoa.base.DataClass;
import com.situ.layoa.role.domain.Role;

public interface RoleService {
	
	Long add(Role role);
	
	DataClass<Role> findAll();
	
	Integer checkName(String roleName);

}
