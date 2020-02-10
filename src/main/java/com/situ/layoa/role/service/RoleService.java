package com.situ.layoa.role.service;

import com.situ.layoa.base.LayResult;
import com.situ.layoa.role.domain.Role;

public interface RoleService {
	
	Long add(Role role);
	
	LayResult findAll(Integer curr,Integer limit,Role role);
	
	Role findById(Long rowId);
	
	Integer update(Role role);
	
	Integer del(Long rowId);
	
	Integer checkName(String roleName,Long rowId);
	
}
