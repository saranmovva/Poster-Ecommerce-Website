package edu.ben.dao.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;

import edu.ben.dao.CreditCardDao;
import edu.ben.model.CreditCard;

public class CreditCardDaoTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void insertCreditCardTest() throws SQLException {
		CreditCard c = new CreditCard("555555555", "test card", "11/15", "visa");
		CreditCardDao cDao = new CreditCardDao();
		
		cDao.insertCreditCard(c, "jowens@ben.edu");
		
		c = new CreditCard("1212212515155", "stuff ", "1/17", "visa");
		cDao = new CreditCardDao();
		
		cDao.insertCreditCard(c, "jowens@ben.edu");
		
		c = new CreditCard("6546465416846", "things ", "1/17", "visa");
		cDao = new CreditCardDao();
		
		cDao.insertCreditCard(c, "jowens@ben.edu");
	}
	
	@Test
	public void deleteCreditCardTest() throws SQLException{
		CreditCard c = new CreditCard("555555555", "test card", "11/15", "visa");
		CreditCardDao cDao = new CreditCardDao();
		
		cDao.insertCreditCard(c, "jowens@ben.edu");
		
		cDao.deleteCreditCard(c, "jowens@ben.edu");
	}
	
	@Test
	public void getAllCreditCardsTest() throws SQLException{
		CreditCardDao cDao = new CreditCardDao();
		ArrayList<CreditCard> list = cDao.getAllCreditCards("jowens@ben.edu");
		
		CreditCard test = list.get(0);
		
		Assert.assertEquals(test.getCardNumber(), "1212212515155");
		
	}

}
