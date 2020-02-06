package com.situ.layoa.role.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.situ.layoa.role.domain.Role;

@Repository
public interface RoleDao {
	
	Long add(Role role);
	
	List<Role> findAll();
	
	String checkName(String roleName);
	
}
