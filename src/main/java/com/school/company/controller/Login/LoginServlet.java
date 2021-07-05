package com.school.company.controller.Login;

import com.school.company.model.Service.EmployeeService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId= request.getParameter("employeeId");

        EmployeeService employeeService = new EmployeeService();
        if(employeeId!=null && employeeService.findEmployeeById(Integer.parseInt(employeeId))!= null){
            HttpSession session = request.getSession();
            session.setAttribute("employeeId",employeeId);
//            Cookie employeeIdCookie= new Cookie("employeeId",request.getParameter("employeeId"));
//            employeeIdCookie.setMaxAge(24*60*60);
//            response.addCookie(employeeIdCookie);
            RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
            dispatcher.forward(request,response);
    }
}
}
