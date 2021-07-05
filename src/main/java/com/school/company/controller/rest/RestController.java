package com.school.company.controller.rest;

import java.text.ParseException;


import com.school.company.model.Service.CategoryElementService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.school.company.model.Entity.*;
import com.school.company.model.Service.EmployeeService;
import com.school.company.model.Service.VacationService;


import java.util.List;


@Path("/employee") // /rest/employee
public class RestController {

    @GET()
    @Path("/categoryElement")// /rest/employee/categoryElement/1
    @Produces(MediaType.APPLICATION_JSON)
    public List<categoryElement> getCategoryElements() {
        CategoryElementService categoryElementService = new CategoryElementService();
        List<categoryElement> categoryElements = categoryElementService.getCategoryElements(1);
        return categoryElements;
    }

    @GET()
    @Path("/listEmployee")  //  /rest/employee/listEmployee
    @Produces(MediaType.APPLICATION_JSON)
    public List<Employee> getEmployees() {
        EmployeeService employeeService = new EmployeeService();
        List<Employee> employees = employeeService.getEmployees();
        return employees;
    }


    @POST
    @Path("/deleteEmployee/{id}")//  /rest/employee/deleteEmployee/1
    public Response deleteEmployee(@PathParam("id") String id) {
        EmployeeService employeeService = new EmployeeService();
        employeeService.deleteEmployeeById(Integer.parseInt(id));
        return Response.status(200).entity("delete employee " + id).build();
    }


    @GET
    @Path("/getEmployee/{id}") //  /rest/employee/getEmployee/1
    @Produces(MediaType.APPLICATION_JSON)
    public Employee getEmployeeInfo(@PathParam("id") String id) {
        EmployeeService employeeService = new EmployeeService();
        Employee employee = employeeService.findEmployeeById(Integer.parseInt(id));
        return employee;
    }


    @POST
    @Path("/add") //  /rest/employee/add
    public Response addEmployee(@FormParam("firstName") String firstName,
                                @FormParam("lastName") String lastName,
                                @FormParam("emailAddress") String emailAddress,
                                @FormParam("password") String password,
                                @FormParam("category") String category,
                                @FormParam("Manager") String manager) {

        CategoryElementService categoryElementService = new CategoryElementService();
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
        employeeService.insertEmployee(employee);
        return Response.status(200).entity("add employee").build();

    }

    @POST
    @Path("/addVacation")
    public Response addVacation(@FormParam("employeeId") String employeeId,
                                @FormParam("VacationStartDate") String vacationStartDate,
                                @FormParam("VacationEndDate") String vacationEndDate) throws ParseException {
        Vacation vacation = new Vacation();
        VacationService vacationService = new VacationService();


        if (vacationService.checkVacationRequestDate(employeeId,vacationStartDate,vacationEndDate)) {
            vacation.setVacationStartDateAndTime(vacationStartDate.replace('/', '-'));
            vacation.setVacationEndDateAndTime(vacationEndDate.replace('/', '-'));
            vacationService.insertVacation(Integer.parseInt(employeeId), vacation);
            return Response.status(200).entity("add vacation").build();
        } else {
            return Response.status(415).entity("bazeh zamani hamposhani dasht").build();
        }


    }

    @POST()
    @Path("/updateVacation")
    public Response updateVacation(@FormParam("employeeId") String employeeId,
                                   @FormParam("vacationId") String vacationId,
                                   @FormParam("VacationStartDate") String vacationStartDate,
                                   @FormParam("VacationEndDate") String vacationEndDate) throws ParseException{
        VacationService vacationService = new VacationService();
        if (vacationService.checkVacationRequestDate(employeeId,vacationStartDate,vacationEndDate)) {
        vacationService.updateVacationDateAndTime(Integer.parseInt(vacationId),vacationStartDate,vacationEndDate);
        return Response.status(200).entity("update successfully").build();
        } else {
            return Response.status(415).entity("bazeh zamani hamposhani dasht").build();
        }
    }

    @GET()
    @Path("/deleteVacation/{vacationId}")
    public Response deleteVacation(@PathParam("vacationId") int vacationId){

        VacationService vacationService = new VacationService();
        vacationService.daleteVacation(vacationId);
        return Response.status(200).entity("delete vacation ").build();
    }



}
