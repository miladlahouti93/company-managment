package com.school.company.controller.listEmployee;

import com.school.company.model.Entity.Employee;
import com.school.company.model.Service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class EmployeeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EmployeeService employeeService = new EmployeeService();
        List<Employee> employeeDetailList=employeeService.getEmployees();
        request.setAttribute("tableEmployees",employeeDetailList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("employeeList.jsp");
        dispatcher.forward(request,response);
    }
}
