package com.tigerconnect;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.CallableStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import com.tigerconnect.dao.DbUtils;

public class Connections extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));

		if (id >= 0) {
			DbUtils dbUtils1 = new DbUtils();
			Connection conn1 = null;
			CallableStatement stmt1 = null;
			ResultSet rs1 = null;
			try {
				conn1 = dbUtils1.getConnection();
				stmt1 = conn1.prepareCall("{CALL personalityRank(?)}");
				stmt1.setInt("id",  id);
				rs1 = stmt1.executeQuery();
				rs1.next();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				dbUtils1.closeResultSet(rs1);
				dbUtils1.closeStatement(stmt1);
				dbUtils1.closeConnection(conn1);
			}

			DbUtils dbUtils2 = new DbUtils();
			Connection conn2 = null;
			CallableStatement stmt2 = null;
			ResultSet rs2 = null;
			try {
				conn2 = dbUtils2.getConnection();
				stmt2 = conn2.prepareCall("{CALL interestsRank(?)}");
				stmt2.setInt("userID",  id);
				rs2 = stmt2.executeQuery();
				rs2.next();
			} 
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				dbUtils2.closeResultSet(rs2);
				dbUtils2.closeStatement(stmt2);
				dbUtils2.closeConnection(conn2);
			}

			DbUtils dbUtils3 = new DbUtils();
			Connection conn3 = null;
			CallableStatement stmt3 = null;
			ResultSet rs3 = null;
			try {
				conn3 = dbUtils3.getConnection();
				stmt3 = conn3.prepareCall("{CALL getConnections(?)}");
				stmt3.setInt("id",  id);
				rs3 = stmt3.executeQuery();
				while(rs3.next()) {
					System.out.println("User: " + rs3.getInt("connect_id") + ", " + rs3.getInt("rank") + ", " + rs3.getString("first_name") + ", " + rs3.getString("last_name") + ", " + rs3.getString("class_year") + ", " + rs3.getString("description") + ", " + rs3.getString("major") + ", " + rs3.getString("residential_college") + ", " + rs3.getString("interests"));
				}
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			finally {
				dbUtils2.closeResultSet(rs3);
				dbUtils2.closeStatement(stmt3);
				dbUtils2.closeConnection(conn3);
			}
		}
	}
}
