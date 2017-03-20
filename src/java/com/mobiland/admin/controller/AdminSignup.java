/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.admin.controller;

import com.mobiland.model.Admin;
import com.mobiland.model.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author shibo
 */
public class AdminSignup extends HttpServlet {

 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Admin admin = new Admin(request.getParameter("use"), request.getParameter("ema"), request.getParameter("pass"));
        boolean flag = false;
        try {
            DBConnection operation = new DBConnection();
            flag = operation.insertAdmin(admin);
        } catch (Exception ex) {
        }
        if (flag) {
            request.setAttribute("flag2", "inserted  successfully");
            // request.setAttribute("object", admin);
            RequestDispatcher dispatcher = request
                    .getRequestDispatcher("/adminProfile.jsp");
            dispatcher.forward(request, response);

        } else {
            request.setAttribute("flag2", "inserted falied try again");

            RequestDispatcher dispatcher = request
                    .getRequestDispatcher("/adminProfile.jsp");

            dispatcher.forward(request, response);

        }

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
