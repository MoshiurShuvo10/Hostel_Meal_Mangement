
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add member</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
        <form action="AdminController" method="post" name="insertForm">
        <table>
            <thead>
                <tr text-align="center">
                    <td colspan="3">
                        Add member
                    </td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="memberName" required></td>
                </tr>
                <tr>
                    <td>Investment</td>
                    <td><input type="text" name="memberInvestment" required></td>
                </tr>
                <tr>
                    <td>Meal</td>
                    <td><input type="text" name="memberMeal" required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="addMember"  value="ADD"></td>
                </tr>
            </tbody>
        </table>
    </form>
    </body>
</html>
