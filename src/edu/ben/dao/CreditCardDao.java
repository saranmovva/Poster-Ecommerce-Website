package edu.ben.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import edu.ben.model.CreditCard;


public class CreditCardDao extends DBConnector {

	public void insertCreditCard(CreditCard card, String userEmail) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.credit_card where card_number = '" + card.getCardNumber() + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (!rs.next()) {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO ecommerce.credit_card(card_number, name_on_card, expiration_date, card_type)"
							+ " VALUES ('" + card.getCardNumber() + "', '" + card.getCardHolderName() + "', '"
							+ card.getExpirationDate() + "', '" + card.getCardType() + "')");
			ps.executeUpdate();
			String sql2 = "select * from ecommerce.credit_card where card_number = '" + card.getCardNumber() + "'";
			query = conn.prepareStatement(sql2);
			ResultSet r = query.executeQuery();
			String cardID = "";
			if (r.next()) {
				cardID = r.getString("credit_card_id");
			}

			String sql3 = "select * from ecommerce.user where email = '" + userEmail + "'";
			query = conn.prepareStatement(sql3);
			ResultSet q = query.executeQuery();
			String userID = "";
			if (q.next()) {
				userID = q.getString("user_id");
			}

			ps = conn.prepareStatement(
					"insert into ecommerce.credit_card_lookup(look_up_user_id, look_up_credit_card_id) values('"
							+ userID + "', '" + cardID + "')");
			ps.executeUpdate();
		}
	}

	public void deleteCreditCard(CreditCard card, String userEmail) throws SQLException {
		Connection conn = getConnection();

		String sql = "select * from ecommerce.credit_card where card_number = '" + card.getCardNumber() + "'";

		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		if (rs.next()) {
			String cardID = rs.getString("credit_card_id");
			sql = "delete from ecommerce.credit_card_lookup where look_up_credit_card_id = '" + cardID + "'";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.executeUpdate(sql);

			sql = "delete from ecommerce.credit_card where credit_card_id = '" + cardID + "'";
			ps = conn.prepareStatement(sql);
			ps.executeUpdate(sql);

		}
	}

	public ArrayList<CreditCard> getAllCreditCards(String userEmail) throws SQLException {
		ArrayList<CreditCard> cards = new ArrayList<CreditCard>();
		Connection conn = getConnection();

		String sql = "SELECT look_up_credit_card_id FROM ecommerce.credit_card_lookup WHERE look_up_user_id = (SELECT user_id FROM ecommerce.user WHERE email = '"
				+ userEmail + "')";
		PreparedStatement query = conn.prepareStatement(sql);

		ResultSet rs = query.executeQuery();

		while (rs.next()) {
			int id = rs.getInt("look_up_credit_card_id");
			PreparedStatement ps = conn.prepareStatement(
					"SELECT * FROM ecommerce.credit_card WHERE credit_card_id = '" + id + "';");
			ResultSet card = ps.executeQuery();
			if (card.next()) {
				String cardNumber = card.getString("card_number");
				String cardHolderName = card.getString("name_on_card");
				String expirationDate = card.getString("expiration_date");
				String cardType = card.getString("card_type");

				cards.add(new CreditCard(cardNumber, cardHolderName, expirationDate, cardType));
			}
		}

		return cards;

	}

}
