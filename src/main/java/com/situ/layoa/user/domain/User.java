package com.situ.layoa.user.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

public class User implements Serializable{
	private static final long serialVersionUID = 1L;
	private String userName;
	private Integer userAge;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date userBirthday;
	private List<Integer> userLike;
	private Integer userSex;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getUserAge() {
		return userAge;
	}
	public void setUserAge(Integer userAge) {
		this.userAge = userAge;
	}
	public Date getUserBirthday() {
		return userBirthday;
	}
	public void setUserBirthday(Date userBirthday) {
		this.userBirthday = userBirthday;
	}
	public List<Integer> getUserLike() {
		return userLike;
	}
	public void setUserLike(List<Integer> userLike) {
		this.userLike = userLike;
	}
	public Integer getUserSex() {
		return userSex;
	}
	public void setUserSex(Integer userSex) {
		this.userSex = userSex;
	}
	@Override
	public String toString() {
		return "User [userName=" + userName + ", userAge=" + userAge + ", userBirthday=" + userBirthday + ", userLike="
				+ userLike + ", userSex=" + userSex + "]";
	}
	
	
}
