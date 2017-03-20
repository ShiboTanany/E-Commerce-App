package com.mobiland.admin.controller;



import com.mobiland.model.Cards;
import com.mobiland.model.DBConnection;
import com.mobiland.model.Product;
import com.mobiland.product.controller.AdminAddProduct;
import java.io.IOException;
import java.io.InputStream;
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
import javax.servlet.http.Part;

/**
 *
 * @author Doaa
 */
@WebServlet(urlPatterns = {"/AddCardServelt"})
public class AddCardServelt extends HttpServlet {
    
    Cards card;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddCardServelt</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddCardServelt at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        try {
            DBConnection db = new DBConnection();
            PrintWriter out = response.getWriter();
            String serialNumber = request.getParameter("serial");
            int amount = Integer.parseInt(request.getParameter("amount"));
            card = new Cards();
            card.setSerial(serialNumber);
            card.setAmount(amount);
            
            System.out.println("the product is " + card);
            boolean flag=false;
            
            flag = db.addCard(card);
            if (flag) {
                request.setAttribute("flag3", "inserted product successfully");
                // request.setAttribute("object", admin);
                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("/adminProfile.jsp");
                dispatcher.forward(request, response);

            } else {
                request.setAttribute("flag3", "inserted product falied try again");

                RequestDispatcher dispatcher = request
                        .getRequestDispatcher("/adminProfile.jsp");

                dispatcher.forward(request, response);

            }
        } catch (SQLException ex) {
            Logger.getLogger(AddCardServelt.class.getName()).log(Level.SEVERE, null, ex);
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
