package edu.ben.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.model.Address;
import edu.ben.model.Product;

public class AddressDao extends DBConnector {

	public void insertBillingAddress(String userEmail, Address address) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.address where street = '" + address.getStreet() + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (!rs.next()) {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO ecommerce.address(street, city, state, zipcode)"
					+ " VALUES ('" + address.getStreet() + "', '" + address.getCity() + "', '" + address.getState()
					+ "', '" + address.getZipcode() + "')");
			ps.executeUpdate();

			String sql2 = "select * from ecommerce.user where email = '" + userEmail + "'";
			query = conn.prepareStatement(sql2);

			ResultSet r = query.executeQuery();

			if (r.next()) {
				int userID = r.getInt("user_id");

				String sql3 = "select * from ecommerce.address where '" + address.getStreet() + "'";
				query = conn.prepareStatement(sql3);

				ResultSet s = query.executeQuery();

				if (s.next()) {
					int addressID = s.getInt("address_id");
					ps = conn.prepareStatement(
							"INSERT INTO ecommerce.billing_address(billing_user_id, billing_address_id)" + " VALUES ('"
									+ userID + "', '" + addressID + "')");
					ps.executeUpdate();
				}
			}
		}
	}

	public void insertShippingAddress(String userEmail, Address address) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.address where street = '" + address.getStreet() + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (!rs.next()) {
			PreparedStatement ps = conn.prepareStatement("INSERT INTO ecommerce.address(street, city, state, zipcode)"
					+ " VALUES ('" + address.getStreet() + "', '" + address.getCity() + "', '" + address.getState()
					+ "', '" + address.getZipcode() + "')");
			ps.executeUpdate();

			String sql2 = "select * from ecommerce.user where email = '" + userEmail + "'";
			query = conn.prepareStatement(sql2);

			ResultSet r = query.executeQuery();

			if (r.next()) {
				int userID = r.getInt("user_id");

				String sql3 = "select * from ecommerce.address where '" + address.getStreet() + "'";
				query = conn.prepareStatement(sql3);

				ResultSet s = query.executeQuery();

				if (s.next()) {
					int addressID = s.getInt("address_id");
					ps = conn.prepareStatement(
							"INSERT INTO ecommerce.shipping_address(shipping_user_id, shipping_address_id)"
									+ " VALUES ('" + userID + "', '" + addressID + "')");
					ps.executeUpdate();
				}
			}
		}
	}

	public void deleteBillingAddress(Address address) {

	}

	public void deleteShippingAddress(Address address) {

	}

	public Address getBillingAddress(String userEmail) {
		return null;
	}

	public ArrayList<Address> getAllShippingAddress(String userEmail) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.user where email = '" + userEmail + "'";

		PreparedStatement query = conn.prepareStatement(sql);
		ArrayList<Address> addresses = new ArrayList<Address>();

		ResultSet rs = query.executeQuery();

		if (rs.next()) {
			int id = rs.getInt("user_id");

			String sql2 = "select * from ecommerce.shipping_address where shipping_user_id = '" + id + "'";
			query = conn.prepareStatement(sql2);
			ResultSet r = query.executeQuery();
			while (r.next()) {
				String addressId = r.getString("shipping_address_id");

				String sql3 = "select * from ecommerce.address where address_id = '" + addressId + "'";
				query = conn.prepareStatement(sql3);
				ResultSet s = query.executeQuery();
				if (s.next()) {
					String street = s.getString("street");
					String city = s.getString("city");
					String state = s.getString("state");
					String zip = s.getString("zipcode");
					addresses.add(new Address(street, city, state, zip));
				}
			}
		}

		return addresses;
	}
}
