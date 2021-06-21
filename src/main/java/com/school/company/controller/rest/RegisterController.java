package com.school.company.controller.rest;

import com.school.company.model.Service.CategoryElementService;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import com.school.company.model.Entity.*;
import com.school.company.model.Service.EmployeeService;


import java.util.List;

@Path("/employee")
public class RegisterController {

    @GET()
    @Path("/categoryElement")
    @Produces(MediaType.APPLICATION_JSON)
    public List<categoryElement> getCategoryElements(){
        CategoryElementService categoryElementService = new CategoryElementService();
        List<categoryElement> categoryElements = categoryElementService.getCategoryElements(1);
        return categoryElements;
    }

    @GET()
    @Path("/listEmployee")
    @Produces(MediaType.APPLICATION_JSON)
    public List<Employee> getEmployees(){
        EmployeeService employeeService = new EmployeeService();
        List<Employee> employees = employeeService.getEmployees();
        return employees;
    }


    @POST
    @Path("/deleteEmployee/{id}")
    public Response deleteEmployee(@PathParam("id") String id)
    {
        EmployeeService employeeService = new EmployeeService();
        employeeService.deleteEmployeeById(Integer.parseInt(id));
        return Response.status(200).entity("delete employee "+id).build();
    }


    @GET
    @Path("/getEmployee/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Employee getEmployeeInfo(@PathParam("id") String id){
        EmployeeService employeeService = new EmployeeService();
        Employee employee= employeeService.findEmployeeById(Integer.parseInt(id));
        return employee;
    }


    @POST
    @Path("/add")
    public Response addEmployee(@FormParam("firstName") String firstName,
                                @FormParam("lastName") String lastName,
                                @FormParam("emailAddress") String emailAddress,
                                @FormParam("password") String password,
                                @FormParam("category") String category,
                                @FormParam("Manager") String manager){

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
    employeeService.insertEmployee(employee);
    return Response.status(200).entity("add employee").build();
    }


}
