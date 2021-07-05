package com.school.company.controller.Vacation;

import com.school.company.model.Entity.Vacation;
import com.school.company.model.Service.VacationService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/myVacations")
public class MyVacationList extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session = request.getSession();
        String employeeId=(String) session.getAttribute("employeeId");
        VacationService vacationService = new VacationService();
        List<Vacation> employeeVacations = vacationService.getEmployeeVacationList(Integer.parseInt(employeeId));
        request.setAttribute("MyVacations",employeeVacations);
        RequestDispatcher dispatcher = request.getRequestDispatcher("MyVacationList.jsp");
        dispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vacationId = request.getParameter("vacationId");
        VacationService vacationService = new VacationService();
        Vacation vacation = vacationService.findVacationById(Integer.parseInt(vacationId));
        request.setAttribute("myVacation",vacation);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Updatevacation.jsp");
        dispatcher.forward(request,response);
    }
}
