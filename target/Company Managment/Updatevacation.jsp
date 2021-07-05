<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>Persian DateTime</title>

    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap-theme.min.css" />
    <link rel="stylesheet" href="assets/css/jquery.Bootstrap-PersianDateTimePicker.css" />

    <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.1.js" type="text/javascript"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/bootstrap/3.3.1/bootstrap.min.js" type="text/javascript"></script>

    <style type="text/css">
        body, table {
            font-family: 'Segoe UI', Tahoma;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div style="margin-top: 50px; clear: both;"></div>

<div class="container" style="max-width: 500px;">

    <form action="rest/employee/updateVacation" method="post" >
        <input type="hidden" name="vacationId" value="${myVacation.vacationID}">
        <input type="hidden" name="employeeId" value="<%out.print(session.getAttribute("employeeId"));%>">

        <div class="form-group">
            <label class="sr-only" for="exampleInput1">تاریخ و زمان</label>
            <div class="input-group">
                <div class="input-group-addon" data-MdDateTimePicker="true" data-targetselector="#exampleInput1" data-trigger="click" data-enabletimepicker="true">
                    <span class="glyphicon glyphicon-calendar"></span>
                </div>
                <input type="text" class="form-control" id="exampleInput1"  name="VacationStartDate" value="${myVacation.vacationStartDateAndTime}" placeholder="تاریخ شروع مرخضی" />
            </div>
        </div>


        <div style="margin: 20px; clear: both;"></div>

        <div class="form-group">


            <div class="input-group">
                <div class="input-group-addon" data-MdDateTimePicker="true" data-trigger="click" data-targetselector="#toDate1" data-groupid="group1" data-todate="true" data-enabletimepicker="true" data-placement="left">
                    <span class="glyphicon glyphicon-calendar"></span>
                </div>
                <input type="text" class="form-control" id="toDate1" name="VacationEndDate" value="${myVacation.vacationStartDateAndTime}" placeholder="تاریخ پایان مرخصی" data-MdDateTimePicker="true" data-trigger="click" data-targetselector="#toDate1" data-groupid="group1" data-todate="true" data-enabletimepicker="true" data-placement="right" />
            </div>
        </div>

        <div style="margin: 20px; clear: both;"></div>
        <button class="btn btn-primary btn-lg btn-block" type="submit" > ویرایش مرخصی </button>
    </form>

</div>

<script src="assets/js/calendar.js" type="text/javascript"></script>
<script src="assets/js/jquery.Bootstrap-PersianDateTimePicker.js" type="text/javascript"></script>
<script src="assets/js/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-2.1.4.js" integrity="sha256-siFczlgw4jULnUICcdm9gjQPZkw/YPDqhQ9+nAOScE4=" crossorigin="anonymous"></script>
</body>
</html>