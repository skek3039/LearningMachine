<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
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


	<jsp:include page="./header.jsp"/>
	
	<section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row d-flex justify-content-center align-items-center h-100">
      <div class="col-12 col-md-8 col-lg-6 col-xl-5" >
        <div class="card bg-dark text-white" style="border-radius: 1rem; background-color: #00B98E;">
          <div class="card-body p-5 text-center">

            <div class="mb-md-5 mt-md-4 pb-5">

              <h2 class="fw-bold mb-2 text-uppercase" style="color: white;">회원가입</h2>
              <p class="text-white-50 mb-5">Please enter your login and password!</p>
			<form action="./join" method="post">
              <div class="form-outline form-white mb-4" >
                <input type="text" id="u_id" name="u_id" class="form-control form-control-md" placeholder="ID를 입력해주세요." onchange="idCheck()"/>
                <p id="checkResult">
              </div>

              <div class="form-outline form-white mb-4">
              	<label class="form-label mt-4" for="inputInvalid"></label>
                <input type="password" id="u_pw" name="u_pw" class="form-control form-control-md" required="required" placeholder="PW를 입력해주세요."/>
              </div>
              
              <div class="form-outline form-white mb-4">
              <label class="form-label mt-4" for="inputInvalid"></label>
                <input type="password" id="u_pw1" name="u_pw1" class="form-control form-control-md" required="required" placeholder="PW를 재입력 해주세요."/>
              	<font id="pw_feedback" size="2"></font>
              </div>
              
              <div class="form-outline form-white mb-4">
                <input type="email" id="u_email" name="u_email" class="form-control form-control-md" required="required" placeholder="EMAIL를 입력 해주세요."/>
              </div>
              
              <div class="form-outline form-white mb-4">
                <input type="text" id="u_name" name="u_name" class="form-control form-control-md" required="required" placeholder="이름을 입력해주세요."/>
              </div>
              
              <div class="form-outline form-white mb-4">
                <input type="text" id="u_nickname" name="u_nickname" class="form-control form-control-md" required="required" placeholder="닉네임을 입력해주세요."/>
              </div>
              
              <div class="form-outline form-white mb-4" >
				<input type="radio" id="u_gender" name="u_gender" value="남성" checked="checked">남               
				<input type="radio" id="u_gender" name="u_gender" value="여성" checked="checked">여               
              </div>
              
              <div class="form-outline form-white mb-4">
                <input type="text" id="u_birth" name="u_birth" class="form-control form-control-md" required="required" placeholder="생일을 입력해주세요."/>
              </div>
              

              <p class="small mb-5 pb-lg-2"><a class="text-white-50" href="#!">Forgot password?</a></p>

              <button class="btn btn-outline-light btn-lg px-5" type="submit">Join</button>
			</form>	
              <div class="d-flex justify-content-center text-center mt-4 pt-1">
                <a href="#!" class="text-white"><i class="fa-duotone fa-n"></i></a>
                <a href="#!" class="text-white"><i class="fab fa-google fa-lg"></i></a>
              </div>

            </div>

            <div>
              <p class="mb-0">Don't have an account? <a href="#!" class="text-white-50 fw-bold">Sign Up</a>
              </p>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>
  
  <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="./resources/lib/wow/wow.min.js"></script>
    <script src="./resources/lib/easing/easing.min.js"></script>
    <script src="./resources/lib/waypoints/waypoints.min.js"></script>
    <script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>
  
  <script type="text/javascript">
  
 let checkID = 0;
function idCheck(){
	let u_id = $("#u_id").val();
	if(u_id.length < 3 ){
		$("#checkResult").text("ID는 3글자 이상이어야합니다.");
	} else {
		$.ajax({
			url : "./checkID",
			type : "post",
			dataType : "html",
			data : {"u_id" : u_id},
			success : function(data){
				if (data == 0) {
					$("#checkResult").css("color","yellow");
					$("#checkResult").text("가입할 수 있는 ID 입니다.");
					$("#checkResult").attr("disabled","false");
				} else {
					$("#checkResult").css("color","red");
					$("#checkResult").text("이미 사용중인 ID 입니다.");
					$("#checkResult").attr("disabled","true");
				}
			},
			error : function () {
				$("#checkResult").text("비정상입니다.");
				$("#joinBtn").attr("disabled", true);
			}
		});
	}
}
	$("#asdf").on("submit", function() {
		var u_id = $("#u_id").val();
		if (u_id == "") {
			alert("아이디를 입력해주세요.");
			$("#u_id").focus();
			return false;
		}
		
		
		/* $('#u_pw').keyup(function () {
			let pass1 = doucument.getElementById('u_pw').value;
			let pass2 = doucument.getElementById('u_pw1').value;
			
			if (pass1 != || pass2 != "") {
				if (pass1 == pass2) {
					$('#pw_feedback').html('비밀번호가 일치 합니다.');
					$('#pw_feedback').attr('color','#2fb380');
					$('#u_pw1').addclass("is-valid");
					$('#u_pw1').removeclass("is-invalid");
				} else {
					$('#pw_feedback').html('비밀번호가 일치하지 않습니다.');
					$('#pw_feedback').attr('color','#dc3545');
					$('#u_pw1').addclass("is-valid");
					$('#u_pw1').removeclass("is-invalid");
				} */
				
		
		
		/*  let u_pw = $("#u_pw").val();
		 let u_pw1 = $("#u_pw1").val();
		 
		 if (u_pw != "" || u_pw1 != "") {
			 if(u_pw == u_pw1){
				 $("#checkPw").html('일치');
				 $("#checkPw").attr('color','green');
			 } else {
				 $("#checkPw").html('일치');
				 $("#checkPw").attr('color','red');
			 }
			
		} */
		var u_pw = $("#u_pw").val();
		var reg_u_pw = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(u_pw == "" || u_pw1.length < 1){
			alert("암호는 1글자 이상으로 만들어주세요.");
			$("#u_pw").focus();
			return false;
		} 
		
		var u_pw1 = $("#u_pw1").val();
		var reg_u_pw1 = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if(u_pw == "" || u_pw1.length < 1){
			alert("암호는 1글자 이상으로 만들어주세요.");
			$("#u_pw1").focus();
			return false;	
		} 

		var u_name = $("#u_name").val();
		if (u_name == "") {
			alert("이름을 입력해주세요.");
			$("#u_name").focus();
			return false;
		}
		var u_email = $("#u_email").val();
		var reg_u_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
		if (u_email == "" || !reg_email.test(u_email)) {
			alert("u_email을 입력해주세요.");
			$("#u_email").focus();
			return false;
		}
	});

</script>

<script type="text/javascript">

 $('#u_pw').keyup(function () {
let pass1 = doucument.getElementById('u_pw').value;
let pass2 = doucument.getElementById('u_pw1').value;

if (pass1 != || pass2 != "") {
	if (pass1 == pass2) {
		$('#pw_feedback').html('비밀번호가 일치 합니다.');
		$('#pw_feedback').attr('color','#2fb380');
		$('#u_pw1').addclass("is-valid");
		$('#u_pw1').removeclass("is-invalid");
	} else {
		$('#pw_feedback').html('비밀번호가 일치하지 않습니다.');
		$('#pw_feedback').attr('color','#dc3545');
		$('#u_pw1').addclass("is-valid");
		$('#u_pw1').removeclass("is-invalid");
	} 

</script>
</section>

		<jsp:include page="./footer.jsp"/>

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    

    <!-- Template Javascript -->
    <script src="./resources/js/main.js"></script>
</body>


</html>