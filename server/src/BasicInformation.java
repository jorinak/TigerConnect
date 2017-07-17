package com.tigerconnect;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.CallableStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import com.tigerconnect.dao.DbUtils;

public class BasicInformation extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id       = Integer.parseInt(request.getParameter("id"));
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String cyear = request.getParameter("cyear");
		String blurb = request.getParameter("blurb");
		String major = request.getParameter("major");
		String rcollege = request.getParameter("rcollege");
		
		if (id >=0 && fname != null && lname != null && cyear != null && blurb != null && major != null && rcollege != null) {
			PrintWriter writer = response.getWriter();
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareCall("{CALL createBasicInfo(?, ?, ?, ?, ?, ?, ?)}");
				stmt.setInt("id", id);
				stmt.setString("firstname", fname);
				stmt.setString("lastname", lname);
				stmt.setString("classyear", cyear);
				stmt.setString("description", blurb);
				stmt.setString("major", major);
				stmt.setString("rescollege", rcollege);
				rs = stmt.executeQuery();
				rs.next();
				writer.println(rs.getInt("@id"));	
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			
			finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
	}
}
