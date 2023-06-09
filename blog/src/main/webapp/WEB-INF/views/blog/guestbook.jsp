<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GuestBook</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<script language="JavaScript">
	function checkIt() {
	    var guestForm = document.guestForm;
	    if (!guestForm.subject.value) {
	      alert("방명록를 작성하세요");
	      return false;
	    }
	}
	$(function(){
		window.setInterval('timeK()', 1000);
		window.setInterval('timeN()', 1000);
		window.setInterval('timeL()', 1000);
	});

	function timeK(){
		$.ajax({
			url : "/blog/guest/timeK",
			success : function(result){
				$("#timeK").html(result);
			}
		});
	}
	function timeN(){
		$.ajax({
			url : "/blog/guest/timeN",
			success : function(result){
				$("#timeN").html(result);
			}
		});
	}
	function timeL(){
		$.ajax({
			url : "/blog/guest/timeL",
			success : function(result){
				$("#timeL").html(result);
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
                    <h1 class="fw-bolder">Welcome! Everyone!</h1>
                    <p class="lead mb-0">Please leave a guestbook message</p>
                </div>
            </div>
        </header>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Comments section-->
                    <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                <!-- Comment form-->
                                <form class="mb-4" method="post" action="insert" name="guestForm" onSubmit="return checkIt()">
                                	<c:if test="${sessionScope.memId != null}">
	                                	<textarea class="form-control" rows="3" name="subject" placeholder="방명록을 작성해보세요~"></textarea>
	                                	<div class="justify-content-end d-flex">
		                                	<button type="submit" class="btn btn-primary btn-sm mt-2">등  록</button>
	                                	</div>
                                	</c:if>
                                	<c:if test="${sessionScope.memId == null}">
                                		<textarea class="form-control" rows="3" name="subject" placeholder="로그인시 작성 가능" disabled></textarea>
                                	</c:if>
                                </form>
                                <!-- Single comment-->
                                <c:forEach var = "dto" items = "${list}">
	                                <div class="d-flex">
	                                    <div class="flex-shrink-0"><img class="rounded-circle" src="/blog/resources/img/KakaoTalk_20230608_101540136.png" width="50px" height="50px" /></div>
	                                    <div class="ms-3 w-100">
	                                    	<fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd HH:mm:ss" var="formattedDate" />
	                                        <div class="fw-bold">${dto.id}&nbsp;&nbsp;${formattedDate}</div>
	                                        ${dto.subject}
	                                        <c:if test="${sessionScope.memId != null}">
	                                        	<c:if test="${sessionScope.memId.equals(dto.id)}">
	                                        		<c:if test="${a == null}">
		                                        		 
				                                        <div class="justify-content-end d-flex">
						                                	<button type="button" class="btn btn-light btn-xs" onclick="location='guestbook?a=1&num=${dto.num}'">수정</button>
						                                	<button type="button" class="btn btn-light btn-xs" onclick="location='delete?num=${dto.num }'">삭제</button>
					                                	</div>
				                                	</c:if>
			                                	</c:if>
		                                	</c:if>
		                                	<c:if test="${sessionScope.memId != null}">
	                                        	<c:if test="${sessionScope.memId.equals(dto.id)}">
	                                        		<c:if test="${a != null}">
	                                        			<c:if test="${num == (dto.num)}">
	                                        			<form class="mb-4" method="post" action="update?num=${dto.num }">
		                                        		    <textarea class="form-control" rows="3" name="subject">${dto.subject}</textarea>
					                                        <div class="justify-content-end d-flex">
							                                	<button type="submit" class="btn btn-light btn-xs">수정</button>
							                                	<button type="button" class="btn btn-light btn-xs" onclick="location='guestbook'">취소</button>
						                                	</div>
					                                	</form>
					                                	</c:if>
				                                	</c:if>
			                                	</c:if>
		                                	</c:if>
	                                        <hr>
	                                    </div>
	                                </div>
                                </c:forEach>
                                
                                 <nav aria-label="Pagination">
			                        <hr class="my-0" />
			                        <ul class="pagination justify-content-center my-4">
			                           <c:if test="${endPage > pageBlock}">
			                               <li class="page-item disabled"><a class="page-link" href="guestbook?pageNum=${startPage-pageBlock}" tabindex="-1" aria-disabled="true">Newer</a></li>
			                     	   </c:if>
			                           <c:forEach var="num" begin="${startPage}" end="${endPage}">
			                               <c:if test="${num==currentPage}">
			                                  <li class="page-item active" aria-current="page"><a class="page-link" href="guestbook?pageNum=${num}">${num }</a></li>
			                         	   </c:if>
			                               <c:if test="${num!=currentPage}">
			                                  <li class="page-item"><a class="page-link" href="guestbook?pageNum=${num}">${num }</a></li>
			                        	   </c:if>
			                     	   </c:forEach>
			                           <c:if test="${endPage < pageCount}">
			                               <li class="page-item"><a class="page-link" href="guestbook?pageNum=${startPage+pageBlock}">Older</a></li>
			                     	   </c:if>
			                        </ul>
		                    	</nav>
                            </div>
                        </div>
                    </section>
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
                        <div class="card-header">Seoul Time</div>
                        <div  id="timeK" class="card-body"></div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">NewYork Time</div>
                        <div  id="timeN" class="card-body"></div>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">London Time</div>
                        <div  id="timeL" class="card-body"></div>
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