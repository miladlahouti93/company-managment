package com.school.company.model.DAO.EmployeeDAO;

import com.school.company.model.DAO.EmployeeDAO.EmployeeDAO;
import com.school.company.model.DAO.JPAProvider;
import com.school.company.model.Entity.Employee;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.LockModeType;
import javax.persistence.Query;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class EmployeeDaoImplement implements EmployeeDAO {

    @Override
    public List<Employee> getEmployees() {
        EntityManager entityManager = JPAProvider.getEntityManager();
        Query query = entityManager.createNativeQuery("select * from t_employee where c_DeleteDateAndTime is null ;",Employee.class);
        List<Employee> employeeList = query.getResultList();
        entityManager.close();
        return employeeList;
    }


    @Override
    public void insertEmployee(Employee employee) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();

        transaction.begin();
        entityManager.persist(employee);

        transaction.commit();
        entityManager.close();
    }

    @Override
    public void deleteEmployeeById(int id) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction entityTransaction = entityManager.getTransaction();
        Date date = new Date();
        entityTransaction.begin();
        Employee employee = entityManager.find(Employee.class,id);
        entityManager.lock(employee, LockModeType.OPTIMISTIC_FORCE_INCREMENT);
        employee.setDeleteDateAndTime(new Timestamp(date.getTime()).toString());
        entityTransaction.commit();
        entityManager.close();
    }

    @Override
    public Employee findEmployeeById(int id) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        Employee employee = entityManager.find(Employee.class,id);
        entityManager.close();
        return employee;
    }

    @Override
    public void updateEmployee(int id,Employee employee) {
        EntityManager entityManager = JPAProvider.getEntityManager();
        EntityTransaction entityTransaction=entityManager.getTransaction();
        entityTransaction.begin();

        Employee Employee = entityManager.find(Employee.class,id);
        entityManager.lock(Employee, LockModeType.OPTIMISTIC_FORCE_INCREMENT);
        Employee.setFirstName(employee.getFirstName());
        Employee.setLastName(employee.getLastName());
        Employee.setEmailAddress(employee.getEmailAddress());
        Employee.setPassword(employee.getPassword());
        Employee.setCategoryElement(employee.getCategoryElement());
        Employee.setEmployee(employee.getEmployee());

        entityManager.persist(Employee);

        entityTransaction.commit();
        entityManager.close();

    }
}
