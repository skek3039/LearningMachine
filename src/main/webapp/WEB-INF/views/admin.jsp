<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   Date nowTime = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일 a hh:mm:ss");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<title>Learning Machine</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
   rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
   rel="stylesheet">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
   rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="./resources/lib/animate/animate.min.css" rel="stylesheet">
<link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css"
   rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="./resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="./resources/css/style.css" rel="stylesheet">
<link href="./resources/css/admin.css" rel="stylesheet">

<style type="text/css">
    <style>@font-face {
        font-family: 'LeferiPoint-WhiteObliqueA';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
        font-weight: normal;
        font-style: normal;
    }

    body {
        font-family: LeferiPoint-WhiteObliqueA;
    }

    details {
        border-bottom: 1px solid #efefef;
        color: #666;
        font-size: 16px;
        padding: 15px;
    }


    details[open] summary {
        font-weight: 800;
    }

    details > summary {
        color: white;
        font-size: 17px;
        padding: 15px 0;
    }
</style>

</head>

<body>
   <div class="container-xxl bg-white p-0">
      <!-- Spinner Start -->
      <div id="spinner"
         class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
         <div class="spinner-border text-primary"
            style="width: 3rem; height: 3rem;" role="status">
            <span class="sr-only">Loading...</span>
         </div>
      </div>
      <!-- Spinner End -->


      <jsp:include page="./header.jsp" />
      <div style="width: 100%;">
            <div style="position: relative;">
            <jsp:include page="./admin_nav.jsp" />
            </div>
         <div style="padding-top: 110px;">
            <h3>&nbsp;&nbsp;관리자님 안녕하세요.</h3>
            <hr style="border: solid 1px;">
         </div>
         <div style=" width: 800px; height: 100%; margin: 0 auto; ">
            <div class="row no-gutters align-items-center">
               <div class="col-auto">
                  <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
                  현재시간 <%= sf.format(nowTime) %> 입니다.
                  </div>
               </div>
            </div>
            <br>
         </div>
      
         <div class="row g-4">
             <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                월 매출액</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">&#8361; <fmt:formatNumber value="${payment[0].sumtotal }" pattern="#,###"  /></div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
              <!-- Earnings (Annual) Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-success shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">금일 매출액</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">&#8361; </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                          <!-- Pending Requests Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-warning shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                읽지않은 메시지</div>
                                            <div class="h5 mb-0 font-weight-bold text-gray-800">총 ? 건</div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-comments fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Tasks Card Example -->
                        <div class="col-xl-3 col-md-6 mb-4">
                            <div class="card border-left-info shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col mr-2">
                                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">환불률                                            </div>
                                            <div class="row no-gutters align-items-center">
                                                <div class="col-auto">
                                                    <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                                </div>
                                                <div class="col">
                                                    <div class="progress progress-sm mr-2">
                                                        <div class="progress-bar bg-info" role="progressbar"
                                                            style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                            aria-valuemax="100"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                 <div class="row">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded h-100">
                            <div class="d-flex justify-content-between">
                                <a class="service-btn" href="./admin_student_report">
                                    <i class="fa fa-link fa-2x"></i>
                                </a>
                                    <div class="card-header bg-primary"> <h5 class="mb-3"></h5></div>
                            </div>
                            <div class="card-body">
                        <div style="text-align: center">처리해야할 학생신고</div><br>
                                 <div style="text-align: center"><h3>총 ${fn:length(report) } 건</h3></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded h-100">
                            <div class="d-flex justify-content-between">
                                <a class="service-btn" href="./admin_student_refund">
                                    <i class="fa fa-link fa-2x"></i>
                                </a>
                                   <div class="card-header bg-primary"> <h5 class="mb-3"></h5></div>
                            </div>
                             <div class="card-body">
                        <div style="text-align: center">처리해야할 환불신청내역</div><br>
                                 <div style="text-align: center"><h3>총 ${fn:length(refund) } 건</h3></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded h-100">
                            <div class="d-flex justify-content-between">
                                <a class="service-btn" href="./admin_student_refund">
                                    <i class="fa fa-link fa-2x"></i>
                                </a>
                                   <div class="card-header bg-primary"> <h5 class="mb-3"></h5></div>
                            </div>
                             <div class="card-body">
                        <div style="text-align: center">처리해야할 강의신청내역</div><br>
                                 <div style="text-align: center"><h3>총 ${fn:length(lecture) } 건</h3></div>
                            </div>
                        </div>
                    </div>             
               </div>
      
      <jsp:include page="./footer.jsp" />
 </div>       
                        
      <!-- Back to Top -->
      <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i
         class="bi bi-arrow-up"></i></a>
      <script type="text/javascript">
         $('body > ul > li').click(function() {
            if ($(this).hasClass('active')) {
               $(this).find(' > ul').stop().slideUp(300);
               $(this).removeClass('active');
            } else {
               $(this).find(' > ul').stop().slideDown(300);
               $(this).addClass('active');
            }
         });
      </script>
       </div> 
   <!-- JavaScript Libraries -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
   <script src="./resources/lib/wow/wow.min.js"></script>
   <script src="./resources/lib/easing/easing.min.js"></script>
   <script src="./resources/lib/waypoints/waypoints.min.js"></script>
   <script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>

   <!-- Template Javascript -->
   <script src="./resources/js/main.js"></script>
</body>

</html>