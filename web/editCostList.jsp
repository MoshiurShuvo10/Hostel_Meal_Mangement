<%-- 
    Document   : editCostList
    Created on : Dec 27, 2018, 1:10:50 PM
    Author     : Hp
--%>

<%@page import="com.myhostel.entity.CostList"%>
<%@page import="com.myhostel.dao.CostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>edit cost list Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
        <form action="CostController" method="post" name="editForm">
        <table>
            <thead>
                <tr text-align="center">
                    <td colspan="3">
                       Edit member's info
                    </td>
                </tr>
            </thead>
            <%
                CostList costList = new CostDao().getCostListById(Integer.parseInt(request.getParameter("costId"))) ; 
            %>
            <tbody>
                <tr>
                    <td>Serial no </td>
                    <td><input type="text" name="costSerial" value="<%=costList.getSlNo()%>" required readonly></td>
                </tr>
                <tr>
                    <td>Member </td>
                    <td><input type="text" name="memberName" value="<%=costList.getMember()%>" required></td>
                </tr>
                <tr>
                    <td>Member Id</td>
                    <td><input type="text" name="memberId" value="<%=costList.getMemberId()%>" required></td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td><input type="text" name="date" value="<%=costList.getDate()%>" required></td>
                </tr>
                <tr>
                    <td>Cost</td>
                    <td><input type="text" name="cost"  value="<%=costList.getCost()%>" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="updateCostList" value="UPDATE"></td>
                </tr>
                    
            </tbody>
        </table>
    </form>
    </body>
</html>
