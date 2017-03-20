/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.Customer;
import com.mobiland.model.DBConnection;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author atom
 */
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/add-to-cart"})
public class AddToCartServlet extends HttpServlet {

	private DBConnection conn = null;
	// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
	/**
	 * Handles the HTTP <code>GET</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String page = request.getParameter("page");
		
		try{
			if(conn == null)
				conn = new DBConnection();
			
			String id = (String)request.getParameter("id");
			
			if(id != null)
			{
				try{
					int prodId = Integer.parseInt(id);
					
					HttpSession session = request.getSession(false);
				
					if(session != null)
					{
						Customer customer = (Customer)session.getAttribute("customer");
						if(customer != null)
						{
							boolean res = conn.addToCart(customer.getId(), prodId);

							if(page != null)
							{
								if(res)
									response.sendRedirect(page + "?status=" + StatusHandler.SUCCESS);
								else
									response.sendRedirect(page + "?status=" + StatusHandler.ERR_DB_PROC);
							}
						}
						else if(page != null)
							response.sendRedirect(page + "?status=" + StatusHandler.ERR_LOGIN_MISSING);
					}
					else if(page != null)
						response.sendRedirect(page + "?status=" + StatusHandler.ERR_LOGIN_MISSING);
						
				} catch(NumberFormatException ex)
				{
					if(page != null)
						response.sendRedirect(page + "?status=" + StatusHandler.ERR_INVALID_DATA);
				}
			}
			else if(page != null)
				response.sendRedirect(page + "?status=" + StatusHandler.ERR_DATA_MISSING);
		} catch(SQLException ex)
		{
			ex.printStackTrace();
			if(page != null)
				response.sendRedirect(page + "?status=" + StatusHandler.ERR_DB_PROC);
		}
	}

	/**
	 * Handles the HTTP <code>POST</code> method.
	 *
	 * @param request servlet request
	 * @param response servlet response
	 * @throws ServletException if a servlet-specific error occurs
	 * @throws IOException if an I/O error occurs
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
