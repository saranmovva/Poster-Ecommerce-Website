package edu.ben.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.model.Product;
import edu.ben.model.User;

public class UserDao extends DBConnector {

	public void changeUserPassword(String newPassword, String email) throws SQLException{
		Connection conn = getConnection();
		
		PreparedStatement ps = conn.prepareStatement("update ecommerce.user set password='" + newPassword + "' where email='" + email + "';");
		ps.executeUpdate();
	}
	public User getUserByEmail(String email) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.user where email = '" + email + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (rs.next()) {
			String firstName = rs.getString("first_name");
			String lastName = rs.getString("last_name");
			String password = rs.getString("password");
				
			return new User(firstName, lastName, email, password);
		}
		
		return null;
	}

	public void insertToCart(String productName, String userEmail) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.product where product_name = '" + productName + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (rs.next()) {
			String productID = rs.getString("product_id");

			String sql2 = "select * from ecommerce.user where email = '" + userEmail + "'";

			query = conn.prepareStatement(sql2);

			ResultSet r = query.executeQuery();
			if (r.next()) {
				String userID = r.getString("user_id");
				PreparedStatement ps = conn.prepareStatement("INSERT INTO ecommerce.cart(user_id, product_id)"
						+ " VALUES ('" + userID + "', '" + productID + "')");
				ps.executeUpdate();
			}

		}
	}

	public ArrayList<Product> getCart(String userEmail) throws SQLException{
		Connection conn = getConnection();

		String sql = "select * from ecommerce.user where email = '" + userEmail + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();
		
		ArrayList<Product> products = new ArrayList<Product>();

		if (rs.next()) {
			String userID = rs.getString("user_id");

			String sql2 = "select * from ecommerce.cart where user_id = '" + userID + "'";

			query = conn.prepareStatement(sql2);

			ResultSet r = query.executeQuery();
			while (r.next()) {
				String productID = r.getString("product_id");
				
				String sql3 = "select * from ecommerce.product where product_id = '" + productID + "'";

				query = conn.prepareStatement(sql3);

				ResultSet q = query.executeQuery();
				
				if (q.next()){
					String name = q.getString("product_name");
					String description = q.getString("product_description");
					String category = q.getString("category_id");
					String path = q.getString("img_path");
					products.add(new Product(name, description, category, path));
				}
			}
			return products;
		}
		return null;
	}
	public void deleteFromCart(String userEmail, String productName) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.product where product_name = '" + productName + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (rs.next()) {
			String productID = rs.getString("product_id");
			
			String sql2 = "select * from ecommerce.user where email = '" + userEmail + "'";

			query = conn.prepareStatement(sql2);

			ResultSet r = query.executeQuery();
			if (r.next()) {
				String userID = r.getString("user_id");
				PreparedStatement ps = conn.prepareStatement("delete from ecommerce.cart where user_id = " + userID
						+ " and product_id = " + productID);
				ps.executeUpdate();
			}

		}
	}

	public boolean insertUser(User user) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.user where email = '" + user.getEmail() + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (!rs.next()) {
			PreparedStatement ps = conn
					.prepareStatement("INSERT INTO ecommerce.user(first_name, last_name, email, password)"
							+ " VALUES ('" + user.getFirstName() + "', '" + user.getLastName() + "', '"
							+ user.getEmail() + "', '" + user.getPassword() + "')");
			ps.executeUpdate();
			return true;
		}
		return false;

	}

}
