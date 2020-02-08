package com.situ.layoa.role.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.base.LayResult;
import com.situ.layoa.role.dao.RoleDao;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{
	@Autowired
	private RoleDao roleDao;
	
	
	@Override
	public Long add(Role role) {
		role.setCreateBy("admin");
		role.setCreateDate(new Date());
		role.setActiveFlag(1);
		return this.roleDao.add(role);
	}


	@Override
	public LayResult findAll(Integer curr,Integer limit) {
		Integer currPage = (curr-1)*limit;
		List<Role> roleList =  this.roleDao.findAll(currPage,limit);
		Integer count = this.roleDao.sumCount();
		LayResult result = new LayResult(0, "",count, roleList);
		return result;
	}


	@Override
	public Integer checkName(String roleName,Long rowId) {
		Integer check = 1;
		String name = this.roleDao.checkName(roleName);
		if (name!=null) {
			check = 0;
		}
		if(rowId!=null) {//如果是修改，那么名字可以是本身但效验不能报无法修改
			Role role = this.roleDao.findById(rowId);
			if(role.getRoleName().equals(roleName)) {
				check =1;
			}
		}
		
		return check;
	}


	@Override
	public Role findById(Long rowId) {
		return this.roleDao.findById(rowId);
	}


	@Override
	public Integer update(Role role) {
		this.roleDao.update(role);
		return 1;
	}


	@Override
	public Integer del(Long rowId) {
		this.roleDao.del(rowId);
		return 1;
	}


}
