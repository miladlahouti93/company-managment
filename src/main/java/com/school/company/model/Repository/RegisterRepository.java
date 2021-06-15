package com.school.company.model.Repository;

import com.school.company.model.DA.EmployeeManagment;
import com.school.company.model.Entity.Employee;

public class RegisterRepository {
    Employee employee;
//    public RegisterRepository(String firstname , String lastname , String email_address , String password , String creatDateAndTime, int ){
//        employee = new Employee(name,lastname,email,password,repassword,group);
//    }

    public boolean registerEmployee(){
        EmployeeManagment employeeManagment = new EmployeeManagment();
        return employeeManagment.insertEmployee(this.employee);
    }
}
