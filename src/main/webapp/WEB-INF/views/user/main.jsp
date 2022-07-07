<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="./lib/animate/animate.min.css" rel="stylesheet">
    <link href="./lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="./css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="./resources/css/style.css" rel="stylesheet">
</head>

<body>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


	<jsp:include page="../header.jsp"/>
	<jsp:include page="../header2.jsp"/>

        ${popLecture}

        <!-- Testimonial Start -->
        <div class="container-xxl py-6">
            <div class="container">
                <div class="mx-auto text-center wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                    <div class="d-inline-block border rounded-pill text-primary px-4 mb-3">개발자 소개</div>
                    <h2 class="mb-5">이 사이트를 개발한 사람들</h2>
                </div>
                <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">
                    <div class="testimonial-item rounded p-5">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>ㅇㅅㅇ소감~ </p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-1.jpg">
                            <div class="ps-3">
                                <h6 class="mb-1">문성균</h6>
                                <small>개발자</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item rounded p-5">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>ㅇㅅㅇ소감~ </p>
                        <div class="d-flex align-items-center">
                           <a href="https://github.com/Hijineee"><img class="img-fluid flex-shrink-0 rounded-circle" src="./resources/img/testimonial-2.jpg"></a>
                            <div class="ps-3">
                                <h6 class="mb-1">이희진</h6>
                                <small>개발자</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item rounded p-5">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>ㅇㅅㅇ소감~ </p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-3.jpg">
                            <div class="ps-3">
                                <h6 class="mb-1">명재성</h6>
                                <small>개발자</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item rounded p-5">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>ㅇㅅㅇ소감~ </p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-4.jpg">
                            <div class="ps-3">
                                <h6 class="mb-1">문형석</h6>
                                <small>개발자</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item rounded p-5">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>ㅇㅅㅇ소감~ </p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="img/testimonial-4.jpg">
                            <div class="ps-3">
                                <h6 class="mb-1">안익현</h6>
                                <small>개발자</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->


	
        

		<%-- <jsp:include page="./team.jsp"/> --%>
		<jsp:include page="../footer.jsp"/>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./lib/wow/wow.min.js"></script>
    <script src="./lib/easing/easing.min.js"></script>
    <script src="./lib/waypoints/waypoints.min.js"></script>
    <script src="./lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="./js/main.js"></script>
</body>

</html>