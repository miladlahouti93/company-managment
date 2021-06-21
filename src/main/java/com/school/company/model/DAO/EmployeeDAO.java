package com.school.company.model.DAO;

import com.school.company.model.Entity.Employee;

import java.util.List;

public interface EmployeeDAO {
    List<Employee> getEmployees();
    void insertEmployee(Employee employee);
    void deleteEmployeeById(int id);
    Employee findEmployeeById(int id);
    void updateEmployee(int id,Employee employee);
}
