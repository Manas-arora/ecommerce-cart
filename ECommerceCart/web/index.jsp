<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, model.Product" %>
<html>
<head><title>Product List</title></head>
<body>
<h2>Products</h2>
<% List<Product> products = (List<Product>) request.getAttribute("products"); %>
<ul>
<% for(Product p : products) { %>
    <li>
        <%= p.getName() %> - ₹<%= p.getPrice() %>
        <form action="cart" method="post">
            <input type="hidden" name="productId" value="<%= p.getId() %>"/>
            <button type="submit">Add to Cart</button>
        </form>
    </li>
<% } %>
</ul>
</body>
</html>