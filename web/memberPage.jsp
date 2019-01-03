
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.myhostel.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.myhostel.entity.MemberStatistics"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myhostel.dao.MemberDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Member Page</title>
         <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
        
        <ul>
         <li><a href="adminPage.jsp">Admin Homepage</a></li>
         <li><a href="addMember.jsp">Add Member</a></li>
         <li><a href="finalCalculation.jsp">Perform Overall Calculation</a></li>
        </ul>
        <table border="1" width="80%" style="border-collapse: collapse">
            <thead>
                <tr>
                    <td colspan="6" style="text-align: center">Member List</td>
                </tr>
                <tr style="text-align: center;">
                    <td>Id</td>
                    <td>Name</td>
                    <td>Investment</td>
                    <td>Meal</td>
                    <td colspan="2">Action</td>
                </tr>
            </thead>
            <tbody>
                <%
                    MemberDao memDao = new MemberDao() ; 
                    ArrayList<MemberStatistics> member_list = memDao.getMemberList() ; 
                    for(MemberStatistics m : member_list){%>
                       <tr>
                           <td><%=m.getMemberId()%></td>
                           <td><%=m.getMemberName()%></td>
                           <td><%=m.getMemberInvestment()%></td>
                           <td><%=m.getMemberMeal()%></td>
                           <td><a href="edit_member.jsp?memid=<%=m.getMemberId()%>"><button>EDIT</button></a></td>
                           <td><a href="AdminController?memid=<%=m.getMemberId()%>&&for=delete" onclick="return confirm('Are you sure?')"><button>DELETE</button></a></td>
                       </tr>
                  <%  } %>               
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="2" style="text-align: center">Total</td>
                     <%
                            SessionFactory factory = HibernateUtil.getSessionFactory() ; 
                            Session _session = factory.openSession() ; 
                            String sumMeal = "select sum(m.memberMeal) from MemberStatistics m" ;
                            String sumInvestment = "select sum(m.memberInvestment) from MemberStatistics m" ;
                            Query mealQuery = _session.createQuery(sumMeal) ;
                            Query investmentQuery = _session.createQuery(sumInvestment) ;                           
                        %>
                    <td>
                        <%=investmentQuery.list().get(0)%>
                    </td>
                    <td>
                        <%=mealQuery.list().get(0)%>
                    </td>
                     
                </tr>
            </tfoot>
        </table>
    </body>
</html>
