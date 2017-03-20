/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.DBConnection;
import com.mobiland.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eslam
 */
@WebServlet(name = "SearchProduct", urlPatterns = {"/SearchProduct"})
public class SearchProduct extends HttpServlet {

	
	
	DBConnection db=null;
	Product product;
	ArrayList<Product> products ;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String productName=request.getParameter("product");
		
		try {

			if (db == null) {
				db = new DBConnection();
			}

			products = db.search(productName);
			if (products != null) {
				System.out.println("eslam");
				request.setAttribute("products", products);
			
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/searchResult.jsp");
				dispatcher.forward(request, response);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	
	}

	
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
