/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mobiland.admin.controller;


import com.mobiland.model.DBConnection;
import com.mobiland.model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
 * @author shibo
 */
@MultipartConfig(maxFileSize = 16177216)
@WebServlet(name = "AdminEditSingleProduct", urlPatterns = {"/AdminEditSingleProduct"})
public class AdminEditSingleProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
//        System.out.println(id);
        System.out.println("desc is " + request.getParameter("desc"));
        Product product = new Product(id, request.getParameter("name"), request.getParameter("desc"), Double.parseDouble(request.getParameter("price")), Integer.parseInt(request.getParameter("quantity")));
System.out.println(product);
        DBConnection db=null;
        try {
            db = new DBConnection();
        } catch (SQLException ex) {
            Logger.getLogger(AdminEditSingleProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        Part p = request.getPart("image");
        System.out.println("part is " + p);
        boolean x = db.updateProduct(product, p);

        if (x) {

            request.setAttribute("flag2", "updated successfully");
            request.setAttribute("product", product);
//            RequestDispatcher dispatcher = request
//                    .getRequestDispatcher("/AdminEditSingleProduct.jsp?u=" + id);
            RequestDispatcher dispatcher = request
                    .getRequestDispatcher("/AdminEditProduct.jsp");

            dispatcher.forward(request, response);
            // response.sendRedirect("adminProfile.jsp");
        } else {
            System.out.println("wrong");
            request.setAttribute("flag2", "updated failed");
            RequestDispatcher dispatcher = request
                    .getRequestDispatcher("/AdminEditProduct.jsp");
            dispatcher.forward(request, response);

        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
