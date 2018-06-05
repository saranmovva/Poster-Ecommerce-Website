package edu.ben.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AccountServlet
 */
@WebServlet("/AccountServlet/*")
public class AccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccountServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getPathInfo().equals("/ShippingInformation")) {
			String resp = "ShippingInformation";
			request.getSession(true).setAttribute("AccountMenu", resp);
		} else if (request.getPathInfo().equals("/PaymentInformation")) {
			String resp = "PaymentInformation";
			request.getSession(true).setAttribute("AccountMenu", resp);
		} else if (request.getPathInfo().equals("/AccountSettings")) {
			String resp = "AccountSettings";
			request.getSession(true).setAttribute("AccountMenu", resp);
		}
		
		response.sendRedirect("/CMSC374Lab3/Account.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
