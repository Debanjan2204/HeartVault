package com.model;

import java.time.LocalDate;

public class Transaction_table {

	
	private String Trans_Id;
	private long accountNo;
    private int Amount;
    private LocalDate Trans_date;
    private long Benef_AccNum;
    
    
  
    public Transaction_table(String trans_Id, long accountNo, int amount, LocalDate trans_date, long benef_AccNum) {
		this.Trans_Id = trans_Id;
		this.accountNo = accountNo;
		this.Amount = amount;
		this.Trans_date = trans_date;
		this.Benef_AccNum = benef_AccNum;
	}
    
	public String getTrans_Id() {
		return Trans_Id;
	}
	public void setTrans_Id(String trans_Id) {
		Trans_Id = trans_Id;
	}
	public long getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(long accountNo) {
		this.accountNo = accountNo;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public LocalDate getTrans_date() {
		return Trans_date;
	}
	public void setTrans_date(LocalDate trans_date) {
		Trans_date = trans_date;
	}
	public long getBenef_AccNum() {
		return Benef_AccNum;
	}
	public void setBenef_AccNum(long benef_AccNum) {
		Benef_AccNum = benef_AccNum;
	}
    
}