package com.situ.layoa.role.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.situ.layoa.base.LayResult;
import com.situ.layoa.role.domain.Role;
import com.situ.layoa.role.service.RoleService;

@RestController
@RequestMapping("role")
public class RoleController {
	private static final String ROLE = "roleList";
	private static final String ROLE_ADD_EDIT = "role_add_edit";
	@Autowired
	private RoleService roleService;
	
	@GetMapping
	public ModelAndView goRole(ModelAndView modlAndView) {
		modlAndView.setViewName(ROLE);
		return modlAndView;
	}
	
	@GetMapping("/roleAdd")
	public ModelAndView goRoleAdd(ModelAndView modlAndView) {
		modlAndView.setViewName(ROLE_ADD_EDIT);
		return modlAndView;
	}
	
	@GetMapping( path = {"/checkName/{value}/{rowId}","/checkName/{value}/"} )
	public Integer checkName(@PathVariable(required = false) Long rowId,@PathVariable("value") String roleName) {
		return this.roleService.checkName(roleName,rowId );
	}
	
	@GetMapping("/roleEdit/{rowId}")
	public ModelAndView goRoleEdit(ModelAndView modlAndView,@PathVariable Long rowId) {
		modlAndView.addObject("role",this.roleService.findById(rowId));
		modlAndView.setViewName(ROLE_ADD_EDIT);
		return modlAndView;
	}
	
	@GetMapping("/findAll/{curr}/{limit}")
	public LayResult findAll(@PathVariable Integer curr,@PathVariable Integer limit){
		return this.roleService.findAll(curr,limit);
	}
	
	@PostMapping
	public Long add(Role role) {
		return this.roleService.add(role);
	}
	
	@DeleteMapping("/{rowId}")
	public Integer del(@PathVariable Long rowId) {
		return this.roleService.del(rowId);
	}
	
	@PutMapping
	public Integer update(Role role) {
		return this.roleService.update(role);
	}
	
	@GetMapping("/find/{rowId}")
	public Role findById(@PathVariable Long rowId) {
		return this.roleService.findById(rowId);
	}
	
}
