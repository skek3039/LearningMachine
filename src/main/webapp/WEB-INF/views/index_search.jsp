<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>

<html lang="en">
 
<head>
    <meta charset="utf-8">
    <title>Learning Machine</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./lib/wow/wow.min.js"></script>
    <script src="./lib/easing/easing.min.js"></script>
    <script src="./lib/waypoints/waypoints.min.js"></script>
    <script src="./lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="./js/main.js"></script>
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
    <style type="text/css">
    #user_main{
    	margin-top: 70px;
    }
    .col-lg-5{
    	margin : auto;
    	margin-bottom: 20px;
    }
    
    </style>
    
<script type="text/javascript">
function search(){
	var l_name = $("#l_name").val();
	location.href = "./index_search?l_name="+l_name;
}

function enterkey() {
	if (window.event.keyCode == 13) {
		search();
	}
	
}
</script>

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


	<jsp:include page="./header.jsp"/>
	<%-- <jsp:include page="./header2.jsp"/> --%>
	
        <!-- Service Start -->
        <div class="container-xxl py-6">
            <div class="container">
                <div class="mx-auto text-center wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
                <br>
                    <div class="d-inline-block border rounded-pill text-primary px-4 mb-3">검색결과</div>
                    <h2 class="mb-5">${l_name } (으)로 검색한 강의목록 </h2>
                </div>
                <div class="row g-4">
                     <c:forEach items="${indexsearch}" var="pop" step="1" end="5">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded h-100" style="border-color:  #F0FFF0; background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)),  url(${pop.l_thumbnail}); ">
                            <div class="d-flex justify-content-between" style="height: 10px; ">
                           <div style="color: #F0FFF0;"></div>
                                <a class="service-btn" href="./LectureDetail?l_code=${pop.l_code }"">
                                    <i class="fa fa-link fa-2x"></i>
                                </a>
                            </div>
                            <div class="p-5" style="padding-top: 10px;">
                                <h5 class="mb-2" style="border-radius:10px;color: white"> ${pop.l_name } </h5>
                                <span style="background-color:white; ; border-radius:10px;color: black"><strong>${pop.t_nickname } </strong></span><br>
                                <c:choose>
								<c:when test="${fn:length(pop.l_curriculum ) > 30 }">
								 <div style="background-color:#F0FFF0; border-radius:10px; color: black">
                               <c:out value="${fn:substring(pop.l_curriculum , 0, 30)} ..."/>
                          		</div>
                          		</c:when>
                          		<c:otherwise>
                          		 <div style="background-color:#F0FFF0; border-radius:10px; color: black">
								<c:out value="${pop.l_curriculum  }"/>
								</div>
							</c:otherwise>
								
							</c:choose>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- Service End -->

		
		<jsp:include page="./team.jsp"/>
		<jsp:include page="./footer.jsp"/>


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>
</body>

</html>