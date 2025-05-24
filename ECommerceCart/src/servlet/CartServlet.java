package servlet;

import dao.ProductDAO;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("productId"));

        HttpSession session = request.getSession();
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart == null) cart = new ArrayList<>();

        try {
            Product product = new ProductDAO().getProductById(id);
            cart.add(product);
            session.setAttribute("cart", cart);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        response.sendRedirect("cart.jsp");
    }
}