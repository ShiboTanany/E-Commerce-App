/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.DBConnection;
import com.mobiland.model.Product;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author atom
 */
@WebServlet(name = "ProductImageServlet", urlPatterns = {"/prod-img-serv"})
public class ProductImageServlet extends HttpServlet {

	private DBConnection conn;
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
		String page = (String)request.getParameter("page");
		System.out.println("page = " + page);
		try{
			if(conn == null)
				conn = new DBConnection();
			
			int prodId = Integer.parseInt((String)request.getParameter("id"));

			System.out.println("id = , " + prodId);
			Product prod = conn.getProductById(prodId);

			if(prod != null)
			{
				response.setContentType("image/gif");
				OutputStream os = response.getOutputStream();
				os.write(prod.getImage());
				os.flush();
				os.close();
			}
			else if(page != null)
				response.sendRedirect(page + "?status=" + StatusHandler.ERR_NOT_FOUND);
		} catch(SQLException | NumberFormatException ex)
		{
			ex.printStackTrace();
			if(page != null)
				response.sendRedirect(page + "?status=" + StatusHandler.ERR_DB_CONN);
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
		return "Returns product image.";
	}// </editor-fold>
}
