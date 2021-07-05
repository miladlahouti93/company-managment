package com.school.company.model.DAO.CategoryDAO;

import com.school.company.model.DAO.CategoryDAO.CategoryElementDAO;
import com.school.company.model.DAO.JPAProvider;
import com.school.company.model.Entity.categoryElement;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class CtegoryElementDAOImplement implements CategoryElementDAO {

    @Override
    public List<categoryElement> getCategoryElements(int categoryId) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        List<categoryElement> categoryElementList  = (List<categoryElement>)entityManager.createNativeQuery("select * from t_categoryelement where c_Category=:id",categoryElement.class).setParameter("id",categoryId).getResultList();
        entityManager.close();
        return categoryElementList;
    }

    @Override
    public void insertCategoryElement(categoryElement categoryElement) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        transaction.begin();
        entityManager.persist(categoryElement);

        transaction.commit();
        entityManager.close();
    }

    @Override
    public void deleteCategoryElement(int categoryElementId) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        Date date = new Date();
        entityTransaction.begin();
        categoryElement categoryElement = entityManager.find(categoryElement.class,categoryElementId);
        categoryElement.setDeleteDateAndTime(new Timestamp(date.getTime()).toString());
        entityTransaction.commit();
        entityManager.close();
    }

    @Override
    public categoryElement findCategoryElementById(int categoryElementId) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        categoryElement categoryElement = entityManager.find(categoryElement.class,categoryElementId);
        entityManager.close();
        return categoryElement;
    }


}
