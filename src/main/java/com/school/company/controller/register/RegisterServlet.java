package com.school.company.controller.register;

import com.school.company.model.Entity.Employee;
import com.school.company.model.Entity.categoryElement;
import com.school.company.model.Service.CategoryElementService;
import com.school.company.model.Service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


public class RegisterServlet extends HttpServlet {
    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    private EmployeeService employeeService = new EmployeeService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        CategoryElementService categoryElementService = new CategoryElementService();
        EmployeeService employeeService = new EmployeeService();

        List<categoryElement> CatagoryElementlist = categoryElementService.getCategoryElements(1);
        List<Employee> employeeList = employeeService.getEmployees();

        request.setAttribute("listCategory", CatagoryElementlist);
        request.setAttribute("listEmployee", employeeList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);

    }




}
