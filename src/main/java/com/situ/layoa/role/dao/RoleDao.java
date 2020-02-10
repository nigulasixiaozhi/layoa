package com.situ.layoa.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.situ.layoa.role.domain.Role;

@Repository
public interface RoleDao {
	
	Long add(Role role);
	
	List<Role> findAll(@Param("currPage") Integer curr,@Param("pageSize") Integer limit,@Param("searchParam") Role role);
	
	Role findById(Long rowId);
	
	void update(Role role);
	
	void del(Long rowId);
	
	String checkName(String roleName);
	
	Integer sumCount(@Param("searchParam")Role role);
}
