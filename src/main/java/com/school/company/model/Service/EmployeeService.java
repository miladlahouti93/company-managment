package com.school.company.model.Service;

import com.school.company.model.DAO.EmployeeDAO;
import com.school.company.model.DAO.EmployeeDaoImplement;
import com.school.company.model.Entity.Employee;

import java.util.List;


public class EmployeeService {

    private EmployeeDAO employeeDAO = new EmployeeDaoImplement();

    public List<Employee> getEmployees() {
        return employeeDAO.getEmployees();
    }


    public void insertEmployee(Employee employee) {
        employeeDAO.insertEmployee(employee);
    }


    public void deleteEmployeeById(int id) {
        employeeDAO.deleteEmployeeById(id);
    }


    public Employee findEmployeeById(int id) {
        return employeeDAO.findEmployeeById(id);
    }

    public void updateEmployee(int id,Employee employee){
        employeeDAO.updateEmployee(id,employee);
    }

}
