package com.DAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

import com.Connection.ConnectionUtil;
import com.PasswordUtil.PasswordUtils;
import com.model.*;

public class CustomerDAO {

public static String logIn(long acc_num,String password){
        
        String Name =null;
        
        try {
            
            Connection con = ConnectionUtil.CreatingConnectionCustDB();
            String query = "select * from basic_details where Account_Number = ?;";
           
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setLong(1, acc_num);
            ResultSet set = stmt.executeQuery();
            if(!set.next()) {
                System.out.println("No such Customer exists!!");
                con.close();
                return null;
            }
            
            String pass = set.getString(12);
            if(!PasswordUtils.verifyPassword(pass, password)) {
                System.out.println("Account Number or password incorrect!!");
                con.close();
                return null;
            }
            
            
            Name=set.getString(3);
            con.close();
            
            return Name;
            
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

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
	
//    LocalDate currentDate = LocalDate.now();  
//    Period period = Period.between(DOB, currentDate);
    
    
	Customer c=new Customer(SSN_ID,First_Name,Last_Name,Email_ID,Address,Contact,DOB,Gender,Account_Type,Aadhar,Pan,Account_Number,Balance,Password);
	conn.close();
	return c;
	}
	conn.close();
	return null;
	
}

public static String saveDetails(Customer c) throws IOException,SQLException{
	Connection conn=ConnectionUtil.CreatingConnectionCustDB();
	
	String query="UPDATE basic_details SET First_Name=?,Last_Name=?,DOB=?,Contact=?,Address=?,Email_ID=?,Password=?,Balance=? WHERE Account_Number =?";
		
	PreparedStatement stmt=conn.prepareStatement(query);
	stmt.setString(1,c.getfName());
	stmt.setString(2,c.getlName());
	stmt.setDate(3,Date.valueOf(c.getdob()));
	stmt.setLong(4,c.getContactNo());
	stmt.setString(5,c.getAddress());
	stmt.setString(6,c.getEmail());
	stmt.setString(7,c.getPassword());
	stmt.setFloat(8, c.getInitialBal());
	stmt.setLong(9,c.getAccountNo());
	
	int rows=stmt.executeUpdate();
	
	if(rows!=0) {
		conn.close();
		return "Success";
	}
	conn.close();
	return null;
}

public static Customer transfer(Customer c,float amount,long benef_Acc) throws IOException,SQLException{
	Customer ret=null;
	Customer benef=searchByAccNumber(benef_Acc);
		if(benef!=null) {
//			System.out.println("before transfer"+benef.getInitialBal());
			String transactionId=Base64.getUrlEncoder().withoutPadding().encodeToString(UUID.randomUUID().toString().getBytes()).substring(0, 12);
			if(transaction_update(transactionId, c.getAccountNo(), (int) amount, LocalDate.now(), benef.getAccountNo())!=null) {
			c.setInitialBal(c.getInitialBal()-amount);
			benef.setInitialBal(benef.getInitialBal()+amount);
			saveDetails(c);
			saveDetails(benef);
			ret=c;
			}
			else {
				ret=null;
			}
//			String transactionId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 12);
//			System.out.println("after transfer"+benef.getInitialBal());
			
		}
	return ret;
}


	public static String transaction_update(String TransID,long AccNum,int Amt,LocalDate Trans_date,long BenefAcc) throws IOException,SQLException {
		Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		
		String query="INSERT INTO Transaction_table values(?,?,?,?,?);";
			
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setString(1,TransID);
		stmt.setLong(2,AccNum);
		stmt.setInt(3,Amt);
		stmt.setDate(4,Date.valueOf(Trans_date));
		stmt.setLong(5, BenefAcc);
		int rows=0;
		try {
			rows=stmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		if(rows!=0) {
			conn.close();
			System.out.println("SUCCESS");
			return "Success";
		}
		conn.close();
		System.out.println("ERROR INSERTING INTO TRANSACTION DB");
		return null;
		
		
	}
	
	public static List<Transaction_table> searchTransTable(long AccNum) throws IOException,SQLException{
		
		
		Connection conn=ConnectionUtil.CreatingConnectionCustDB();
		
		String query="Select * from Transaction_table where Acc_Number =?; ";
		
		PreparedStatement stmt=conn.prepareStatement(query);
		stmt.setLong(1,AccNum);
		
		ResultSet set=stmt.executeQuery();
		List<Transaction_table> l= new ArrayList<>();
		while(set.next()== true) {
			l.add(new Transaction_table(set.getString(1), set.getLong(2), set.getInt(3), set.getDate(4).toLocalDate(), set.getLong(5)));
		}
		conn.close();
		return l;
	}
}

