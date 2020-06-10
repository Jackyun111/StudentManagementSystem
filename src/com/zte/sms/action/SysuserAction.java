package com.zte.sms.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zte.sms.entity.Student;
import com.zte.sms.entity.Sysuser;
import com.zte.sms.exception.UserOrPassWrongException;
import com.zte.sms.factory.ObjectFactory;
import com.zte.sms.service.StudentService;
import com.zte.sms.service.SysuserService;
import com.zte.sms.service.proxy.StudentProxy;
import com.zte.sms.service.proxy.SysuserProxy;
import com.zte.sms.vo.SysuserVO;

public class SysuserAction {
	
	public String login(HttpServletRequest request,HttpServletResponse response) {
		
		SysuserProxy sysuserProxy = (SysuserProxy) ObjectFactory.getObject("sysuserProxy");
		StudentService studentProxy = (StudentService) ObjectFactory.getObject("studentProxy");
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String state = request.getParameter("state");
		
		SysuserVO sysuserVO = new SysuserVO();
		sysuserVO.setUsername(username);
		sysuserVO.setPassword(password);
		
		//System.out.println(sysuserVO);
		
		if ("1".equals(state)) {
			Sysuser sysuser = null;
			try {
				sysuser = sysuserProxy.findUserByUsernameAndPass(sysuserVO);
				request.getSession().setAttribute("user", sysuser);
			} catch (UserOrPassWrongException e) {
				// TODO: handle exception
				request.getSession().setAttribute("error", e.getMessage());
				return "fail";
			}
			
			return "admin";
			
		}
		else if ("0".equals(state)) {
			
			Student student = null;
			try {
				student = studentProxy.findStudentByUsernameAndPass(sysuserVO);
				//request.getSession().setAttribute("student", student);
			} catch (UserOrPassWrongException e) {
				// TODO: handle exception
				request.getSession().setAttribute("error", e.getMessage());
				return "fail";
			}
			
			return "student";
			
		}
		
		return "fail";
	}
	
	
	public void modifyPwd(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//获取提交过来的值
		String id = request.getParameter("id");
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String repeatPass = request.getParameter("repeatPass");
		
		SysuserService sysuserProxy = (SysuserService) ObjectFactory.getObject("sysuserProxy");
		
		SysuserVO sysuserVO = new SysuserVO();
		sysuserVO.setId(Integer.parseInt(id));
		sysuserVO.setPassword(oldPass);
		sysuserVO.setNewPass(newPass);
			
			try {
				sysuserProxy.findUserByIdAndPass(sysuserVO);
				sysuserProxy.modifyPassById(sysuserVO);
				response.getWriter().print("success");
			} catch (Exception e) {
				// TODO: handle exception
				//e.printStackTrace();
				response.getWriter().print("fail");
			}
		
	}
	
	//退出当前系统
	public void logOut(HttpServletRequest request,HttpServletResponse response) {
	
		//清空session中当前用户账户
		request.getSession().removeAttribute("user");
	}
}












