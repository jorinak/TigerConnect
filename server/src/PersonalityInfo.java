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

public class PersonalityInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		int s1 = Integer.parseInt(request.getParameter("scale1"));
		int s2 = Integer.parseInt(request.getParameter("scale2"));
		int s3 = Integer.parseInt(request.getParameter("scale3"));
		int s4 = Integer.parseInt(request.getParameter("scale4"));
		int s5 = Integer.parseInt(request.getParameter("scale5"));
		
		if (id >= 0 && s1 > 0 && s2 > 0 && s3 > 0 && s4 > 0 && s5 > 0) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareCall("{CALL createPersonality(?, ?, ?, ?, ?, ?)}");
				stmt.setInt("user_id",  id);
				stmt.setInt("scale1", s1);
				stmt.setInt("scale2", s2);
				stmt.setInt("scale3", s3);
				stmt.setInt("scale4", s4);
				stmt.setInt("scale5", s5);
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
