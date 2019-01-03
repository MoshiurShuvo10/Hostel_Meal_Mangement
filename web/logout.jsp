<%-- 
    Document   : logout
    Created on : Jan 2, 2019, 11:26:18 PM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
       <%
       String userName = (String)request.getAttribute("admin_name")  ;
            session.getAttribute(userName);
            session.invalidate(); 
            response.sendRedirect("index.html") ;
       %>
    </body>
</html>
