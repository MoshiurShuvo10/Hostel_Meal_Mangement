
package com.myhostel.controller;

import com.myhostel.dao.CostDao;
import com.myhostel.dao.MemberDao;
import com.myhostel.entity.CostList;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CostController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            if(request.getParameter("saveCost")!=null){
                String memName = request.getParameter("memberName") ; 
                int memId = Integer.parseInt(request.getParameter("memberId")) ; 
                String date = request.getParameter("date") ; 
                int cost = Integer.parseInt(request.getParameter("cost")) ; 
                boolean authenticate = new MemberDao().authenticateMember(memName, memId) ; 
                if(authenticate){
                     
                CostList clist = new CostList(memName,memId,date,cost) ; 
                CostDao costDao = new CostDao();
                boolean saveCostStatus = costDao.saveCost(clist) ;
                 
                if(saveCostStatus){
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('cost info saved successfully');");
                 out.println("</script>");
                 request.getRequestDispatcher("costList.jsp").include(request, response);
                }
                else{
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Failed to save cost info');");
                 out.println("</script>");
                 request.getRequestDispatcher("costList.jsp").include(request, response);
                }
            }
                else {
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Invalid member');");
                 out.println("</script>");
                 request.getRequestDispatcher("costList.jsp").include(request, response);
                }
                 
            }
            
            else if(request.getParameter("updateCostList")!=null){
                int serial = Integer.parseInt(request.getParameter("costSerial")) ; 
                String memName = request.getParameter("memberName") ; 
                int memId = Integer.parseInt(request.getParameter("memberId")) ; 
                String date = request.getParameter("date") ; 
                int cost = Integer.parseInt(request.getParameter("cost")) ;
                
                CostList costList = new CostDao().getCostListById(serial) ;
                boolean updateCostStatus = new CostDao().updateCost(costList) ;
                if(updateCostStatus){
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('cost info updated successfully');");
                 out.println("</script>");
                 request.getRequestDispatcher("costList.jsp").include(request, response);
                }
                else{
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Failed to update cost info');");
                 out.println("</script>");
                 request.getRequestDispatcher("costList.jsp").include(request, response);
                }
            }
           
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
