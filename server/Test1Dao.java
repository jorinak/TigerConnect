package com.tigerconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tigerconnect.model.Test1;

public class Test1Dao {
	
	private static final String GET_SQL = "select * from Test1 where username = ?";
	private static final String INSERT_SQL = "insert into Test1 values (?, ?, ?)";

	public Test1Dao() {
		super();

	}

	public Test1 get(String username) throws Exception {
		Test1 result = null;

		if (username != null) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareStatement(GET_SQL);
				stmt.setString(1, username);
				rs = stmt.executeQuery();
				if (rs.next()) {
					result = new Test1(rs.getString("username"), rs.getString("password"), rs.getString("email"));
				}
			} finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
		return result;
	}
	
	public Test1 create(String username, String password, String email) throws Exception {
		Test1 result = null;

		if (username != null) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareStatement(INSERT_SQL);
				stmt.setString(1, username);
				stmt.setString(2, password);
				stmt.setString(3, email);
				stmt.executeUpdate();
			} finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
		result = new Test1(username, password, email);
		return result;
	}
	
	public boolean delete(String username) throws Exception {
		boolean result = false;
		
		// TODO
		return result;
	}

}
