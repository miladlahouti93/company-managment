package com.school.company.model.DA;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class hibernateUtil {
    private  static SessionFactory sessionFactory;

    private static SessionFactory buildSessionFactory(){
       try{
           Configuration configuration = new Configuration();
           configuration.configure("hibernate.cfg.xml");
           System.out.println("hibernate configuration loaded");

           SessionFactory sessionFactory = configuration.buildSessionFactory();
           return sessionFactory;
       }
       catch (Exception e){
           System.out.println("khata");
           return null;
       }
    }
    public static SessionFactory getSessionFactory()
    {
        if(sessionFactory==null)
            sessionFactory=buildSessionFactory();
        return sessionFactory;
    }
}
