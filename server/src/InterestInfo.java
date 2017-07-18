package com.tigerconnect;

import java.io.IOException;
import java.sql.CallableStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import com.tigerconnect.dao.DbUtils;

public class InterestInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int c1 = Integer.parseInt(request.getParameter("c1"));
		int c2 = Integer.parseInt(request.getParameter("c2"));
		int c3 = Integer.parseInt(request.getParameter("c3"));
		int c4 = Integer.parseInt(request.getParameter("c4"));
		int c5 = Integer.parseInt(request.getParameter("c5"));
		String s1 = request.getParameter("s1");
		String s2 = request.getParameter("s2");
		String s3 = request.getParameter("s3");
		String s4 = request.getParameter("s4");
		String s5 = request.getParameter("s5");

		if (id >= 0 && c1 > 0 && c2 > 0 && c3 > 0 && c4 > 0 && c5 > 0 && s1 != null && s2 != null && s3 != null && s4 != null && s5 != null) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareCall("{CALL createInterest(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
				stmt.setInt("user_id",  id);
				stmt.setInt("cat1", c1);
				stmt.setInt("cat2", c2);
				stmt.setInt("cat3", c3);
				stmt.setInt("cat4", c4);
				stmt.setInt("cat5", c5);
				stmt.setString("si1", s1);
				stmt.setString("si2", s2);
				stmt.setString("si3", s3);
				stmt.setString("si4", s4);
				stmt.setString("si5", s5);
				rs = stmt.executeQuery();
				rs.next();
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
