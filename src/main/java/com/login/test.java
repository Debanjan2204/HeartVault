package com.login;
import java.sql.Connection;
import java.sql.DriverManager;

	public class test {
	    public static void main(String[] args) {
	        try {
	            String url = "jdbc:sqlite:D:\\PROGRAMS X86 X64\\SQLITE\\Admin.db";
	            Connection conn = DriverManager.getConnection(url);
	            if (conn != null) {
	                System.out.println("Connection established!");
	                conn.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	}

