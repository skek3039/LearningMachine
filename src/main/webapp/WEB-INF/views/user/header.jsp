<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0" style="background-color: #00B98E;">
            <nav class="navbar navbar-expand-lg navbar-light px-4 px-lg-5 py-3 py-lg-0"  style="background-color: #00B98E;">
                <a href="/web" class="navbar-brand p-0">
                    <h1 class="m-0">Learning Machine</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="./notice" class="nav-item nav-link">공지사항</a>
                        <a href="./LectureList" class="nav-item nav-link">강의</a>
                        <a href="service.html" class="nav-item nav-link">커뮤니티</a>
                        <a href="./contact" class="nav-item nav-link">장바구니</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="feature.html" class="dropdown-item">Features</a>
                                <a href="quote.html" class="dropdown-item">Free Quote</a>
                                <a href="team.html" class="dropdown-item">Our Team</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                    </div>
                    <c:if test="${sessionScope.u_id eq null }">
                    	<a href="./login" class="btn btn-light rounded-pill text-primary py-2 px-4 ms-lg-5">Login</a>
               		</c:if>
                    <c:if test="${sessionScope.u_id ne null }">
                    	<a href="./logout" class="btn btn-light rounded-pill text-primary py-2 px-4 ms-lg-5">Logout</a>
               		</c:if>
                </div>
            </nav>

        </div>
        <!-- Navbar & Hero End -->
