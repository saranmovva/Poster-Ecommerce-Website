package edu.ben.dao.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.BeforeClass;
import org.junit.Test;

import edu.ben.dao.UserDao;
import edu.ben.model.Address;
import edu.ben.model.Cart;
import edu.ben.model.Product;
import edu.ben.model.User;
import junit.framework.Assert;

public class UserDaoTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void insertUserTest() throws SQLException {
		Cart cart = null;
		User testUser = new User("Josh", "Owens", "jowens@ben.edu", "stuff");
		UserDao uDao = new UserDao();

		uDao.insertUser(testUser);

	}
	
	@Test
	public void insertInToCartTest() throws SQLException{
		UserDao uDao = new UserDao();
		uDao.insertToCart("Bottle", "jowens@ben.edu");
	}
	
	@Test
	public void deleteFromCartTest() throws SQLException{
		/*UserDao uDao = new UserDao();
		uDao.deleteFromCart("jowens@ben.edu", "Bottle");*/
	}
	
	@Test
	public void getUserByEmailTest() throws SQLException{
		UserDao uDao = new UserDao();
		
		User testUser = uDao.getUserByEmail("jowens@ben.edu");
		assertEquals("Josh", testUser.getFirstName());
		assertEquals("Owens", testUser.getLastName());
		assertEquals("stuff", testUser.getPassword());
	}
	
	@Test
	public void getCartTest() throws SQLException{
		UserDao uDao = new UserDao();
		ArrayList<Product> test = uDao.getCart("jowens@ben.edu");
		assertEquals("Bottle", test.get(0).getName());
	}

}
