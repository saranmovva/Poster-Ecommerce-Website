package edu.ben.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.ben.dao.CreditCardDao;
import edu.ben.dao.UserDao;
import edu.ben.model.CreditCard;
import edu.ben.model.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = { "/LoginServlet", "/login" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/* Gets the email and password the user types in */
		String username = request.getParameter("userName");
		String password = request.getParameter("password");

		/* Creates a UserDao object */
		UserDao uDao = new UserDao();

		try {
			/* Attempts to find the email */
			User user = uDao.getUserByEmail(username);

			if (user != null) {
				/*
				 * If the email exists in the database creates a session with
				 * the user's information
				 */
				if (isUser(user.getPassword(), password)) {
					CreditCardDao cDao = new CreditCardDao();
					ArrayList<CreditCard> savedCards = cDao.getAllCreditCards(user.getEmail());
					HttpSession session = request.getSession(true);
					session.setAttribute("user", user);
					if (savedCards != null) {
						session.setAttribute("cards", savedCards);
					}
					/*
					 * Redirects the user on successful log in to the home page
					 */
					response.sendRedirect("index.jsp");
				} else {
					/*
					 * If password is incorrect sends the user back to the login
					 * page
					 */
					response.sendRedirect("Login.jsp");
				}
			} else {
				/*
				 * If the email is not found in the database user is sent back
				 * to the login page
				 */
				response.sendRedirect("Login.jsp");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * Verifies the user entered a correct password
	 * 
	 * @param actualPassword
	 *            - the password in the database
	 * @param enteredPassword
	 *            - the password the user entered
	 * @return
	 */
	public boolean isUser(String actualPassword, String enteredPassword) {
		if (actualPassword.equals(enteredPassword)) {
			return true;
		}

		return false;
	}

}
