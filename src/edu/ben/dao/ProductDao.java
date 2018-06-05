package edu.ben.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.model.CreditCard;
import edu.ben.model.Product;
import edu.ben.model.User;

public class ProductDao extends DBConnector {

	public void insertProduct(Product product) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.product where product_name = '" + product.getName() + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (!rs.next()) {

			String sql2 = "select * from ecommerce.category where category_name = '" + product.getCategory() + "'";
			query = conn.prepareStatement(sql2);
			ResultSet r = query.executeQuery();

			if (r.next()) {

				int id = r.getInt("category_id");
				PreparedStatement ps = conn.prepareStatement(
						"INSERT INTO ecommerce.product(product_name, product_description, category_id, img_path)"
								+ " VALUES ('" + product.getName() + "', '" + product.getDescription() + "', '" + id
								+ "', '" + product.getImg() + "')");
				ps.executeUpdate();
			}
		}
	}

	public ArrayList<Product> getAllProducts() throws SQLException {
		ArrayList<Product> products = new ArrayList<Product>();
		Connection conn = getConnection();

		String sql = "SELECT * from ecommerce.product";
		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		while (rs.next()) {

			String name = rs.getString("product_name");
			String description = rs.getString("product_description");
			int id = rs.getInt("category_id");
			String img = rs.getString("img_path");

			String sql2 = "select * from ecommerce.category where category_id = '" + id + "'";
			query = conn.prepareStatement(sql2);
			ResultSet r = query.executeQuery();

			if (r.next()) {
				String category = r.getString("category_name");
				products.add(new Product(name, description, category, img));
			}
		}

		return products;

	}

	public ArrayList<Product> getProductByCatergory(String category) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.category where category_name = '" + category + "'";

		PreparedStatement query = conn.prepareStatement(sql);
		ArrayList<Product> products = new ArrayList<Product>();

		ResultSet rs = query.executeQuery();

		if (rs.next()) {
			int id = rs.getInt("category_id");
			
			String sql2 = "select * from ecommerce.product where category_id = '" + id +"'";
			query = conn.prepareStatement(sql2);
			ResultSet r = query.executeQuery();
			while(r.next()){
				String name = r.getString("product_name");
				String description = r.getString("product_description");
				String path = r.getString("img_path");
				
				products.add(new Product(name,description, category, path));
						
			}
		}
		
		return products;
	}

	public Product getProduct(String productName) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.product where product_name = '" + productName + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (rs.next()) {
			String name = rs.getString("product_name");
			String description = rs.getString("product_description");
			String path = rs.getString("img_path");
			int id = rs.getInt("category_id");
			
			String sql2 = "select * from emcommerce.category where category_id = '" + id + "'";
			query = conn.prepareStatement(sql2);
			ResultSet r = query.executeQuery();
			
			if(r.next()){
				String categoryName = r.getString("category_name");
				return new Product(name, description, categoryName, path);
			}
		}

		return null;
	}

}
