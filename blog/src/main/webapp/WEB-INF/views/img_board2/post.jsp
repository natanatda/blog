<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ImageBoard2</title>
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
        <!-- Page content-->
        
        <div class="container mt-5">
            <div class="row">
        
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${board.subject}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">
                            <%-- 날짜 포메팅 --%>
                             <fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd HH:mm" type="date"/>
                            </div>
                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4"><img class="img-fluid rounded" src="../resources/imgBoard2/${board.img}" alt="img" width="50%" height="50%"/></figure>
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4">${board.content}</p>
                        </section>
                        <div style="margin-bottom:20px;">
	                        <button class="btn btn-primary" type="button" onclick="location='/blog/img_board2/deletePro?img_board2_num=${board.img_board2_num}'">Delete</button>
	                        <button class="btn btn-primary" type="button" onclick="location='/blog/img_board2/writeForm?img_board2_num=${board.img_board2_num}'">Update</button>
	                        <button class="btn btn-primary" type="button" onclick="location='/blog/img_board2/list'">List</button>
                    	</div>
                    </article>
                </div> 
                <div>
			</div>    
            </div>
            <!--  <section class="mb-5">
                        <div class="card bg-light">
                            <div class="card-body">
                                Comment form
                                <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea>
                                <input class="btn btn-primary" type="submit" value="Submit">
                                </form>
                                Comment with nested comments
                                <div class="d-flex mb-4">
                                    Parent comment
                                    <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..." /></div>
                                    <div class="ms-3">
                                        <div class="fw-bold">Commenter Name</div>
                                        If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section> -->
        </div>
        
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
</body>
</html>