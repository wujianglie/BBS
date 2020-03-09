package com.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.StringUtils;
import com.pojo.User;
import com.service.UserService;


@WebServlet("/user_regist")
public class UserRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserService userService = new UserService();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String userId = request.getParameter("userId");
		String userPsw = request.getParameter("userPsw");
		String userAlice = request.getParameter("userAlice");
		String userEmail = request.getParameter("userEmail");
		String userSex = request.getParameter("userSex");
		if(StringUtils.isNullOrEmpty(userId)||
				StringUtils.isNullOrEmpty(userPsw)||
				StringUtils.isEmptyOrWhitespaceOnly(userEmail)||
				StringUtils.isNullOrEmpty(userAlice)||
				StringUtils.isNullOrEmpty(userSex)) {
			request.setAttribute("error","任何信息都不能为空");
			request.getRequestDispatcher("regist.jsp").forward(request, response);
			return;
		}

		if(userService.findUserById(userId) != null) {
			request.setAttribute("error","账户已经存在");
			request.getRequestDispatcher("regist.jsp").forward(request, response);
			return;
		}
		User users =new User(userId,userPsw,userAlice,userEmail,userSex,null,0, null,null,null,null);
		userService.addUser(users);
		request.getRequestDispatcher("register.jsp").forward(request, response);
		return;
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
