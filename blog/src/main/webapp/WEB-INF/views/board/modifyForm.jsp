<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="list" items="${list}">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<!-- 네이버 스마트에디터  -->
	<script type="text/javascript" src="/blog/resources/static/libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	
	
</head>
<body>
  <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" href="#!">Start Bootstrap</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li>
                        <li class="nav-item"><a class="nav-link active" aria-current="page" href="#">Blog</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page content-->
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                <form method="post" action="modifyPro"  onsubmit="return submitContents()">
                	<input type="hidden" name="id" value="${list.id}">
                	<input type="hidden" name="board_num" value="${list.board_num}">
					<%-- 제목 --%>
					<input type="text" value="${list.subject}" placeholder="제목을 작성하세요" name="subject" style="width: 100%;">
					
					<div id="smartEditor">
					<%-- 네이버 에디터 --%>
	                <textarea id="txtContent" name="content" rows="10" cols="100" style="width: 100%;">${list.content}</textarea>
	                </div>
	                
					<!-- textarea 밑에 script 작성하기 -->
					<script id="smartEditor" type="text/javascript"> 
						var oEditors = [];
						nhn.husky.EZCreator.createInIFrame({
						    oAppRef: oEditors,
						    elPlaceHolder: "txtContent",  //textarea ID 입력
						    sSkinURI: "/blog/resources/static/libs/smarteditor/SmartEditor2Skin.html",  //martEditor2Skin.html 경로 입력
						    fCreator: "createSEditor2",
						    htParams : { 
						    	// 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
						        bUseToolbar : true, 
								// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseVerticalResizer : false, 
								// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
								bUseModeChanger : false 
						    }
						});
						function submitContents(elClickedObj) {
							 // 에디터의 내용이 textarea에 적용된다.
							 oEditors.getById["txtContent"].exec("UPDATE_CONTENTS_FIELD", []);

							 try {
							     elClickedObj.form.submit();
							 } catch(e) {}
						}
					</script>
	                <input type="submit" id="save" class="btn btn-primary" value="저장"/>
	                <input type="button" class="btn btn-primary" value="취소"/>
				</form>
				</c:forEach>
                    
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
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="py-5 bg-dark">
            <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2023</p></div>
        </footer>
</body>
</html>