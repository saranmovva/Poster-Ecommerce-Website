package edu.ben.dao.test;

import static org.junit.Assert.*;

import java.sql.SQLException;
import java.util.ArrayList;

import org.junit.BeforeClass;
import org.junit.Test;

import edu.ben.dao.ProductDao;
import edu.ben.model.Product;
import junit.framework.Assert;

public class ProductDaoTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void insertProductTest() throws SQLException {
		Product p = new Product("Bottle", "This is a bottle", "id","path");
		ProductDao pDao = new ProductDao();
		pDao.insertProduct(p);
	}
	
	@Test
	public void getAllProductsTest() throws SQLException{
		ProductDao pDao = new ProductDao();
		ArrayList<Product> p = pDao.getAllProducts();
		
		Product test = p.get(0);
		Assert.assertEquals("Bottle", test.getName());
		System.out.println( test.getName() + " " + test.getDescription());
	}

}
