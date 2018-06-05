package edu.ben.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.ben.dao.ProductDao;
import edu.ben.model.Product;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("/ProductServlet/*")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductServlet() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDao pDao = new ProductDao();
		ArrayList<Product> products;

		/*
		 * When a user selects a category of products to select populates the
		 * session with the correct category type of products then redirects the
		 * user to the product page of the category they choice
		 */
		if (request.getPathInfo().equals("/Nature")) {
			try {
				products = pDao.getProductByCatergory("Nature");
				request.getSession(true).setAttribute("ProductByCategory", products);
			} catch (SQLException e) {

				e.printStackTrace();
			}
			response.sendRedirect("/CMSC374Lab3/Products.jsp");
		} else if (request.getPathInfo().equals("/CityScape")) {
			try {
				products = pDao.getProductByCatergory("CityScape");
				request.getSession(true).setAttribute("ProductByCategory", products);
			} catch (SQLException e) {

				e.printStackTrace();
			}
			response.sendRedirect("/CMSC374Lab3/Products.jsp");
		} else if (request.getPathInfo().equals("/CyberPunk")) {
			try {
				products = pDao.getProductByCatergory("CyberPunk");
				request.getSession(true).setAttribute("ProductByCategory", products);
			} catch (SQLException e) {

				e.printStackTrace();
			}
			response.sendRedirect("/CMSC374Lab3/Products.jsp");
		} else if (request.getPathInfo().equals("/Space")) {
			try {
				products = pDao.getProductByCatergory("Space");
				request.getSession(true).setAttribute("ProductByCategory", products);
			} catch (SQLException e) {

				e.printStackTrace();
			}
			response.sendRedirect("/CMSC374Lab3/Products.jsp");
		} else if (request.getPathInfo().equals("/AllProducts")) {
			try {
				products = pDao.getAllProducts();
				request.getSession(true).setAttribute("ProductByCategory", products);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			response.sendRedirect("/CMSC374Lab3/index.jsp");
		} else {
			try {
				products = pDao.getProductByCatergory("Fantasy");
				request.getSession(true).setAttribute("ProductByCategory", products);
			} catch (SQLException e) {

				e.printStackTrace();
			}
			response.sendRedirect("/CMSC374Lab3/Products.jsp");
		}
		//response.sendRedirect("/CMSC374Lab3/Products.jsp");
		// request.getRequestDispatcher("Products.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
