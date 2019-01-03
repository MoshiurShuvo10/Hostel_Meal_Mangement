
<%@page import="com.myhostel.dao.MemberDao"%>
<%@page import="com.myhostel.entity.MemberStatistics"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit member</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
    <ul>
        <li><a href="adminPage.jsp">Admin Homepage</a></li>
    </ul>
        <form action="AdminController" method="post" name="editForm">
        <table>
            <thead>
                <tr text-align="center">
                    <td colspan="3">
                       Edit member's info
                    </td>
                </tr>
            </thead>
            <%
                MemberStatistics member = new MemberDao().getMember(Integer.parseInt(request.getParameter("memid"))) ; 
            %>
            <tbody>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="memberId" value="<%=member.getMemberId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="memberName" value="<%=member.getMemberName()%>" required></td>
                </tr>
                <tr>
                    <td>Investment</td>
                    <td><input type="text" name="memberInvestment" value="<%=member.getMemberInvestment()%>" required></td>
                </tr>
                <tr>
                    <td>Meal</td>
                    <td><input type="text" name="memberMeal" value="<%=member.getMemberMeal()%>" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="editMember"  value="UPDATE"></td>
                </tr>
            </tbody>
        </table>
    </form>
    </body>
</html>
