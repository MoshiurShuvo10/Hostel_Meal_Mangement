package com.myhostel.dao;

import com.myhostel.entity.MemberStatistics;
import com.myhostel.util.HibernateUtil;
import java.util.ArrayList;
import java.util.Formatter;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class MemberDao {
   // Add a new member to database 
    public boolean addMember(MemberStatistics member){
        try{
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ; 
        session.beginTransaction() ; 
        session.save(member) ; 
        session.getTransaction().commit() ;
        session.close();
        return true ;
        } 
        catch(Exception exception){
            return false ; 
        }
    }
    
    public boolean authenticateMember(String memberName,int memberId){
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ;
        MemberStatistics member = (MemberStatistics)session.get(MemberStatistics.class,memberId) ; 
        if(member.getMemberName().equals(memberName))
            return true ; 
        else return false ; 
        
    }
    //==========================================================================
    
    // Obtain the member list
    public ArrayList<MemberStatistics> getMemberList(){
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ; 
        ArrayList<MemberStatistics> memberList = (ArrayList<MemberStatistics>) session.createQuery("FROM MemberStatistics").list() ; 
        memberList.toString() ;
        return memberList ; 
    }
    //==========================================================================
    
    // Get a specific member by member_id
    public MemberStatistics getMember(int mid){
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ;
        MemberStatistics member = (MemberStatistics) session.get(MemberStatistics.class,mid) ; 
        return member; 
    }
   //===========================================================================
    
    //update members info
    public boolean updateMember(MemberStatistics member){
        try{
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ;
        session.beginTransaction();
        session.update(member);
        session.getTransaction().commit();
        session.close();
        return true;
        }
       catch(Exception ex){
           return false ; 
       }
    }
    //===========================================================================
    
   //Delete member
    public boolean deleteMember(MemberStatistics member){
        try{
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ;
        session.beginTransaction();
        session.delete(member);
        session.getTransaction().commit();
        session.close();
        return true;
        }
       catch(Exception ex){
           return false ; 
       }
    }
    //===========================================================================  
    public String getPayReceive(int invest,double bill){ 
        Formatter formatterpr = new Formatter() ;
                            if(bill > invest){
                                    double pr = bill-invest ;   
                                    return "Will pay "+formatterpr.format("%.2f",pr)+ " taka";
                                     
                                    }
                             else{
                                double pr = invest-bill ;
                                 return "Will receive "+formatterpr.format("%.2f",pr)+ " taka";
                                 
                                }
                                    
                    }
}
