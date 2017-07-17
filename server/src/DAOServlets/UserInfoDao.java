package com.tigerconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tigerconnect.model.UserInfo;

public class UserInfoDao {
	
	private static final String GET_SQL = "select * from user_info where username = ?";
	private static final String INSERT_SQL = "insert into user_info values (?, ?, ?, ?)";

	public UserInfoDao() {
		super();
	}

	public UserInfo get(String username) throws Exception {
		UserInfo result = null;

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
					result = new UserInfo(rs.getString("username"), rs.getString("password"), rs.getString("email"));
				}
			} finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
		return result;
	}
	
	public UserInfo create(String username, String password, String email) throws Exception {
		UserInfo result = null;

		if (username != null) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareStatement(INSERT_SQL);
				stmt.setInt(1, 0);
				stmt.setString(2, username);
				stmt.setString(3, password);
				stmt.setString(4, email);
				stmt.executeUpdate();
			} finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
		
		result = new UserInfo(username, password, email);
		
		int id = -1;
		if (username != null) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareStatement("select id from user_info where username = ?");
				stmt.setString(1, username);
				rs = stmt.executeQuery();
				if (rs.next()) {
					id = rs.getInt("id");
				}
			} finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
		result.setId(id);
		return result;
	}
	
	public boolean delete(String username) throws Exception {
		boolean result = false;
		
		// TODO
		return result;
	}

}
