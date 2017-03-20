/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
 * @author shibo
 */
@WebServlet(name = "BuyProducts", urlPatterns = {"/BuyProducts"})
public class BuyProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        doPost(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        double sum = 0;
        int customerId = Integer.parseInt(request.getParameter("customer"));
        String[] quantity = request.getParameterValues("qunatity");
        int [] qunatity;
        double cache = Double.parseDouble(request.getParameter("cache"));
        String[] ars = request.getParameterValues("prices");

        String[] ids = request.getParameterValues("ids");
        for (int i = 0; i < ars.length; i++) {
            System.out.println("the id of product is" + ids[i]);
            double ar = Double.parseDouble(ars[i]) * (Integer.parseInt(quantity[i]));
            System.out.println("every product is" + ar + "the cost od product is " + Double.parseDouble(ars[i]) + "\tand the qunatity of it " + Integer.parseInt(quantity[i]));
            sum += ar;
        }
        System.out.println("sum is " + sum);
        if (cache < sum) {
            request.setAttribute("status", "you havenot balance enough to pay");
            RequestDispatcher dispatcher1 = request
                    .getRequestDispatcher("/ShowCartProducts");
            dispatcher1.forward(request, response);

        } else if (cache >= sum) {
            try {
                DBConnection db = new DBConnection();
                //hena b2a 4awia shoghal zay el fol
                System.out.println("sum is " + sum);
                db.changeCache(customerId, sum);//reduce the user cache

                for (int i = 0; i < ars.length; i++) {
                    //resuce the customer cach
                    db.changeQuantity(Integer.parseInt(ids[i]), Integer.parseInt(quantity[i]));//reduce qunatity of each product
                    db.changeStatus(customerId, Integer.parseInt(ids[i]),Integer.parseInt(quantity[i]));
                           }
                request.setAttribute("status", "success you bought those products");
                RequestDispatcher dispatcher1 = request
                        .getRequestDispatcher("/ShowCartProducts");
                dispatcher1.forward(request, response);

            } catch (SQLException ex) {
               request.setAttribute("status", "you have a problem");
            RequestDispatcher dispatcher1 = request
                    .getRequestDispatcher("/cart.jsp");
            dispatcher1.forward(request, response);
            }

        }
        //System.out.println("the cache isusername  " + request.getParameter("cache"));

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
