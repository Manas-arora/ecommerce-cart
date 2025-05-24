<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Product" %>
<html>
<head><title>Your Cart</title></head>
<body>
<h2>Cart Items</h2>
<%
    List<Product> cart = (List<Product>) session.getAttribute("cart");
    if (cart == null || cart.isEmpty()) {
%>
    <p>Your cart is empty.</p>
<% } else {
    for (Product p : cart) { %>
        <p><%= p.getName() %> - ₹<%= p.getPrice() %></p>
<%  } } %>
<a href="products">Back to Products</a>
</body>
</html>