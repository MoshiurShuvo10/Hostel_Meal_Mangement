
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.myhostel.util.HibernateUtil"%>
<%@page import="com.myhostel.entity.CostList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myhostel.dao.CostDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cost List Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
        <ul>
            <li><a href="addCost.jsp">Add cost info</a></li>
            <li><a href="adminPage.jsp">Admin Homepage</a></li>
        </ul> 
                    <table border="1"  style="width:90% ; border-collapse: collapse; text-align: center">
                    
                    <thead>
                <tr>
                    <td colspan="6" style="text-align: center">Cost List</td>
                </tr>
                    <tr>
                        <th>No.</th>
                        <th>Member</th>
                        <th>Member Id</th>
                        <th>Date</th>
                        <th>Cost</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                
                <tbody>
                    <%
                        CostDao costDao = new CostDao() ; 
                        ArrayList<CostList> cost_list = costDao.getCostList() ; 
                        for(CostList c : cost_list){%>
   
                <tr>
                    <td><%=c.getSlNo()%></td> 
                    <td><%=c.getMember()%></td>
                    <td><%=c.getMemberId()%></td>
                    <td><%=c.getDate() %></td>
                    <td><%=c.getCost()%></td>
                    <td><a href="editCostList.jsp?costId=<%=c.getSlNo()%>"><button>Edit</button></a></td>
                </tr>
                <%}%>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="4" style="text-align: center">Total</td>
                        <%
                            SessionFactory factory = HibernateUtil.getSessionFactory() ; 
                            Session _session = factory.openSession() ; 
                            String sumHql = "select sum(c.cost) from CostList c" ;
                            Query query = _session.createQuery(sumHql) ; 
                            
                        %>
                        <td>
                            <%=query.list().get(0)%>
                        </td>
                    </tr>
                </tfoot>
                 </table>
    </body>
</html>
