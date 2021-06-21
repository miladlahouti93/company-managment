package com.school.company.model.DAO;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceUnit;

public class JPAProvider {


    private static EntityManagerFactory entityManagerFactory ;

    static {
        entityManagerFactory = Persistence.createEntityManagerFactory("one");
        System.out.println(entityManagerFactory);
    }


    public static EntityManager getEntityManager()
    {
        return entityManagerFactory.createEntityManager();
    }
}
