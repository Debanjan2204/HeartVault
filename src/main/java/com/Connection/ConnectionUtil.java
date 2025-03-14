package com.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionUtil {
	static Connection adminconn=null;
	static Connection conn=null;

    public static Connection getAdminConnection() throws SQLException {
    	try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ADMIN_DB_URL = "jdbc:sqlite:D:\\PROGRAMS X86 X64\\SQLITE\\Admin.db";
        adminconn=DriverManager.getConnection(ADMIN_DB_URL);
        return adminconn;
    }

    public static Connection CreatingConnectionCustDB() throws SQLException {
    	try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	String CUSTOMER_DB_URL = "jdbc:sqlite:D:\\PROGRAMS X86 X64\\SQLITE\\Customer.db";
        conn= DriverManager.getConnection(CUSTOMER_DB_URL);
        return conn;
    }
    
    
    public static void EndAdminConnection() {
    	try {
			adminconn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
    public static void EndCustConnection() {
    	try {
    		conn.close();
    	}catch(SQLException e){
    		e.printStackTrace();
    	}
    }
}