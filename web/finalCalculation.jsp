<%@page import="java.util.Formatter"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.myhostel.dao.MemberDao"%>
<%@page import="com.myhostel.entity.MemberStatistics"%>
<%@page import="com.myhostel.dao.CostDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.myhostel.entity.CostList"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.myhostel.util.HibernateUtil"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Final Page</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/style.css"
    </head>
    <body>
                  <%
                       Formatter fmt = new Formatter();

                      
                      //---------- Getting total Cost ----------------------
                        ArrayList<CostList> costArrayList = new CostDao().getCostList() ; 
                        int totalCost = 0 ; 
                        for(CostList c : costArrayList){
                            totalCost += c.getCost() ; 
                        }
                        
                        //-------- Getting total Investment--------------------
                        ArrayList<MemberStatistics> memberList = new MemberDao().getMemberList() ; 
                        int totalInvestment = 0 ; 
                        double totalMeal = 0.0  ;
                        for(MemberStatistics m : memberList){
                            totalInvestment += m.getMemberInvestment() ; 
                            totalMeal += m.getMemberMeal() ; 
                        }
                    double mealRate = totalCost/totalMeal ;
                    fmt.format("%.2f",mealRate);
                    %>
        <center>
           <table border="1" width="50%" style="border-collapse: collapse">
               <thead>
                   <tr>
                       <th>Total Investment</th>
                       <th>Total Meal</th>
                       <th>Total Cost</th>
                       <th>Meal Rate</th>
                   </tr>
               </thead>
               <tbody>
                   <tr style="text-align: center">
                       <td><%=totalInvestment%> /=</td>
                       <td><%=totalMeal%></td>
                       <td><%=totalCost%> /=</td>
                       <td><%=fmt%> /=</td>
                   </tr>
               </tbody>
            </table>
        </center>
        
                   <table border="1" width="50%" style="border-collapse: collapse">
                       <thead>
                           <tr style="text-align: center">
                               <th>Id</th>
                               <th>Name</th>
                               <th>Investment</th>
                               <th>Meal</th>
                               <th>Bill [Meal X Meal Rate]</th>
                               <th>Status</th>
                           </tr>
                       </thead>
                       <%
                           
                           for(MemberStatistics m : memberList){ 
                           double bill = m.getMemberMeal()*mealRate ;
                           Formatter formatter = new Formatter() ; 
                           formatter.format("%.2f",bill);
                           double status = m.getMemberInvestment()-bill ; 
                        %>
                           
                       <tbody>
                           <%
                           String st = new MemberDao().getPayReceive(m.getMemberInvestment(), bill);
                           
                           %>
                           
                           <tr style="text-align: center">
                               <td><%=m.getMemberId()%></td>
                               <td><%=m.getMemberName()%></td>
                               <td><%=m.getMemberInvestment()%></td>
                               <td><%=m.getMemberMeal()%></td>
                               <td><%=formatter%> /=</td>
                               <td><%=st%></td>
                               
                           </tr>
                            <%}%>
                       </tbody>
                       
                       
                   </table> 
    </body>
</html>
