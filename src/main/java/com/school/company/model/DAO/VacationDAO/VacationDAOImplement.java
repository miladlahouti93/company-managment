package com.school.company.model.DAO.VacationDAO;

import com.school.company.model.DAO.JPAProvider;
import com.school.company.model.Entity.Employee;
import com.school.company.model.Entity.Vacation;
import com.school.company.model.Entity.categoryElement;


import javax.persistence.*;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class VacationDAOImplement implements VacationDAO {

    @Override
    public Number vacationCount() {
        EntityManager entityManager = JPAProvider.getEntityManager();
        Number vacationCount= (Number) entityManager.createQuery("SELECT count(*) from Vacation ").getSingleResult();
        return vacationCount;
    }

    @Override
    public Vacation findVacationById(int vacationId) {
        EntityManager entityManager=JPAProvider.getEntityManager();
        Vacation vacation = entityManager.find(Vacation.class,vacationId);
        return vacation;
    }

    @Override
    public List<Vacation> getVacationList(int min,int max) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        transaction.begin();
        TypedQuery<Vacation> query= entityManager.createQuery(" from Vacation v  where v.updateDateAndTime is null  order by v.id ",Vacation.class);
        query.setFirstResult(min);
        query.setMaxResults(max);
        List<Vacation> vacationList = query.getResultList();
        transaction.commit();
        entityManager.close();
        return  vacationList;
    }

    @Override
    public List<Vacation> getEmployeeVacationList(int employeeId) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        List<Vacation> employeeVacationList = entityManager.createNativeQuery("select * from t_vacation where c_DeleteDateAndTime is null and c_Employee=?",Vacation.class).setParameter(1,employeeId).getResultList();
        entityManager.close();
        return  employeeVacationList ;
    }

    @Override
    public void insertVacation(int employeeId, Vacation vacation) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Employee employee = entityManager.find(Employee.class,employeeId);
        transaction.begin();
        vacation.setEmployee(employee);
        entityManager.persist(vacation);
        transaction.commit();
        entityManager.close();
    }


    @Override
    public  Map<String,String> VacationTimeListOfEmployee(int employeeId) {
        Map<String,String> vacationTimeMapList= new HashMap<String,String >();
        EntityManager entityManager = JPAProvider.getEntityManager();
        List<Object[]>  vacationTimeList = entityManager.createNativeQuery("SELECT c_VacationStartDateAndTime as startTime,c_VacationEndDateAndTime as endTime from t_vacation  where c_Employee=?").setParameter(1,employeeId).getResultList();
        for(Object[] list : vacationTimeList){
            vacationTimeMapList.put(list[0].toString(),list[1].toString());
        }
        entityManager.close();
        return  vacationTimeMapList;

    }

    @Override
    public void updateVacationStatus(int vacationId, int categoryElementId) {
       EntityManager entityManager= JPAProvider.getEntityManager();
       entityManager.getTransaction().begin();
       Vacation vacation = entityManager.find(Vacation.class,vacationId);
        categoryElement categoryElement = entityManager.find(categoryElement.class,categoryElementId);
        entityManager.lock(vacation, LockModeType.OPTIMISTIC_FORCE_INCREMENT);
        vacation.setCategoryElement(categoryElement);
       entityManager.getTransaction().commit();
       entityManager.close();

    }

    @Override
    public void updateVacationDateAndTime(int vacationId, String vacationStartDateAndTime, String vacationEndDateAndTime) {
        EntityManager entityManager= JPAProvider.getEntityManager();
        entityManager.getTransaction().begin();
        Vacation vacation = entityManager.find(Vacation.class,vacationId);
        entityManager.lock(vacation, LockModeType.OPTIMISTIC_FORCE_INCREMENT);
        vacation.setVacationStartDateAndTime(vacationStartDateAndTime);
        vacation.setVacationEndDateAndTime(vacationEndDateAndTime);
        entityManager.getTransaction().commit();
        entityManager.close();
    }

    @Override
    public void deleteVacation(int vacationId) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        Date date = new Date();
        entityTransaction.begin();
        Vacation vacation = entityManager.find(Vacation.class,vacationId);
        entityManager.lock(vacation,LockModeType.OPTIMISTIC_FORCE_INCREMENT);
        vacation.setDeleteDateAndTime(new Timestamp(date.getTime()).toString());
        entityTransaction.commit();
        entityManager.close();

    }
}
