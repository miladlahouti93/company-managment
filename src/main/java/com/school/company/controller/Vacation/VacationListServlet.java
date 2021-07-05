package com.school.company.controller.Vacation;

import com.school.company.model.Entity.Vacation;
import com.school.company.model.Entity.categoryElement;
import com.school.company.model.Service.CategoryElementService;
import com.school.company.model.Service.VacationService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet("/vacationList")
public class VacationListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pageid =  request.getParameter("page");
        CategoryElementService categoryElementService = new CategoryElementService();
        VacationService vacationService = new VacationService();
        List<Vacation> vacationList ;
        List<categoryElement> categoryElementList=categoryElementService.getCategoryElements(2);
        request.setAttribute("categoryElementList",categoryElementList);
            Map<Integer, Integer> limitedValue= vacationService.paginationRecordLimit(Integer.parseInt(pageid),10);
            Map.Entry<Integer, Integer> entry = limitedValue.entrySet().iterator().next();
            vacationList =vacationService.getVacationList(entry.getKey(),entry.getValue());
        request.setAttribute("VacationList",vacationList);
        request.setAttribute("pageNumbers",vacationService.pageNumbers(10));
        RequestDispatcher dispatcher = request.getRequestDispatcher("VacationList.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] sVacationIds = request.getParameterValues("vacationId");
        int vacationStatus = Integer.parseInt(request.getParameter("VacationStatus"));
        List<Integer> vacationIds = new ArrayList<>();
        for (String id:sVacationIds) {
            vacationIds.add(Integer.parseInt(id));
        }
        VacationService vacationService = new VacationService();
        for (int vacationId:vacationIds) {
            vacationService.updateVacationStatus(vacationId,vacationStatus);
        }
        response.sendRedirect("VacationList.jsp");
    }
}
