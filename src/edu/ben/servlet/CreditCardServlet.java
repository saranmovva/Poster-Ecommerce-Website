package edu.ben.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ben.dao.CreditCardDao;
import edu.ben.model.CreditCard;
import edu.ben.model.User;

/**
 * Servlet implementation class CreditCardServlet
 */
@WebServlet("/CreditCardServlet")
public class CreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreditCardServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("index.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/* Retrieves the card infomation the user entered  */	
		String cardNumber = request.getParameter("cardNumber");
		String expirationDate =  request.getParameter("expirationMonth");
		String expirationYear = request.getParameter("expirationYear");
		String expiration = expirationDate + "/" + expirationYear;

		/* Retrieves the users information form the session */
		User user = (User) request.getSession(true).getAttribute("user");
		String name = user.getFirstName() + " " + user.getLastName();
		CreditCardDao cDao = new CreditCardDao();
		
		/* Inserts the new card into the database */
		try {
			cDao.insertCreditCard(new CreditCard(name, cardNumber, expiration, "visa"), user.getEmail());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			/*repopulates the creditcard arraylist with the new credit card saved*/
			ArrayList<CreditCard> cards = cDao.getAllCreditCards(user.getEmail());
			request.getSession(true).setAttribute("cards", cards);
			response.sendRedirect("index.jsp");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
