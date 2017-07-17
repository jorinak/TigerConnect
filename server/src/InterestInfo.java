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

public class InterestInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id          = Integer.parseInt(request.getParameter("id"));
		String cat      = request.getParameter("category");
		String interest = request.getParameter("interest");
		
		if (id >= 0 && cat != null && interest != null) {
			PrintWriter writer = response.getWriter();
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareCall("{CALL createInterest(?, ?, ?)}");
				stmt.setInt("user_id",  id);
				stmt.setString("category_name", cat);
				stmt.setString("specific_interest", interest);
				rs = stmt.executeQuery();
				rs.next();
				writer.println(rs.getBoolean("@valid"));
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
