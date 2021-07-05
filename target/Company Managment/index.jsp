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
    <title>فرم ثبت نام</title>
</head>

<head dir="rtl">
    <meta charset="UTF-8">
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
            <h4 class="mb-3" dir="rtl">فرم ثبت نام</h4>

            <form name="registerForm" action="rest/employee/add" method="post"  onsubmit = "return validate()">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="firstName" dir="rtl">نام</label>
                        <input type="text" class="form-control" id="firstName" name="firstName"   required oninvalid="setCustomValidity('لطفا نام  را وارد کنید')" oninput="setCustomValidity('')">
                        <div id="invalidName" ></div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="lastName" dir="ltr">نام خانوادگی</label>
                        <input type="text" class="form-control" id="lastName" name="lastName"  required oninvalid="setCustomValidity('لطفا نام خانوادگی را وارد کنید')" oninput="setCustomValidity('')">
                        <div id="invalidLastName" ></div>
                    </div>
                </div>


                <div class="mb-3">
                    <label for="email" dir="ltr">ادرس ایمیل </label>
                    <input type="email" class="form-control" id="email" name="emailAddress"
                           placeholder="you@example.com"  required oninvalid="setCustomValidity('لطفا ایمیل را صحیح وارد کنید')" oninput="setCustomValidity('')">
                    <div id="invalidEmail"></div>
                </div>

                <div class="mb-3">
                    <label for="password" dir="ltr">رمز عبور</label>
                    <input type="password" class="form-control" id="password" name="password" minlength="8"  required oninvalid="setCustomValidity('رمز عبور باید 8 کاراکتر باشد')"  oninput="setCustomValidity('')">
                    <div id="invalidPassword"></div>
                </div>


                <div class="row">
                    <div class="col-md-5 mb-3">
                        <label for="category" dir="ltr">گروه شغلی</label>

                        <select name="category" id="category"class="custom-select d-block w-100" >

                            <c:forEach items="${listCategory}" var="categoryElement">
                            <tr>
                                <option value=${categoryElement.categoryElement_id}>${categoryElement.categoryElementPersianName}</option>
              </tr>
            </c:forEach>
                        </select>

                    </div>
                    <div class="col-md-4 mb-3">
                                <label for="Manager" dir="ltr">نام مدیر</label>

                                <select name="Manager" id="Manager" class="custom-select d-block w-100" >

                                    <c:forEach items="${listEmployee}" var="listemployee">
                            <tr>
                                <option value=${listemployee.employeeID}>${listemployee.firstName} ${listemployee.lastName} </option>
              </tr>

            </c:forEach>
                        </select>
                    </div>

                </div>


                <hr class="mb-4">
                                <button class="btn btn-primary btn-lg btn-block" type="submit" >ثبت</button>
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
