/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.Customer;
import java.io.IOException;
import java.io.OutputStream;
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
@WebServlet(name = "UserImageServlet", urlPatterns = {"/UserImageServlet"})
public class UserImageServlet extends HttpServlet {

	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session != null)
		{
			Customer customer = (Customer)session.getAttribute("customer");
			if(customer != null)
			{
				System.out.println("usrimage");
				response.setContentType("image/gif");
				OutputStream os = response.getOutputStream();
				os.write(customer.getImage());
				os.flush();
				os.close();
			}
		}
	}

	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	}// </editor-fold>

}
