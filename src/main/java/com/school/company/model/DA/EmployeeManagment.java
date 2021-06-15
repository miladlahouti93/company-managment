package com.school.company.model.DA;

import com.school.company.model.Entity.Employee;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class EmployeeManagment {

    private Connection connection;
    private PreparedStatement preparedStatement;

    public EmployeeManagment(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/CompanyManagment?useSSl=false","root","");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    public boolean insertEmployee(Employee employee){
        try {
            preparedStatement = connection.prepareStatement("inser into employee(username , password) value (?,?)");
            preparedStatement.setString(1,employee.getFirstName());
            preparedStatement.setString(2,employee.getPassword());
            if(preparedStatement.executeUpdate()>0)
                return true;
            return false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
            return false;
        }
    }

//    public Employee updateEmployee(Employee employee){
//        try {
//            preparedStatement = connection.prepareStatement("update t_employee"+"set firstname = ? setlastname=?");
//            preparedStatement.setString(1,employee.getFirstName());
//            preparedStatement.setString(2,employee.getPassword());
//            if(preparedStatement.executeUpdate()>0)
//                return true;
//            return false;
//        } catch (SQLException throwables) {
//            throwables.printStackTrace();
//            return false;
//        }
//    }
}
