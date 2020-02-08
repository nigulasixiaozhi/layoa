package com.situ.layoa.upload.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.situ.layoa.base.LayResult;
import com.situ.layoa.upload.domain.UploadFile;

@RestController
@RequestMapping("upload")
public class UploadController {

	@GetMapping
	public ModelAndView goUpload(ModelAndView modelAndView) {
		modelAndView.setViewName("upload");
		return modelAndView;
	}
	
	@ResponseBody
	@PostMapping
	public LayResult upload(UploadFile uploadFile) {
		System.out.println(uploadFile.getUploadFile());
		return new LayResult(0, "", "layoafile/xxx.jpg");
	}
}
