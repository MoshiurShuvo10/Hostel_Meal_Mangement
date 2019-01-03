
package com.myhostel.dao;

import com.myhostel.entity.CostList;
import com.myhostel.util.HibernateUtil;
import java.util.ArrayList;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class CostDao {
    
    public boolean saveCost(CostList costList){
        try{
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ; 
        session.beginTransaction()  ;
        session.save(costList) ;
        session.getTransaction().commit();
        session.close() ;
        return true ;
        }
      catch(Exception ex){
          return false ; 
      } 
    }
    
    public CostList getCostListById(int cost_id){
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ;
        CostList costList =(CostList) session.get(CostList.class,cost_id) ; 
        return costList ; 
    }

    public boolean updateCost(CostList costList){
        try{
            SessionFactory factory = HibernateUtil.getSessionFactory() ; 
            Session session = factory.openSession() ; 
            session.beginTransaction() ; 
            session.update(costList);
            session.getTransaction().commit();
            session.close();
            return true;
        }
        catch(Exception ex){
            return false ; 
        }
    }
    
    public boolean deleteCost(CostList costList){
         try{
            SessionFactory factory = HibernateUtil.getSessionFactory() ; 
            Session session = factory.openSession() ; 
            session.beginTransaction() ; 
            session.delete(costList);
            session.getTransaction().commit();
            session.close();
            return true;
        }
        catch(Exception ex){
            return false ; 
        }
    }
    
    public ArrayList<CostList> getCostList(){
        SessionFactory factory = HibernateUtil.getSessionFactory() ; 
        Session session = factory.openSession() ;
        ArrayList<CostList> costArrayList = (ArrayList<CostList>) session.createQuery("From CostList").list();
        return costArrayList ; 
    }
    
}
