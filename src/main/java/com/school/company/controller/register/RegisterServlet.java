package com.school.company.controller.register;

import com.school.company.model.Repository.RegisterRepository;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class RegisterServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    public void service(ServletRequest request, ServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String lastName = request.getParameter("lastname");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repassword = request.getParameter("re-password");
        String group = request.getParameter("group");

//        if(name.length()>3)
//        {
//             if(password.length()<5)
//             {
//                 RegisterRepository registerRepository = new RegisterRepository(name,password);
//                 if (registerRepository.registerEmployee())
//                     System.out.println("khobeh");
//                 else
//                     System.out.println("badeh");
//             }
//        }

    }
    

    //    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//
//    }
}
