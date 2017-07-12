package com.tigerconnect;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tigerconnect.dao.BasicInfoDao;
import com.tigerconnect.model.BasicInfo;

public class PersonalProfileInfo extends HttpServlet {

	private static final String SUCCESS = "success";
	private static final String FAILURE = "failure";
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id       = Integer.parseInt(request.getParameter("id"));
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String cyear = request.getParameter("classyear");
		String blurb = request.getParameter("description");
		String major = request.getParameter("major");
		String rcollege = request.getParameter("rescollege");
		
		System.out.println("Id= " + id + "First Name= " + fname + "Last Name= " + lname + "Class Year= " + cyear
						+ "Description: " + blurb + "Major= " + major + "Res College= " + rcollege);
		
		if (fname != null && lname != null && cyear != null && blurb != null && major != null && rcollege != null) {
			BasicInfoDao basicDao = new BasicInfoDao();
			PrintWriter writer = response.getWriter();
			try {
				BasicInfo basic = basicDao.create(id, fname, lname, cyear, blurb, major, rcollege);
				if (basic == null) {
					writer.println(FAILURE);
				} else {
					writer.println(SUCCESS);
					writer.println("" + basic.getId() + "");
				}
			} catch (Exception e) {
				e.printStackTrace();
				writer.println(FAILURE);
			}
		}
	}
}
