<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat year = new SimpleDateFormat("yyyy");
	SimpleDateFormat month = new SimpleDateFormat("M");
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
<link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Inter:wght@700;800&display=swap"
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
<link href='./resources/css/main.css' rel='stylesheet' />
<link href="/resources/css/dataTables.bootstrap4.min.css" rel="stylesheet">


<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="./resources/lib/wow/wow.min.js"></script>
<script src="./resources/lib/easing/easing.min.js"></script>
<script src="./resources/lib/waypoints/waypoints.min.js"></script>
<script src="./resources/lib/owlcarousel/owl.carousel.min.js"></script>


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
<script type="text/javascript">
function search(){
	var u_name= document.getElementById("u_name").value;
	location.href = "./admin_studentSearch?u_name="+u_name;
}

 function preNext(year,month,checkPN){
	var checkPN = checkPN;
	var year = Number(year); 
	var month = Number(month);
	var confirm = Number(<%= month.format(nowTime)%>);
	
	if(checkPN == "1"){
			if(month >0){
				year = year;
				month =Number(month) - 1;
				if(month == 0){
					month = 12;
					year = Number(year)-1;
				}
			}
			else{
				year = Number(year)-1;
				month = 12;
			}
	}else{
			if(month < 12){
				year = year;
				month =	Number(month) + 1;
				if(month == 12){
					month = 1;
					year = Number(year)+1;
				}
			}else{
				year = Number(year)+1;
				month = 1;
			}
		}  
 	location.href="./payment_refund?month="+month+"&year="+year;
}
</script>


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
		<div style="width: 100%; ">
		<div style="position: relative;">
		<jsp:include page="./admin_nav.jsp"/>
		 </div>
		<div id="pay" style="padding-top: 110px;"> <h1 class="h3 mb-2 text-gray-800">환불내역</h1><hr style="border: solid 1px;"></div>
		<div style="padding-top: 10px;padding-left: 120px; height: 995px;  margin: 0 auto; ">
		      <!-- DataTable -->
                            <fmt:parseDate value="${list[0].p_date}" var="time1" pattern="yyyy-MM-dd HH:mm:ss.S" />                                                                    
                            <fmt:formatDate value="${time1 }" var="year" pattern="yyyy"/>
                            <fmt:formatDate value="${time1 }" var="month" pattern="MM"/>
                    <div class="card shadow mb-4"style=" width: 800px; height: 800px;margin: 0 auto; ">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">
                            <a href="javascript:preNext('${year }','${month }',1);">◀</a>
                            ${year } 년  ${month } 월   <a href="javascript:preNext('${year }','${month }',2);">▶</a></h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive" >    
                                <table class="table table-bordered" id="dataTable"  cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>이름(ID)</th>
                                            <th>강의코드</th>
                                            <th>매출일자</th>
                                            <th>금액</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th colspan="3" style="text-align: right">총 환불금액</th>                                       
                                            <th style="color: red"><fmt:formatNumber value="${list[0].refundtotal }" pattern="#,###"  /></th>
                                       
                                        </tr>
                                        <tr>
                                            <th colspan="3" style="text-align: right">총 환불건</th>
                                            <th>${list[0].count} 건</th>
                                          </tr>
                                    </tfoot>
                                    <tbody> 
                                    <c:if test="${list.size() ne 0 }">
                                    <c:forEach items="${list }" var="pay">
                                        <tr>
                                            <td>${pay.NAME }(${pay.u_id })</td>
                                            <td>${pay.l_code }</td>
                                            <td>
                                            <fmt:parseDate value="${pay.p_date}" var="time" pattern="yyyy-MM-dd HH:mm:ss.S" />
                                            <fmt:formatDate value="${time }" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
                    						${time }</td>
                                           
                                            <td><fmt:formatNumber value="${pay.p_price }" pattern="#,###"  /></td>
                                        </tr>
                                    </c:forEach>  
                                     </c:if>         
									 </tbody>
                                </table>
                               
                            </div>
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

  	<!-- Page level plugins -->
    <script src="./resources/js/jquery.dataTables.min.js"></script>
    <script src="./resources/js/dataTables.bootstrap4.min.js"></script>
    <script src="./resources/js/datatables-demo.js"></script>



	<!-- Template Javascript -->
	<script src="./resources/js/main.js"></script>
	<script src="./resources/js/admin_student.js"></script>
	<script src="./resources/js/sb-admin-2.min.js"></script>
	
	
	
	</body>

</html>