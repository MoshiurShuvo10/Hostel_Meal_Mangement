
package com.myhostel.controller;

import com.myhostel.dao.MemberDao;
import com.myhostel.entity.MemberStatistics;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            // ===============ADMIN LOGIN==============
            if(request.getParameter("AdminLogin")!=null){
            
            String adminUserName=request.getParameter("AdminUserName") ; 
            String adminPassword = request.getParameter("AdminPassword") ; 
            
            if(adminUserName.equals("MoshiurShuvo10") && adminPassword.equals("shuvo10")){
                request.getSession().setAttribute("adminName",adminUserName) ;
                request.getSession().setAttribute("adminPass",adminPassword) ; 
                request.getRequestDispatcher("adminPage.jsp?adminName=adminUserName").forward(request, response);
            }
            else{
                
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User name or password is incorrect');");
                out.println("</script>");
                request.getRequestDispatcher("index.html").include(request, response);
            }
            }
            //============= ADMIN LOGIN FINISHED ==========
            
            //============ ADD MEMBER =====================
            else if(request.getParameter("addMember")!=null){
                String mname = request.getParameter("memberName") ; 
                int minvest = Integer.parseInt(request.getParameter("memberInvestment")) ; 
                double mmeal = Double.parseDouble(request.getParameter("memberMeal")) ; 
                
                MemberStatistics member = new MemberStatistics(mname, minvest, mmeal); 
                MemberDao memDao = new MemberDao() ; 
                boolean addStatus = memDao.addMember(member) ; 
                if(addStatus){
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Member added successfully');");
                 out.println("</script>");
                 request.getRequestDispatcher("memberPage.jsp").include(request, response);
                }
                else{
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Failed to add member');");
                 out.println("</script>");
                 request.getRequestDispatcher("memberPage.jsp").include(request, response);
                }    
            }

            //============ ADD MEMBER FINISHED=============
            
            //============ UPDATE A MEMBERS INFO ==========
            
            else if(request.getParameter("editMember")!=null){
                
                int mid = Integer.parseInt(request.getParameter("memberId")) ; 
                String mname = request.getParameter("memberName") ; 
                int minvest = Integer.parseInt(request.getParameter("memberInvestment")) ; 
                double mmeal = Double.parseDouble(request.getParameter("memberMeal")) ;
                MemberDao memDao = new MemberDao() ; 
                MemberStatistics ms = memDao.getMember(mid) ; 
                ms.setMemberName(mname);
                ms.setMemberInvestment(minvest);
                ms.setMemberMeal(mmeal);
                boolean updateStatus = memDao.updateMember(ms) ; 
                 if(updateStatus){
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Member updated successfully');");
                 out.println("</script>");
                 request.getRequestDispatcher("memberPage.jsp").include(request, response);
                }
                else{
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Failed to add member');");
                 out.println("</script>");
                 request.getRequestDispatcher("memberPage.jsp").include(request, response);
                }  
            }
            //============ MEMBER UPDATE FINISHED =========
            
            else if(request.getParameter("for").equalsIgnoreCase("delete")){
                MemberStatistics member = new MemberDao().getMember(Integer.parseInt(request.getParameter("memid"))) ; 
                boolean deleteStatus = new MemberDao().deleteMember(member) ; 
                if(deleteStatus){
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Member deleted successfully');");
                 out.println("</script>");
                 request.getRequestDispatcher("memberPage.jsp").include(request, response);
                }
                else{
                 out.println("<script type=\"text/javascript\">");
                 out.println("alert('Failed to delete member');");
                 out.println("</script>");
                 request.getRequestDispatcher("memberPage.jsp").include(request, response);
                }  
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
