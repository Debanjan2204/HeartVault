package com.Connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionUtil {
	static Connection adminconn=null;
	static Connection conn=null;

    public static Connection getAdminConnection() throws SQLException {
    	try {
//			Class.forName("org.sqlite.JDBC");
    		Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		String ADMIN_DB_URL = "jdbc:sqlite:D:\\PROGRAMS X86 X64\\SQLITE\\Admin.db";
    	String ADMIN_DB_URL = "jdbc:postgresql://postgres.railway.internal:5432/railway";
    	String username = "postgres";
    	String password = "mxpLNbLdAqNjIVUfnvVSjGxACBkWfULr"; 
        adminconn=DriverManager.getConnection(ADMIN_DB_URL,username,password);
        return adminconn;
    }

    public static Connection CreatingConnectionCustDB() throws SQLException {
    	try {
//			Class.forName("org.sqlite.JDBC");
    		Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//    	String CUSTOMER_DB_URL = "jdbc:sqlite:D:\\PROGRAMS X86 X64\\SQLITE\\Customer.db";
//    	String CUSTOMER_DB_URL = "jdbc:postgresql://postgres.railway.internal:5432/{DATABASE_NAME}";
//    	String CUSTOMER_DB_URL = "jdbc:postgresql://postgres.railway.internal:5432/railway?user=postgres&password=mxpLNbLdAqNjIVUfnvVSjGxACBkWfULr";
    	String CUSTOMER_DB_URL="jdbc:postgresql://postgres:mxpLNbLdAqNjIVUfnvVSjGxACBkWfULr@gondola.proxy.rlwy.net:13235/railway";

    	postgresql://postgres:mxpLNbLdAqNjIVUfnvVSjGxACBkWfULr@gondola.proxy.rlwy.net:13235/railway
    	postgresql://postgres:mxpLNbLdAqNjIVUfnvVSjGxACBkWfULr@gondola.proxy.rlwy.net:13235/railway
    		
    	String username ="postgres";
    	String password = "mxpLNbLdAqNjIVUfnvVSjGxACBkWfULr"; // Make sure it's correct

    	Connection conn =null;
        conn= DriverManager.getConnection(CUSTOMER_DB_URL,username,password);
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