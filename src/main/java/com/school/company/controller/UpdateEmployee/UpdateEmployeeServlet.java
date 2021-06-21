package com.school.company.controller.UpdateEmployee;

import com.school.company.model.Entity.Employee;
import com.school.company.model.Entity.categoryElement;
import com.school.company.model.Service.CategoryElementService;
import com.school.company.model.Service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.Response;
import java.io.IOException;
import java.util.List;

public class UpdateEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId=request.getParameter("employeeId");

        EmployeeService employeeService = new EmployeeService();
        Employee employeeInfo=employeeService.findEmployeeById(Integer.parseInt(employeeId));
        request.setAttribute("employeeInfo",employeeInfo);
        CategoryElementService categoryElementService = new CategoryElementService();
        List<categoryElement> CatagoryElementlist = categoryElementService.getCategoryElements(1);
        request.setAttribute("listCategory", CatagoryElementlist);

        List<Employee> employeeList = employeeService.getEmployees();
        request.setAttribute("listEmployee", employeeList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateFormEmployee.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId=request.getParameter("employeeID");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String emailAddress= request.getParameter("emailAddress");
        String password = request.getParameter("password");
        String category=request.getParameter("category");
        String manager = request.getParameter("Manager");

        CategoryElementService categoryElementService=new CategoryElementService();
        EmployeeService employeeService = new EmployeeService();
        categoryElement categoryElement = categoryElementService.findCategoryElementById(Integer.parseInt(category));
        Employee Manager = employeeService.findEmployeeById(Integer.parseInt(manager));

        Employee employee = new Employee();
        employee.setFirstName(firstName);
        employee.setLastName(lastName);
        employee.setEmailAddress(emailAddress);
        employee.setPassword(password);
        employee.setCategoryElement(categoryElement);
        employee.setEmployee(Manager);

        employeeService.updateEmployee(Integer.parseInt(employeeId),employee);


        Response.status(200).entity("updated employee").build();
    }
}
