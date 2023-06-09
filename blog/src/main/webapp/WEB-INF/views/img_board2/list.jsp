<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImgBoard2</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
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
                    <h1 class="fw-bolder">Welcome to Blog Home!</h1>
                    <p class="lead mb-0">A Bootstrap 5 starter layout for your next blog homepage</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container">
            <div class="row">
                <!-- Blog entries-->
                <div class="col-lg-8">
                    <!-- Featured blog post-->
                    
                    <!-- Nested row for non-featured blog posts-->
                  
                    <div class="row">
                        <div class="col-lg-6">
                        <c:if test="${count > 0}">
                    	<c:forEach var="board" items="${list}">
                            <!-- Blog post-->
                            <div class="card mb-4">
                                <a href="#!"><img class="card-img-top" src="../resources/imgBoard2/${board.img}" alt="img" /></a>
                                <div class="card-body">
                                    <div class="small text-muted"><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd HH:mm" type="date"/></div>
                                    <h2 class="card-title h4">${board.subject}</h2>
                                    <p class="card-text">${board.content}</p>
                                    <a class="btn btn-primary" href="/blog/img_board2/post?img_board2_num=${board.img_board2_num}">Read more →</a>
                                </div>
                            </div>
                        </c:forEach>
                        </c:if>
                        </div>
                    </div>
                    
                    <!-- Pagination-->
               		 <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
							<c:if test="${pageNum != 1}">
	                            <li class="page-item"><a class="page-link" href="/blog/img_board2/list?pageNum=${pageNum - 1}" tabindex="-1" aria-disabled="true">Prev</a></li>
							</c:if>
                            <c:forEach var="num" begin="${startPage}" end="${endPage}">
	                            <c:if test="${num==currentPage}">
	                            	<li class="page-item active" aria-current="page"><a class="page-link" href="/blog/img_board2/list?pageNum=${num}">${num }</a></li>
								</c:if>
	                            <c:if test="${num!=currentPage}">
	                            	<li class="page-item" aria-current="page"><a class="page-link" href="/blog/img_board2/list?pageNum=${num}">${num }</a></li>
								</c:if>
							</c:forEach>
                            <c:if test="${pageNum != endPage}">
	                            <li class="page-item"><a class="page-link" href="/blog/img_board2/list?pageNum=${pageNum + 1}">Next</a></li>
	                         </c:if>
                        </ul>
                    </nav>
                
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                	<!-- 글쓰기 버튼 -->
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
                   
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">Side Widget</div>
                        <div class="card-body">You can put anything you want inside of these side widgets. They are easy to use, and feature the Bootstrap 5 card component!</div>
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