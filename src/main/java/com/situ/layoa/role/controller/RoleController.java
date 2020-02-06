package com.situ.layoa.role.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.situ.layoa.base.DataClass;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

@RestController
@RequestMapping("role")
public class RoleController {
	private static final String ROLE = "role";
	@Autowired
	private RoleService roleService;
	
	@GetMapping
	public ModelAndView getAdd(ModelAndView modlAndView) {
		modlAndView.setViewName(ROLE);
		return modlAndView;
	}
	
	@ResponseBody
	@GetMapping("/findAll")
	public DataClass<Role> findAll(){
		return this.roleService.findAll();
	}
	
	@ResponseBody
	@PostMapping
	public Long add(Role role) {
		return this.roleService.add(role);
	}
	
	@ResponseBody
	@GetMapping("/checkName/{value}")
	public Integer checkName(@PathVariable("value") String roleName) {
		return this.roleService.checkName(roleName);
	}
	
}
