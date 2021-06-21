<%--
  Created by IntelliJ IDEA.
  User: Milad
  Date: 6/21/2021
  Time: 11:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<form action="<%=request.getContextPath()%>/updateEmployee" method="get">
    <label>  جهت ویرایش اطلاعات کاربری شماره پرسنلی را وارد کنید </label>
    <input type="text" name="employeeId">
    <br>
    <input type="submit" value="ورود">
</form>
</body>
</html>
