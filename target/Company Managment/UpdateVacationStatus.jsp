<%--
  Created by IntelliJ IDEA.
  User: Milad
  Date: 6/19/2021
  Time: 1:07 PM
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
    <title>فرم تایید و رد مرخصی </title>
</head>

<head dir="rtl">
    <meta  http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Bootstrap 4 - Example 3</title>

    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/bootstrap-rtl.css">
    <link rel="stylesheet" href="./../style/css/vazir.css">
    <link rel="stylesheet" href="css/style.css">

</head>


<body dir="rtl">


<div class="container" accept-charset="utf-8">

    <div class="row">
        <div class="col-md-4 order-md-2 mb-4">
        </div>
        <div class="col-md-8 order-md-1">
            <h4 class="mb-3" dir="ltr">فرم تعیین وضعیت مرخصی </h4>

            <form action="<%=request.getContextPath()%>/updateStatusVacation" method="post" class="needs-validation"
                  accept-charset="utf-8" novalidate>

                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="vacationId" dir="ltr">شماره درخواست</label>
                        <input type="text" class="form-control" id="vacationId" name="vacationId" disabled="disabled"  value="${vacation.employee.firstName}" >

                    </div>

                </div>
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName" dir="ltr">نام</label>
                        <input type="text" class="form-control" id="firstName" name="firstName" disabled="disabled"  value="${vacation.employee.firstName}" >

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" dir="ltr">نام خانوادگی</label>
                        <input type="text" class="form-control" id="lastName" name="lastName" disabled="disabled" value="${vacation.employee.lastName}" >

                    </div>
                </div>


                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="startDate" dir="ltr">زمان شروع درخواست</label>
                        <input type="text" class="form-control" id="startDate" name="startDate" disabled="disabled"  value="${vacation.vacationStartDateAndTime}" >

                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="endDate" dir="ltr">زمان پایان درخواست</label>
                        <input type="text" class="form-control" id="endDate" name="endDate" disabled="disabled" value="${vacation.vacationEndDateAndTime}" >

                    </div>
                </div>

                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="category" dir="ltr">تعیین وضعیت درخواست</label>

                        <select name="category" id="category"class="custom-select d-block w-100" required  required oninvalid="setCustomValidity('لطفا وضعیت مرخصی کاربر را مشخص کنید')"  oninput="setCustomValidity('')">
                            <option value=${vacation.categoryElement.categoryElement_id} selected>${vacation.categoryElement.categoryElementPersianName}</option>
                            <c:forEach items="${categoryElementList}" var="categoryElement">
                                <tr>
                                    <option value=${categoryElement.categoryElement_id}>${categoryElement.categoryElementPersianName}</option>
                                </tr>
                            </c:forEach>
                        </select>

                    </div>


                </div>


                <hr class="mb-4">
                <button class="btn btn-primary btn-lg btn-block" type="submit">ثبت</button>
            </form>
        </div>
    </div>

</div>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript">

    function validate(){
        var firstName=document.getElementById("firstName");
        var lastName=document.getElementById("lastName");
        var emailAddress=document.getElementById("firstName");
        var password= document.getElementById("email");
        firstName.oninvalid = function (event) {
            event.target.setCustomValidity('لطفا نام خود را وارد کنید');
        }
        lastName.oninvalid = function (event) {
            event.target.setCustomValidity('لطفا نام خانوادگی خود را وارد کنید');
        }
        emailAddress.oninvalid= function (event) {
            event.target.setCustomValidity('آدرس ایمیل اشتباه است');
        }
        password.oninvalid= function (event) {
            event.target.setCustomValidity('پسورد حداقل باید 8 کاراکتر باشد');
        }


    }

</script>

</body>
</html>


