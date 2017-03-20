/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.Customer;
import com.mobiland.model.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Eslam
 */
@WebServlet(name = "EditCustomer", urlPatterns = {"/EditCustomer"})
public class EditCustomer extends HttpServlet {

	
	DBConnection db=null;
	Customer customer;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		PrintWriter out=response.getWriter();
		int result=StatusHandler.ERR_DB_PROC;
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String phone = request.getParameter("phone");
		System.out.println("after session "+fname);
		String email = request.getParameter("email");
		String address = request.getParameter("address");

		try {
			HttpSession session = request.getSession(false);
			if (session != null) {
				
				customer = (Customer) session.getAttribute("customer");
				if (customer != null) {
					customer.setFName(fname);
					System.out.println("session customer is :"+customer.getFName());
					customer.setLName(lname);
					customer.setPhone(phone);
					customer.setEmail(email);
					customer.setAddress(address);
					System.out.println("eslam");
					if(db==null)
						db = new DBConnection();
												
					result=db.updateUser(customer);
						
					System.out.println("ashour"+result);
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			result = StatusHandler.ERR_DB_CONN;
		}
		
		out.print(result);
	}

	
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
