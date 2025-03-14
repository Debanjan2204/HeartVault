package com.model;

import java.time.LocalDate;

public class Customer {

	private long ssnNo;
    private String fName;
    private String lName;
    private String email;
    private String address;
    private long contactNo;
    private LocalDate dob;
    private char gender;
    private String accountType;
    private String aadharNo;
    private String panNo;
    private long accountNo;
    private float initialBal;
    private String password;
    
    public Customer(long ssn, String fname, String lname, String email, String add, long contactNo, LocalDate dob, char gender, String accountType, String aadhar, String pan, long accNo, float initialBal, String password) {
        this.ssnNo = ssn;
        this.fName = fname;
        this.lName = lname;
        this.email = email;
        this.address = add;
        this.contactNo = contactNo;
        this.dob = dob;
        this.gender = gender;
        this.accountType = accountType;
        this.aadharNo = aadhar;
        this.panNo = pan;
        this.accountNo = accNo;
        this.initialBal = initialBal;
        this.password=password;
    }

    public Customer() {
        this.ssnNo = 0L;
        this.fName = "";
        this.lName ="";
        this.email = "";
        this.address = "";
        this.contactNo = 0L;
        this.dob = LocalDate.of( 9999 , 1 , 1 );
        this.gender =' ';
        this.accountType ="";
        this.aadharNo ="";
        this.panNo = "";
        this.accountNo =0L;
        this.initialBal =0F;
        this.password="";
    }

    
	public long getSsnNo() {
		return ssnNo;
	}

	public void setSsnNo(long ssnNo) {
		this.ssnNo = ssnNo;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public long getContactNo() {
		return contactNo;
	}

	public void setContactNo(long contactNo) {
		this.contactNo = contactNo;
	}

	public LocalDate getdob() {
		return dob;
	}

	public void setdob(LocalDate dob) {
		this.dob = dob;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}

	public String getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(String aadharNo) {
		this.aadharNo = aadharNo;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public long getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}

	public float getInitialBal() {
		return initialBal;
	}

	public void setInitialBal(float initialBal) {
		this.initialBal = initialBal;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
    
}