/**
 * @Company:中享思途   
 * @Title:MyCommonsMultipartResolver.java 
 * @Author:wxinpeng   
 * @Date:2020年2月6日 上午9:54:52     
 */
package com.situ.layoa.commons;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

/**
 * 为了解决 PUT 方式上传文件接受不到参数的问题，重写书写 CommonsMultipartResolver 类中的 isMultipart方法。
 * @ClassName:MyCommonsMultipartResolver 
 * @Description:(MyCommonsMultipartResolver )
 */
public class MyCommonsMultipartResolver extends CommonsMultipartResolver {
	private static final String POST_METHOD = "POST";
	private static final String PUT_METHOD = "PUT";

	@Override
	public boolean isMultipart(HttpServletRequest request) {
		//提交过来的方法名称
		String method = request.getMethod();
		//如果是通过 POST 或是 PUT 提交过来的请求 都让进入到二进制文件解析的流程
		if (POST_METHOD.equalsIgnoreCase(method) || PUT_METHOD.equalsIgnoreCase(method)) {
			return FileUploadBase.isMultipartContent(new ServletRequestContext(request));
		}
		return false;
		/*if (!POST_METHOD.equalsIgnoreCase(request.getMethod())) {
		    return false;
		}
		return FileUploadBase.isMultipartContent(new ServletRequestContext(request));*/
	}

}
