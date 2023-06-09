<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<script>
		$(document).ready(function() {
			var isTime;
			isTime = window.setInterval('time()', 1000);
			$.ajax({
				url : "/blog/board/time",
				success : function(result){
					$("#koreanTime").html(result);
				}
			});
			$.ajax({
				url : "/blog/board/calendar",
				success : function(result){
					$("#calendarSet").html(result);
				}
			});
		});
		function time(){
			$.ajax({
				url : "/blog/board/time",
				success : function(result){
					$("#koreanTime").html(result);
				}
			});
		}
	</script>
</head>
<body>

  <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="/blog/member/main">whoU</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="/blog/member/main">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="/blog/board/list">board</a></li>
                        <li class="nav-item"><a class="nav-link" href="/blog/imgBoard1/list">imgBoard</a></li>
                        <li class="nav-item"><a class="nav-link" href="/blog/img_board2/list">imgBoard2</a></li>
                        <li class="nav-item"><a class="nav-link" href="/blog/guest/guestbook">guestBook</a></li>
                    </ul>
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    	<c:if test="${sessionScope.memId != null}">
	                        <li class="nav-item"><a class="nav-link" href="/blog/member/updateForm">myPage</a></li>
	                        <li class="nav-item"><a class="nav-link" href="/blog/member/logout">logout</a></li>
                    	</c:if>
                    	<c:if test="${sessionScope.memId == null}">
	                        <li class="nav-item"><a class="nav-link" href="/blog/member/inputForm">join</a></li>
	                        <li class="nav-item"><a class="nav-link" href="/blog/member/login">login</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page header with logo and tagline-->
        <header class="py-5 bg-light border-bottom mb-4">
            <div class="container">
                <div class="text-center my-5">
                    <h1 class="fw-bolder">Welcome! Board Blog</h1>
                    <p class="lead mb-0">There are only articles in text format. (Not images)</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    <c:forEach var="dto" items="${pagedData}" varStatus="loop">
                    	<c:if test="${loop.index < 5}">
		                    <div class="card mb-4">
		                        <div class="card-body">
		                            <div class="small text-muted">${dto.reg} </div>
		                            written by ${dto.id }
		                            <h2 class="card-title">${dto.subject}</h2>
		                            <p class="card-text">${dto.content}</p>
		                            <a class="btn btn-primary" href="/blog/board/content?board_num=${dto.board_num }">Read more →</a>
		                        </div>
		                    </div>
	                    </c:if>
                    </c:forEach>

                    <!-- Pagination-->
                    <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
                        	<!-- varStatus="page"는 반복 횟수에 대한 정보를 가지고 있어서 page.index로 불러옴 -->
							<c:forEach begin="1" end="${totalPages}" varStatus="page">
								<c:choose>
									<c:when test="${page.index == pageNumber}">
										<li class="page-item active" aria-current="page">
											<a class="page-link" href="/blog/board/list?pageNumber=${page.index}">${page.index}</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="/blog/board/list?pageNumber=${page.index}">${page.index}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="page-item">
								<a class="page-link" href="/blog/board/list?pageNumber=${pageNumber + 1}">Next</a>
							</li>
						</ul>
                    </nav>
                </div>
                
                
                
                
                <!-- Side widgets-->
                <div class="col-lg-4">
                	<c:if test="${sessionScope.memId =='whou' }">
			        	<div class="justify-content-start d-flex" style="margin-bottom:20px;">
			        		<input type="button" class="btn btn-primary col-12 btn-lg" value="글쓰기" onclick="location='writeForm'">
			        	</div>
			       	</c:if>
                    <!-- Search widget-->
                    <div class="card mb-4">
                        <div class="card-header">Search</div>
                        <div class="card-body">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Enter search term..." aria-label="Enter search term..." aria-describedby="button-search" />
                                <button class="btn btn-primary" id="button-search" type="button">Go!</button>
                            </div>
                        </div>
                    </div>
                    <!-- Categories widget-->
                    <div class="card mb-4">
                        <div class="card-header">Categories</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">Web Design</a></li>
                                        <li><a href="#!">HTML</a></li>
                                        <li><a href="#!">Freebies</a></li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li><a href="#!">JavaScript</a></li>
                                        <li><a href="#!">CSS</a></li>
                                        <li><a href="#!">Tutorials</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">Side Widget</div>
                        <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
                    </div>
                    <!-- 시계  -->
                    <div class="card mb-4">
                    	<div class="card-header">Korean Time</div>
                    	<div class="card-body" id="koreanTime"></div>
                    </div>
                    <!-- 달력  -->
                    <div class="card mb-4">
                    	<div class="card-header">Calendar</div>
                    	<div class="card-body" id="calendarSet"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
</body>

</html>