package com.situ.layoa.role.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.situ.layoa.base.DataClass;
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
	public DataClass<Role> findAll() {
		DataClass<Role> data = new DataClass<Role>();
		List<Role> roleList =  this.roleDao.findAll();
		if (roleList!=null) {
			data.setCode(0);
			data.setMsg("成功");
			data.setCount(roleList.size());
			data.setData(roleList);
		}
		return data;
	}


	@Override
	public Integer checkName(String roleName) {
		Integer check = 1;
		String name = this.roleDao.checkName(roleName);
		if (name!=null) {
			check = 0;
		}
		return check;
	}

}
