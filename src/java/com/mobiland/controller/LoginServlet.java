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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author atom
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login-serv"})
public class LoginServlet extends HttpServlet {

	DBConnection conn;

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
		String email = request.getParameter("userName");
		String pass = request.getParameter("password");
		String page = request.getParameter("page");
		if(page != null && email != null && pass != null)
		{
			try
			{
				if(conn == null)
					conn = new DBConnection();
				int st = conn.sigIn(email, pass);
				if(st == StatusHandler.SUCCESS)
				{
					Customer customer = conn.getCustomer(email);
					if(customer != null)
					{
						HttpSession session = request.getSession(true);
						session.setAttribute("customer", customer);
						response.sendRedirect(page + "?status=" + StatusHandler.SUCCESS);
					}
					else
						response.sendRedirect(page + "?status=" + StatusHandler.ERR_DB_PROC);
				}
				else
					response.sendRedirect(page + "?status=" + st);
			} catch(SQLException ex)
			{
				response.sendRedirect(page + "?status=" + StatusHandler.ERR_DB_CONN);
			}
		}
		else
			response.sendRedirect(page + "?status=" + StatusHandler.ERR_LOGIN_DATA_MISS);
	}

	/**
	 * Returns a short description of the servlet.
	 *
	 * @return a String containing servlet description
	 */
	@Override
	public String getServletInfo() {
		return "Try to sign the user in.";
	}// </editor-fold>

}
