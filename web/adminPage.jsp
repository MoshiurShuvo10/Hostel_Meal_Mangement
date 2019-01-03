<%-- 
    Document   : adminPage
    Created on : Dec 27, 2018, 1:12:13 AM
    Author     : Hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
        <ul>
            <li><a href="memberPage.jsp">Member List</a></li>
            <li><a href="costList.jsp">Cost List</a></li>
            <li><a href="logout.jsp?admin_name=<%=session.getAttribute("adminName")%>">Logout</a></li>
        </ul>
    </body>
</html>
