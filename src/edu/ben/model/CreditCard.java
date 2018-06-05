package edu.ben.model;

public class CreditCard {

	String cardNumber;
	String cardHolderName;
	String expirationDate;
	String cardType;
	
	public CreditCard(String cardNumber, String cardHolderName, String expirationDate, String cardType) {
		super();
		this.cardNumber = cardNumber;
		this.cardHolderName = cardHolderName;
		this.expirationDate = expirationDate;
		this.cardType = cardType;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardHolderName() {
		return cardHolderName;
	}
	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
	public String getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	
	
}
