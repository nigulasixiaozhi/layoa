package com.situ.layoa.upload.domain;

import java.io.Serializable;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadFile implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private CommonsMultipartFile uploadFile;

	public CommonsMultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(CommonsMultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	

}
