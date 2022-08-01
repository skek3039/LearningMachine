<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    
    <script type="text/javascript">
    	$(function(){
    		$("#find_id_btn").click(function(){
    			location.href='../member/find_id';
    		})
    	})
    
    </script>
    
    <title>Learning Machine</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="./resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="./resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="./resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="./resources/css/style.css" rel="stylesheet">
<style type="text/css">
#main {
   margin: 0 auto;
   height: 100%;
   width: 900px;
}
</style>

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
	<div style="padding-bottom: 100px;">
	<jsp:include page="./header.jsp"/>
	</div>
	<section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5" >
        <div class="card bg-dark text-white" style="border-radius: 1rem; background-color: #00B98E;">
          <div class="card-body p-5 text-center">
            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase" style="color: white;">Login</h2>
              <p class="text-white-50 mb-5">Please enter your login and password!</p>
			<form action="./login" method="post">
              <div class="form-outline form-white mb-4">
                <input type="text" id="id" name="id" class="form-control form-control-md" required="required" placeholder="ID를 입력해주세요."/>
              </div>

              <div class="form-outline form-white mb-4">
                <input type="password" id="pw" name="pw" class="form-control form-control-md" required="required" placeholder="PW를 입력해주세요."/>
              </div>

              <p class=""><a class="text-white-50" href="./forgotPW">Forgot password?</a></p>
              <p class=""><a class="text-white-50" href="./find_id">find_id?</a></p>

              <button class="btn btn-outline-light btn-lg px-5" type="submit">Login</button>
			</form>	
              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fa-duotone fa-n"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>


            <div>
              <p class="mb-0">Don't have an account? <a href="./join" class="text-white-50 fw-bold">User_Sign Up</a>
              <p class="mb-0">Don't have an account? <a href="./join2" class="text-white-50 fw-bold">Teacher_Sign Up</a>
              </p>
            </div>
			</div>
        </div>
      </div>
    </div>
  </div>
  </div>
</section>
  		<div style="padding-top: 70px;">
		<jsp:include page="./footer.jsp"/>
		</div>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
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