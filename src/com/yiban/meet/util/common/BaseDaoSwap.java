package com.yiban.meet.util.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class BaseDaoSwap {
	private static final String driverClassName = "com.mysql.jdbc.Driver";
	private final String url = "jdbc:mysql://47.92.211.43/tyt?characterEncoding=utf-8";
	private final String username = "root";
	private final String password = "xrxy0852";
	
	
	static{
		try {
			Class.forName(driverClassName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	} 
	
	
	public Connection getConnection() {
		try {
			Connection conn = DriverManager.getConnection(url, username, password);
			return conn;
		} catch (SQLException e) {
			System.out.println("connection successful form BaseDao");
			e.printStackTrace();
		}
		return null;
	}
	
	
	public int executeUpdate(String sql,Object[] params){
		Connection conn = this.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
	
			if(params != null && params.length != 0){
				for (int i = 0; i < params.length; i++) {
					pstmt.setObject(i+1, params[i]);
				}
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			this.closeAll(null, pstmt, conn);
		}
		
		return result;
	}
	

	public void closeAll(ResultSet rs, Statement stmt, Connection conn){
		try {
			if(rs != null) {
				rs.close();
			}
			if(stmt != null){
				stmt.close();
			}
			if(conn != null && !conn.isClosed()){
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
