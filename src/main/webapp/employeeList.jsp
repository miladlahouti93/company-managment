<%--
  Created by IntelliJ IDEA.
  User: Milad
  Date: 6/20/2021
  Time: 12:29 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.rtlcss.com/bootstrap/v4.5.3/css/bootstrap.min.css"
          integrity="sha384-JvExCACAZcHNJEc7156QaHXTnQL3hQBixvj5RV5buE7vgnNEzzskDtx9NQ4p6BJe" crossorigin="anonymous">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="src/main/webapp/assets/css/bootstrap.min.css"
          integrity="sha384-LPvXVVAlyPoBSGkX8UddpctDks+1P4HG8MhT7/YwqHtJ40bstjzCqjj+VVVDhsCo" crossorigin="anonymous">
    <link rel="stylesheet" href="src/main/webapp/assets/css/style.css">
    <link rel="stylesheet" href="src/main/webapp/assets/css/vazir.css">
</head>
<body>
<table class="table">
    <thead>
    <tr>
        <th scope="col">نام مدیر</th>
        <th scope="col">نام گروه کاری</th>
        <th scope="col">رمز عبور</th>
        <th scope="col">ادرس ایمیل</th>
        <th scope="col">نام خانوادگی</th>
        <th scope="col">نام</th>
        <th scope="col">شماره پرسنلی</th>
    </tr>
    </thead>
    <tbody>

<c:forEach items="${tableEmployees}" var="Employee">
    <tr>

    <td name="Manager">${Employee.employee.firstName} ${Employee.employee.lastName}</td>
    <td name="CategoryElement">${Employee.categoryElement.categoryElementPersianName}</td>
    <td name="Password">${Employee.password}</td>
        <td name="EmailAddress">${Employee.emailAddress}</td>
    <td name="LastName">${Employee.lastName}</td>
    <td name="FirstName">${Employee.firstName}</td>
    <td name="EmployeeId">${Employee.employeeID}</td>
    </tr>
</c:forEach>

    </tbody>
</table>
</body>
</html>
