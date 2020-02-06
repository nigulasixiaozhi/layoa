package com.situ.layoa.user.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.situ.layoa.user.domain.User;

@RestController
@RequestMapping("user/")
public class UserController {

	@ResponseBody
	@PostMapping
	public Long add(User user) {
		System.out.println(user);
		return 1L;
	}
	
	@ResponseBody
	@GetMapping("/checkName")
	public Integer checkName(String userName) {
		Integer result = 1;
		if ("zhangsan".equals(userName)) {
			result = 0;
		}
		return result;
	}
}
