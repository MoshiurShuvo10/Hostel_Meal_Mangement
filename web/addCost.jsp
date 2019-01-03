
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Cost</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
        <form action="CostController" method="post" name="addCostForm">
        <table>
            <thead>
                <tr text-align="center">
                    <td colspan="3">
                       Add Cost
                    </td>
                </tr>
            </thead>
            
            <tbody>
                
                <tr>
                    <td>Member </td>
                    <td><input type="text" name="memberName" required></td>
                </tr>
                <tr>
                    <td>Member Id</td>
                    <td><input type="text" name="memberId" required></td>
                </tr>
                <tr>
                    <td>Date</td>
                    <td><input type="text" name="date" required></td>
                </tr>
                <tr>
                    <td>Cost</td>
                    <td><input type="text" name="cost"  required></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" name="saveCost" value="SAVE"></td>
                </tr>
                    
            </tbody>
        </table>
    </form>
    </body>
</html>
