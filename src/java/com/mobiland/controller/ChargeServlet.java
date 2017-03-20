/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.Cards;
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
@WebServlet(name = "ChargeServlet", urlPatterns = {"/ChargeServlet"})
public class ChargeServlet extends HttpServlet {

	DBConnection db=null;
	Cards card;
	Customer customer;
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int result=StatusHandler.ERR_DB_PROC;		
		String serial=request.getParameter("coupon_code");
		HttpSession session=request.getSession(false);
		if(db==null)
		{
			try {
				db=new DBConnection();
				card=db.getCard(serial);
				if(card!=null)
				{
					double amount=card.getAmount();
					if(session!=null)
					{
						customer=(Customer) session.getAttribute("customer");
						double balance=customer.getCash()+amount;
						
						result=db.updateUserCash(customer, balance);
						if(result==StatusHandler.SUCCESS)
						{
							db.deleteCard(serial);
							Customer apdatedCustomer=db.getCustomer(customer.getEmail());
							System.out.println("after update"+apdatedCustomer.getCash());
							session.setAttribute("customer", apdatedCustomer);
							Customer customer =(Customer) session.getAttribute("customer");
							System.out.println("session"+customer.getCash());
						}
					}
				}
			} catch (SQLException ex) {
				ex.printStackTrace();
			}
		}
		System.out.println("usercash"+customer.getCash());
		response.sendRedirect("profile.jsp?status="+result);
	}

	
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
