package com.DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.*;
import java.util.ArrayList;
import java.util.List;

import com.Connection.ConnectionUtil;
import com.PasswordUtil.PasswordUtils;
import com.model.Customer;
import com.model.Transaction_table;

public class AdminDAO {
	
//	 public static boolean validateAdmin(int empID , String password) {
//    String query = "SELECT * FROM AdminLogin WHERE empID = ? AND password = ?";
//    try (Connection conn = ConnectionUtil.getAdminConnection();
//         PreparedStatement ps = conn.prepareStatement(query)) {
//        ps.setInt(1, empID);
//        ps.setString(2, password);
//        try (ResultSet rs = ps.executeQuery()) {
//            return rs.next(); // Returns true if a match is found
//        }
//    } catch (SQLException e) {
//        e.printStackTrace();
//    }
//    return false;
//}

	public static String logIn(int empID,String password)throws IOException,SQLException{
        
        String Name =null;
        
        try {
            
            Connection con = ConnectionUtil.getAdminConnection();
            String query = "select * from admin where id = ?;";
            
            PreparedStatement stmt = con.prepareStatement(query);
            
            stmt.setInt(1, empID);
            
            ResultSet set = stmt.executeQuery();
            
            if(!set.next()) {
                System.out.println("No such admin exists!!");
                con.close();
                return null;
            }
            
            String pass = set.getString(3);
            if(!pass.equals(password)) {
                System.out.println("Email or password incorrect!!");
                con.close();
                return null;
            }
            
            Name = set.getString(2);
            
            con.close();
            
            return Name;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }
	public static String findNxtAccNum() throws IOException,SQLException {
		Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		String query="SELECT * FROM basic_details ORDER BY Account_Number DESC LIMIT 1; ";
		PreparedStatement stmt=conn.prepareStatement(query);
		ResultSet set=stmt.executeQuery();
		long AccNum=0;
		if(set.next()== true) {
		AccNum=set.getLong(2);
		}
		
		else {
			conn.close();
			return "100000000000000";
		}
		conn.close();
		return Long.toString(AccNum+1);
		
	}
	
	public static Customer searchByAccNumber(long Acc_Num) throws IOException,SQLException{
		
		
		Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		
		String query="Select * from basic_details where Account_Number =?; ";
		
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setLong(1,Acc_Num);
		
		ResultSet set=stmt.executeQuery();
		if(set.next()== true) {
		long SSN_ID=Long.parseLong(set.getString(1));
		long Account_Number=set.getLong(2);
		String First_Name=set.getString(3);
		String Last_Name=set.getString(4); 
		char Gender=set.getString(5).charAt(0);
		LocalDate DOB =set.getDate(6).toLocalDate();
		long Contact =set.getLong(7);
		String Address=set.getString(8);
		String Aadhar=String.valueOf(set.getLong(9));
		String Pan =set.getString(10);
		String Email_ID =set.getString(11);
		String Password =set.getString(12);
		String Account_Type =set.getString(13);
		float Balance=set.getFloat(14); 
		
        
        
		Customer c=new Customer(SSN_ID,First_Name,Last_Name,Email_ID,Address,Contact,DOB,Gender,Account_Type,Aadhar,Pan,Account_Number,Balance,Password);
		conn.close();
		return c;
		}
		conn.close();
		return null;
		
	}
	
	
	public static String saveDetails(Customer c) throws IOException,SQLException{
		Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		
		String query="UPDATE basic_details SET First_Name=?,Last_Name=?,Gender=?,DOB=?,Contact=?,Address=?,Aadhar=?,Pan=?,Email_ID=?,Password=?,Account_Type=?  WHERE Account_Number =?";
			
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setString(1,c.getfName());
		stmt.setString(2,c.getlName());
		stmt.setString(3,Character.toString(c.getGender()));
		stmt.setDate(4,Date.valueOf(c.getdob()));
		stmt.setLong(5,c.getContactNo());
		stmt.setString(6,c.getAddress());
		stmt.setLong(7,Long.parseLong(c.getAadharNo()));
		stmt.setString(8,c.getPanNo());
		stmt.setString(9,c.getEmail());
		stmt.setString(10,c.getPassword());
		stmt.setString(11,c.getAccountType());
		stmt.setLong(12,c.getAccountNo());
		
		int rows=stmt.executeUpdate();
		
		if(rows!=0) {
			conn.close();
			return "Success";
		}
		conn.close();
		return null;
	}
	
	public static String createCustomer(Customer c) throws IOException,SQLException{
		Connection conn = ConnectionUtil.CreatingConnectionCustDB();
		String query = "INSERT INTO basic_details values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		PreparedStatement ps = conn.prepareStatement(query);

		String hashedPassword = PasswordUtils.hashPassword(c.getPassword());
		ps.setString(1, String.valueOf(c.getSsnNo()));
		ps.setLong(2, c.getAccountNo());
		ps.setString(3, c.getfName());
		ps.setString(4, c.getlName());
		ps.setString(5, Character.toString(c.getGender()));
		ps.setDate(6,Date.valueOf(c.getdob()));
		ps.setLong(7, c.getContactNo());
		ps.setString(8, c.getAddress());
		ps.setLong(9, Long.parseLong(c.getAadharNo()));
		ps.setString(10, c.getPanNo());
		ps.setString(11, c.getEmail());
		ps.setString(12,hashedPassword );
		ps.setString(13, c.getAccountType());
		ps.setDouble(14, c.getInitialBal());
		try {
		ps.executeUpdate();
		} catch(Exception e) {
			return "Acc number already exsists";
		}
		System.out.println("Data inserted successfully!");
		conn.close();
		return "Success";
	}
	
	public static String deleteCustomer(long bankAcc)throws IOException,SQLException{
		Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		String query="DELETE FROM basic_details WHERE Account_Number =?;";
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setLong(1,bankAcc);
		
		int rows=stmt.executeUpdate();
		
		if(rows!=0) {
			conn.close();
			return "Success";
		}
		
		conn.close();
		return null;
	}
	
	
	public static List<Customer> viewTable() throws IOException,SQLException {
Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		
		String query="Select * from basic_details; ";
		
		PreparedStatement stmt=conn.prepareStatement(query);
		
		ResultSet set=stmt.executeQuery();
		List<Customer> l= new ArrayList<>();
		while(set.next()== true) {
			long SSN_ID=Long.parseLong(set.getString(1));
			long Account_Number=set.getLong(2);
			String First_Name=set.getString(3);
			String Last_Name=set.getString(4); 
			char Gender=set.getString(5).charAt(0);
			LocalDate DOB =set.getDate(6).toLocalDate();
			long Contact =set.getLong(7);
			String Address=set.getString(8);
			String Aadhar=String.valueOf(set.getLong(9));
			String Pan =set.getString(10);
			String Email_ID =set.getString(11);
			String Password =set.getString(12);
			String Account_Type =set.getString(13);
			float Balance=set.getFloat(14); 
			
	        
	        
			Customer c=new Customer(SSN_ID,First_Name,Last_Name,Email_ID,Address,Contact,DOB,Gender,Account_Type,Aadhar,Pan,Account_Number,Balance,Password);
			l.add(c);
		}
		conn.close();
		return l;
	}
	
	public static List<Transaction_table> viewTransTable() throws IOException,SQLException {
Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		
		String query="Select * from Transaction_table; ";
		
		PreparedStatement stmt=conn.prepareStatement(query);
		
		ResultSet set=stmt.executeQuery();
		List<Transaction_table> l= new ArrayList<>();
		while(set.next()== true) {
			l.add(new Transaction_table(set.getString(1), set.getLong(2), set.getInt(3),set.getDate(4).toLocalDate(), set.getLong(5)));
		}
		conn.close();
		return l;
	}
}
