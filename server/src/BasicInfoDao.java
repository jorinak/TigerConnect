package com.tigerconnect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tigerconnect.model.BasicInfo;

public class BasicInfoDao {
	
	private static final String GET_SQL = "select * from basic_info where firstname = ?";
	private static final String INSERT_SQL = "insert into basic_info values (?, ?, ?, ?, ?, ?, ?)";

	public BasicInfoDao() {
		super();
	}

	public BasicInfo get(String firstname) throws Exception {
		BasicInfo result = null;

		if (firstname != null) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareStatement(GET_SQL);
				stmt.setString(1, firstname);
				rs = stmt.executeQuery();
				if (rs.next()) {
					result = new BasicInfo(rs.getString("first_name"), rs.getString("last_name"), rs.getString("class_year"), rs.getString("description"), rs.getString("major"), rs.getString("residential_college"));
				}
			} finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
		return result;
	}
	
	public BasicInfo create(String firstname, String lastname, String classyear, String description, String major, String rescollege) throws Exception {
		BasicInfo result = null;

		if (firstname != null) {
			DbUtils dbUtils = new DbUtils();
			Connection conn = null;
			PreparedStatement stmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtils.getConnection();
				stmt = conn.prepareStatement(INSERT_SQL);
				stmt.setInt(1, 0);
				stmt.setString(2, firstname);
				stmt.setString(3, lastname);
				stmt.setString(4, classyear);
				stmt.setString(5, description);
				stmt.setString(6, major);
				stmt.setString(7, rescollege);
				stmt.executeUpdate();
			} finally {
				dbUtils.closeResultSet(rs);
				dbUtils.closeStatement(stmt);
				dbUtils.closeConnection(conn);
			}
		}
		result = new BasicInfo(firstname, lastname, classyear, description, major, rescollege);
		return result;
	}
	
	public boolean delete(String firstname) throws Exception {
		boolean result = false;
		
		// TODO
		return result;
	}

}
