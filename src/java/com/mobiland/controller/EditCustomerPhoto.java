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
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Eslam
 */
@WebServlet(name = "EditCustomerPhoto", urlPatterns = {"/EditCustomerPhoto"})
@MultipartConfig(maxFileSize = 16177216)
public class EditCustomerPhoto extends HttpServlet {

	DBConnection db = null;
	Customer customer;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		
		int result=StatusHandler.ERR_DB_PROC;
		
		response.setContentType("multipart/mixed stream");
		Part part = request.getPart("photo");
		try{
			if (db == null) {
				db = new DBConnection();
			}
			
			HttpSession session = request.getSession(false);

			if (session != null) {
				System.out.println("enter");
				customer = (Customer) session.getAttribute("customer");
				if (customer != null) {
					System.out.println("eslam mahfouz");
					result = db.updateUserPhoto(customer, part);
					Customer apdatedCustomer = db.getCustomer(customer.getEmail());
					session.setAttribute("customer", apdatedCustomer);
				}
			}
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		response.sendRedirect("profile.jsp?status=" + result);
		System.out.println("result photo is:"+result);
	}

	
//	@Override
//	protected void doPost(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		response.setContentType("image/gif");
//		PrintWriter out = response.getWriter();
//		int result = StatusHandler.ERR_DB_PROC;
//		System.out.println("i'm inside post");
//		Part part = request.getPart("photo");
//		System.out.println("part is "+part);
//		try {
//			if (db == null) {
//				db = new DBConnection();
//				
//				HttpSession session = request.getSession(false);
//				if (session != null) {
//					customer=(Customer) session.getAttribute("customer");
//					if(customer!=null){
//						result=db.updateUserPhoto(customer,part);
//					}				
//				}
//			}
//
//		} catch (SQLException ex) {
//			ex.printStackTrace();
//			result = StatusHandler.ERR_DB_CONN;
//		}
//		out.print(result);
//	}
//
//	
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
