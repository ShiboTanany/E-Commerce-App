/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.controller;

import com.mobiland.model.Cart;
import com.mobiland.model.Customer;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author shibo
 */
@WebServlet(name = "ShowCartProducts", urlPatterns = {"/ShowCartProducts"})
public class ShowCartProducts extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            System.out.println("servleeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeet");
            DBConnection db = new DBConnection();
            ArrayList<Cart> list = new ArrayList<Cart>();
            ArrayList<Product> listO = new ArrayList<>();
            HttpSession session = request.getSession(false);

            Customer customer = new Customer();
            customer = (Customer) session.getAttribute("customer");
           
            list = db.getallcart(customer.getId());
            
            session.setAttribute("data", list);

            for (Cart list1 : list) {
                Product x ;
                x = db.searchProduct(list1.getProduct().getProductId());
                listO.add(x);
            }
            for (Product listO1 : listO) {
                System.out.println("id is "+listO1.getProductId());
            }
           

            request.setAttribute("dataproduct", listO);
            RequestDispatcher disptach = request.getRequestDispatcher("cart.jsp");
            disptach.include(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ShowCartProducts.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
