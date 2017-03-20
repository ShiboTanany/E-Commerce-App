/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.product.controller;

import com.mobiland.model.DBConnection;
import com.mobiland.model.Product;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author shibo
 */
@MultipartConfig(maxFileSize = 16177216)
public class AdminAddProduct extends HttpServlet {

    DBConnection db;
    Product product;

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdminAddProduct</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdminAddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        try {
            db = new DBConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminAddProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        PrintWriter out = response.getWriter();
        String serialNumber = request.getParameter("serialNumber");
        String name = request.getParameter("productname");
        Double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String description = request.getParameter("description");
        Part productImage = request.getPart("image");
        System.out.println("" + productImage);
        product = new Product();
        product.setSerialNumber(serialNumber);
        product.setName(name);
        product.setPrice(productPrice);
        product.setQuantity(quantity);
        product.setDesc(description);
        System.out.println("the product is " + product);
        boolean flag = false;
        InputStream is = productImage.getInputStream();

        try {
            flag = db.addProduct(product, productImage);

        } catch (SQLException ex) {
            Logger.getLogger(AdminAddProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (flag) {
            request.setAttribute("flag2", "inserted product successfully");
            // request.setAttribute("object", admin);
            RequestDispatcher dispatcher = request
                    .getRequestDispatcher("/AdminAddProduct.jsp");
            dispatcher.forward(request, response);

        } else {
            request.setAttribute("flag2", "inserted product falied try again");

            RequestDispatcher dispatcher = request
                    .getRequestDispatcher("/AdminAddProduct.jsp");

            dispatcher.forward(request, response);

        }
//        System.out.println("done");
//        String status = "success";
//        response.sendRedirect("AdminAddProduct.jsp?status=" + status);
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
