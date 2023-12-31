package com.mystudy.project.VO;

import java.sql.Date;

public class OrderListVO {
	private int oNum;
	private int productNum;
	private String id;
	private int cCount;
	private Date oDate;
	private String payment;
	private String productName;
	private int price;
	private int saleprice;
	
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}
	public int getProductNum() {
		return productNum;
	}
	public void setProductNum(int productNum) {
		this.productNum = productNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getcCount() {
		return cCount;
	}
	public void setcCount(int cCount) {
		this.cCount = cCount;
	}
	public Date getoDate() {
		return oDate;
	}
	public void setoDate(Date oDate) {
		this.oDate = oDate;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSaleprice() {
		return saleprice;
	}
	public void setSaleprice(int saleprice) {
		this.saleprice = saleprice;
	}
	@Override
	public String toString() {
		return "OrderListVO [oNum=" + oNum + ", productNum=" + productNum + ", id=" + id + ", cCount=" + cCount
				+ ", oDate=" + oDate + ", payment=" + payment + ", productName=" + productName + ", price=" + price
				+ ", saleprice=" + saleprice + "]";
	}
	
	
}
	