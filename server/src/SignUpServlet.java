package com.tigerconnect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tigerconnect.dao.UserInfoDao;
import com.tigerconnect.model.UserInfo;

public class SignUpServlet extends HttpServlet {

	private static final String SUCCESS = "success";
	private static final String FAILURE = "failure";
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String pass  = request.getParameter("password");
		String email = request.getParameter("email");
		
		System.out.println("Login= " + login + " Password= " + pass + " Email= " + email);
		if (login != null && pass != null && email != null) {
			UserInfoDao test1Dao = new UserInfoDao();
			PrintWriter writer = response.getWriter();
			try {
				UserInfo test1 = test1Dao.create(login, pass, email);
				if (test1 == null) {
					writer.println(FAILURE);
				} else {
					writer.println(SUCCESS);
				}
			} catch (Exception e) {
				e.printStackTrace();
				writer.println(FAILURE);
			}
		}
	}
}
