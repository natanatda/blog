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
<style type="text/css">
	.target {
    /* 여러 줄 자르기 추가 스타일 */
	    white-space: normal;
	    line-height: 1.2;
	    height: 20px;
	    text-align: left;
	    word-wrap: break-word;
	    display: -webkit-box;
	    -webkit-line-clamp: 3;
	    -webkit-box-orient: vertical;
	 	text-overflow: ellipsis;
	 	overflow: hidden;
	}
</style>
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>

  <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        <li class="nav-item"><a class="nav-link" aria-current="page" href="#">Blog</a></li>
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
                    <div class="card mb-4">
                    	<c:if test="${firstList.img!=null }">
							<a href="#!"><img class="card-img-top" src="/blog/resources/imgBoard1/${firstList.img}" alt="..." /></a>
						</c:if>
						<c:if test="${firstList.img==null }">
					    	<a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
						</c:if>
                        <div class="card-body">
                            <div class="small text-muted">${firstList.reg_date }</div>
                            <h2 class="card-title">${firstList.subject }</h2>
                            <p class="card-text"><div class="target">${firstList.content }</div></p>
                            <a class="btn btn-primary" href="content?num=${firstList.img_board1_num}">Read more →</a>
                        </div>
                    </div>
                    
                    <c:forEach var="dtoSemiList" items="${dtoList}">
						<div class="row">
							<!-- Blog post-->
		                   	<c:forEach var="dto" items="${dtoSemiList}">
								<div class="col-lg-6">
									<div class="card mb-4">
										<c:if test="${dto.img!=null }">
					                        <a href="#!"><img class="card-img-top" src="/blog/resources/imgBoard1/${dto.img}" alt="..." /></a>
										</c:if>
										<c:if test="${dto.img==null }">
					                        <a href="#!"><img class="card-img-top" src="https://dummyimage.com/850x350/dee2e6/6c757d.jpg" alt="..." /></a>
										</c:if>
				                        <div class="card-body">
				                            <div class="small text-muted">${dto.reg_date }</div>
				                            <h2 class="card-title">${dto.subject }</h2>
				                            <p class="card-text">${dto.content }</p>
				                            <a class="btn btn-primary" href="content?num=${dto.img_board1_num}">Read more →</a>
				                        </div>
				                    </div>
		                        </div>
							</c:forEach>
	                    </div>
                   	</c:forEach>
                    <nav aria-label="Pagination">
                        <hr class="my-0" />
                        <ul class="pagination justify-content-center my-4">
	                        <c:if test="${endPage > pageBlock}">
	                            <li class="page-item disabled"><a class="page-link" href="list?pageNum=${startPage-pageBlock}" tabindex="-1" aria-disabled="true">Newer</a></li>
							</c:if>
                            <c:forEach var="num" begin="${startPage}" end="${endPage}">
	                            <c:if test="${num==currentPage}">
	                            	<li class="page-item active" aria-current="page"><a class="page-link" href="list?pageNum=${num}">${num }</a></li>
								</c:if>
	                            <c:if test="${num!=currentPage}">
	                            	<li class="page-item" aria-current="page"><a class="page-link" href="list?pageNum=${num}">${num }</a></li>
								</c:if>
							</c:forEach>
                            <c:if test="${endPage < pageCount}">
	                            <li class="page-item"><a class="page-link" href="list?pageNum=${startPage+pageBlock}">Older</a></li>
							</c:if>
                        </ul>
                    </nav>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
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
					<a class="btn btn-primary" href="write">write</a>
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
</body>

</html>