<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>پنل مدیریت | لیست مرخصی</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.3/css/fontawesome.min.css"
          integrity="sha384-wESLQ85D6gbsF459vf1CiZ2+rr+CsxRY0RpiF1tLlQpDnAgg6rwdsUF1+Ics2bni" crossorigin="anonymous">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="assets/css/adminlte.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">

    <!-- bootstrap rtl -->
    <link rel="stylesheet" href="assets/css/bootstrap-rtl.min.css">
    <!-- template rtl version -->
    <link rel="stylesheet" href="assets/css/custom-style.css">

</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
        <!-- Left navbar links -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="../../index3.html" class="nav-link">خانه</a>
            </li>
            <li class="nav-item d-none d-sm-inline-block">
                <a href="#" class="nav-link">تماس</a>
            </li>
        </ul>

        <!-- SEARCH FORM -->
        <form class="form-inline ml-3">
            <div class="input-group input-group-sm">
                <input class="form-control form-control-navbar" type="search" placeholder="جستجو" aria-label="Search">
                <div class="input-group-append">
                    <button class="btn btn-navbar" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </div>
            </div>
        </form>

        <!-- Right navbar links -->
        <ul class="navbar-nav mr-auto">
            <!-- Messages Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="fa fa-comments-o"></i>
                    <span class="badge badge-danger navbar-badge">3</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-left">
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="dist/img/user1-128x128.jpg" alt="User Avatar" class="img-size-50 ml-3 img-circle">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    حسام موسوی
                                    <span class="float-left text-sm text-danger"><i class="fa fa-star"></i></span>
                                </h3>
                                <p class="text-sm">با من تماس بگیر لطفا...</p>
                                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 4 ساعت قبل</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="dist/img/user8-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle ml-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    پیمان احمدی
                                    <span class="float-left text-sm text-muted"><i class="fa fa-star"></i></span>
                                </h3>
                                <p class="text-sm">من پیامتو دریافت کردم</p>
                                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i> 4 ساعت قبل</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <!-- Message Start -->
                        <div class="media">
                            <img src="dist/img/user3-128x128.jpg" alt="User Avatar" class="img-size-50 img-circle ml-3">
                            <div class="media-body">
                                <h3 class="dropdown-item-title">
                                    سارا وکیلی
                                    <span class="float-left text-sm text-warning"><i class="fa fa-star"></i></span>
                                </h3>
                                <p class="text-sm">پروژه اتون عالی بود مرسی واقعا</p>
                                <p class="text-sm text-muted"><i class="fa fa-clock-o mr-1"></i>4 ساعت قبل</p>
                            </div>
                        </div>
                        <!-- Message End -->
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">مشاهده همه پیام‌ها</a>
                </div>
            </li>
            <!-- Notifications Dropdown Menu -->
            <li class="nav-item dropdown">
                <a class="nav-link" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell-o"></i>
                    <span class="badge badge-warning navbar-badge">15</span>
                </a>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-left">
                    <span class="dropdown-item dropdown-header">15 نوتیفیکیشن</span>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fa fa-envelope ml-2"></i> 4 پیام جدید
                        <span class="float-left text-muted text-sm">3 دقیقه</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fa fa-users ml-2"></i> 8 درخواست دوستی
                        <span class="float-left text-muted text-sm">12 ساعت</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item">
                        <i class="fa fa-file ml-2"></i> 3 گزارش جدید
                        <span class="float-left text-muted text-sm">2 روز</span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a href="#" class="dropdown-item dropdown-footer">مشاهده همه نوتیفیکیشن</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" data-widget="control-sidebar" data-slide="true" href="#"><i
                        class="fa fa-th-large"></i></a>
            </li>
        </ul>
    </nav>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">


        <!-- Sidebar -->
        <div class="sidebar">
            <div>
                <!-- Sidebar user panel (optional) -->
                <div class="user-panel mt-3 pb-3 mb-3 d-flex">

                </div>
                <nav class="mt-2">
                    <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu"
                        data-accordion="false">

                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-edit"></i>
                                <p>
                                    فرم‌ها
                                    <i class="fa fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/register" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>ثبت نام کاربر جدید</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="Vacation.jsp" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>ثبت مرخصی</p>
                                    </a>
                                </li>

                            </ul>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-table"></i>
                                <p>
                                    جداول
                                    <i class="fa fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="tables/simple.html" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>لیست درخواست های مرخصی</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="<%=request.getContextPath()%>/employeelist" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>لیست کاربران </p>
                                    </a>
                                </li>
                            </ul>
                        </li>


                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-envelope-o"></i>
                                <p>
                                    ایمیل‌ باکس
                                    <i class="fa fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="mailbox/mailbox.html" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>اینباکس</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="mailbox/compose.html" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>ایجاد</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="mailbox/read-mail.html" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>خواندن</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="nav-item has-treeview">
                            <a href="#" class="nav-link">
                                <i class="nav-icon fa fa-book"></i>
                                <p>
                                    صفحات
                                    <i class="fa fa-angle-left right"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                <li class="nav-item">
                                    <a href="login.jsp" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>ویرایش مشخصات</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="examples/login.html" class="nav-link">
                                        <i class="fa fa-circle-o nav-icon"></i>
                                        <p>صفحه ورود</p>
                                    </a>
                                </li>


                            </ul>
                        </li>

                    </ul>
                </nav>
            </div>
        </div>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <form action="<%=request.getContextPath()%>/vacationList" method="post">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>لیست مرخصی</h1>
                    </div>
                    <div class="col-sm-6">

                    </div>
                </div>
            </div><!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">

                <!-- /.row -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">جدول درخواست های مرخصی</h3>

                                <div class="card-tools">
                                    <div class="input-group input-group-sm" style="width: 150px;">
                                        <input type="text" name="table_search" class="form-control float-right"
                                               placeholder="جستجو">

                                        <div class="input-group-append">
                                            <button type="submit" class="btn btn-default"><i class="fa fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive p-0">
                                <table class="table table-hover">
                                    <tr>
                                        <th> شماره در خواست مرخصی</th>
                                        <th>نام و نام خانوادگی</th>
                                        <th>زمان شروع درخواست</th>
                                        <th>زمان پایان درخواست</th>
                                        <th>وضعیت درخواست</th>
                                        <th>تعیین وضعیت</th>
                                    </tr>

                                    <c:forEach items="${VacationList}" var="vacationitem">

                                        <tr>
                                            <th><input name="vacationId" type="checkbox" value="${vacationitem.vacationID}">${vacationitem.vacationID}</th>
                                            <td>${vacationitem.employee.firstName} ${vacationitem.employee.lastName}</td>
                                            <td>${vacationitem.vacationStartDateAndTime}</td>
                                            <td>${vacationitem.vacationEndDateAndTime}</td>
                                            <td>${vacationitem.categoryElement.categoryElementPersianName}</td>
                                        

                                        </tr>

                                    </c:forEach>

                                    <tr>
                                        <%for (int i = 1; i <= (int) request.getAttribute("pageNumbers"); i++) {%>
                                        <td><a href='<%=request.getContextPath()%>/vacationList?page=<%=i%>'>page<%=i%>
                                        </a></td>
                                        <%}%>
                                    </tr>

                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                        <!-- /.card -->
                    </div>
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <div class="content-wrapper">
        <section class="content">
            <div class="container-fluid">

                <!-- /.row -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">


                            <label for="VacationStatus" dir="ltr">حالت وضعیت </label>

                            <select name="VacationStatus" id="VacationStatus" class="custom-select d-block w-100" required required
                                    oninvalid="setCustomValidity('لطفا گروه کاری را انتخاب کنید')"
                                    oninput="setCustomValidity('')">
                                <c:forEach items="${categoryElementList}" var="categoryElement">
                                    <tr>
                                        <option value=${categoryElement.categoryElement_id}>${categoryElement.categoryElementPersianName}</option>
                                    </tr>
                                </c:forEach>
                            </select>

                            <div style="clear:both; margin: 10px" ></div>

                            <!-- /.content-wrapper -->


                            <button class="btn btn-primary btn-lg btn-block" type="submit">ثبت</button>
                        </div>
                    </div>
                </div>

            </div>
        </section>
    </div>
</div>
</form>
    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>

<!-- ./wrapper -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
<script src="assets/js/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="assets/js/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Slimscroll -->
<script src="assets/js/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="assets/js/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="assets/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="assets/js/demo.js"></script>
<script>
    $(document).ready(function () {
        $('#btnsabt').click(function () {

            var select = document.getElementById("select");
            var vacationCategoryElenment = select.value;
            var vacationId = document.getElementById("vacationId");
            // var vacationInfo = {
            //     vacationId:vacationId,
            //     vacationCategoryElenmentId:vacationCategoryElenment
            // };
            //var requestJSON=JSON.stringify(vacationInfo);
            $.ajax({
                cache: false,
                type: "GET",
                async: false,
                url: "http://localhost:8080/Company_Managment_war/rest/employee/updatevacationstatus",
                data: 'vId' + vacationId + '&cId' + vacationCategoryElenment,
                headers: {"Content-Type": "application/json"},
                contentType: "application/json",
                dataType: "json",
                processData: true,
                success: function (data) {
                    alert(data);
                },
                error: function (data) {

                }
            });
        });

    });
</script>
</body>
</html>


