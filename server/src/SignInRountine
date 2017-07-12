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

public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String pass = request.getParameter("password");
		
		if (username != null && pass != null) {
			PrintWriter writer = response.getWriter();
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			CallableStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareCall("{CALL verifyUser(?,?)}");
				stmt.setString("username_input",  username);
				stmt.setString("password_input", pass);
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
