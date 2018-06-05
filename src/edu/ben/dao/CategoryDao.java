package edu.ben.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.model.Category;


public class CategoryDao extends DBConnector {
	
	//Name of the category table in the merlin database
	private static String TABLE_NAME = "ecommerce.category";
	
	//Gets the connection to the database
	Connection conn = getConnection();

	/**
	 * Will insert a category into the database
	 * @param c a category
	 * @throws SQLException
	 */
	public void insertCategory(Category c) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from " + TABLE_NAME + " where category_name = '"
				+ c.getName() + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (!rs.next()) {
			PreparedStatement ps = conn
					.prepareStatement("INSERT INTO ecommerce.category(category_name)"
							+ " VALUES ('" + c.getName() + "')");
			ps.executeUpdate();
		}
	}
	
	/**
	 * 
	 * @return all categories from the database
	 */
	public ArrayList<Category> getCategories(){
		String sql = "select * from " + TABLE_NAME;

		ArrayList<Category> categories = new ArrayList<Category>();

		try {

			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String name = rs.getString("category_name");

				categories.add(new Category(name));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return categories;
	}
	
	
}
