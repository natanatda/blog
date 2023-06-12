<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<body>
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
        <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <!-- Post categories-->
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                        </header>
                        
                        
						<form name="form" action="insert" method="post" enctype="multipart/form-data">
	                        <figure class="mb-4">
							  <label for="imageInput">
							  	<c:if test="${article.img!=null }">
							    	<img class="img-fluid rounded" src="/blog/resources/imgBoard1/${article.img}" alt="Preview Image" id="previewImage">
							  	</c:if>
							  	<c:if test="${article.img==null }">
							    	<img class="img-fluid rounded" src="https://dummyimage.com/900x400/ced4da/6c757d.jpg" alt="Preview Image" id="previewImage">
							  	</c:if>
							  </label>
							</figure>
							<input type="file" id="imageInput" name="imgFile" style="display: none;" >
	                        <section class="target">
									<input type="hidden" name="img" id="selectedFileName">
								    <textarea class="form-control" rows="1" name="subject" id="subject" placeholder="write subject!">${article.subject }</textarea>
								    <textarea class="form-control" rows="20" name="content" id="content" placeholder="write content!" >${article.content }</textarea>
	                        </section>
	                        <c:if test="${sessionScope.memId!=null }">
								<c:if test="${num==null }">
									<input type="submit"  class="btn btn-primary  col-12 btn-lg" value="write" style="margin-top:30px; margin-bottom:150px;" onclick="showContent();" >
								</c:if>
								<c:if test="${num!=null }">
									<input type="button"  class="btn btn-primary" value="update" style="margin-top:30px; margin-bottom:150px;" onclick="updatePro()" >
								</c:if>
	                        </c:if>
								<input type="button"  class="btn btn-primary" value="list" style="margin-top:30px; margin-bottom:150px;" onclick="location='list'" >
						</form>
                    </article>
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
<script>
	var content = document.getElementById("content").value;
	if (content.includes("\n")) {
		str = content.replace('<section class="target">\n<p class="fs-5 mb-4">', '')
        .replace('</p>\n</section>', '')
        .replace(/\n<p class="fs-5 mb-4">/g, '\n')
        .replace(/\n<h2 class="fw-bolder mb-4 mt-5">/g, '\n/')
        .replace(/<\/h2>/g, '/')
        .replace(/<\/p>/g, '');
		document.getElementById("content").value = str;
	} 
	var str="";
	function showContent() {
	    var content = document.getElementById("content").value;
	    if (content.includes("\n")) {
	    	str = content.replace(/\n+/g, "\n")
	            .replace(/\/+/g, '/')
    	        .replace(/\n/g, "</p>\n<p class=\"fs-5 mb-4\">");
			str = "<section class=\"target\">\n<p class=\"fs-5 mb-4\">" + str + "</p>\n</section>";
			str = str.replace(/<p class="fs-5 mb-4">\/+/g, '<h2 class="fw-bolder mb-4 mt-5">')
	        	.replace(/\/<\/p>/g, '</h2>');
			document.getElementById("content").value = str;
	    }
	}
	function updatePro() {
	    showContent();
		document.forms['form'].action = "/blog/imgBoard1/updatePro?num="+"${num}";
	    document.forms['form'].submit();
	}
	function openFileInput() {
		document.getElementById('imageInput').click();
	}
	document.getElementById('imageInput').addEventListener('change',handleFileSelect);
	function handleFileSelect(event) {
		const file = event.target.files[0];
		const previewImage = document.getElementById('previewImage');
		const selectedFileName = document.getElementById('selectedFileName');
		if (file) {
			const reader = new FileReader();
			reader.onload = function(e) {
				previewImage.src = e.target.result;
				selectedFileName.value = file.name;
			};
			reader.readAsDataURL(file);
		}
	}
</script>
</html>