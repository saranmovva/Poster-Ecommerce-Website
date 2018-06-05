package edu.ben.dao.test;

import java.sql.SQLException;

import org.junit.BeforeClass;
import org.junit.Test;

import edu.ben.dao.CategoryDao;
import edu.ben.model.Category;

public class CategoryDaoTest {

	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
	}

	@Test
	public void insertCategoryTest() throws SQLException {
		Category c = new Category("stuff");
		CategoryDao cDao = new CategoryDao();
		
		cDao.insertCategory(c);
	}

}
