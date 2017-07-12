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

public class PersonalityInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id    = Integer.parseInt(request.getParameter("id"));
		int p_id  = Integer.parseInt(request.getParameter("p_id"));
		int scale = Integer.parseInt(request.getParameter("scale"));
		
		if (id >= 0 && p_id >=0 && scale >= 0) {
			PrintWriter writer = response.getWriter();
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareCall("{CALL createPersonality(?, ?, ?)}");
				stmt.setInt("user_id",  id);
				stmt.setInt("personality_id", p_id);
				stmt.setInt("scale", scale);
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