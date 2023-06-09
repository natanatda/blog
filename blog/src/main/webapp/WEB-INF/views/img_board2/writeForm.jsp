<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>게시판</title>
</head>
   
<body>  
<b>글쓰기</b>
<br>
<c:if test="${board != null}">
<form action="/blog/img_board2/updatePro" method="post">
<table border="1">
   <tr>
    <td align="right" colspan="2">
	    <a href="/blog/img_board2/list"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td>아이디</td>   
    <td>
      ${sessionScope.memId}
    </td>
  </tr>
  <tr>
    <td>제 목</td>
    <td>   
       <input type="text" size="40" maxlength="50" name="subject" value="${board.subject}">
    </td>
  </tr>
  <tr>
    <td>내 용</td>
    <td>
     <textarea name="content" rows="13" cols="40">${board.content}</textarea> 
    </td>
  </tr>
  <tr>
  	<td>이미지 첨부</td>
  	<td><input type="file" id="imageInput" name="imgFile"/></td>
  </tr>
<tr>      
 <td> 
  <input type="hidden" value="${board.img_board2_num}" name="img_board2_num"/>
  <input type="submit" value="수정" >
  <input type="button" value="목록보기" OnClick="window.location='/blog/img_board2/list'">
</td></tr>
</table>
</form>
</c:if>

<c:if test="${board == null }">
<form method="post" name="writeform" action="/blog/img_board2/writePro" enctype="multipart/form-data">
<table border="1">
   <tr>
    <td>아이디</td>
    <td>
      ${sessionScope.memId}
    </td>
  </tr>
  <tr>
    <td>제 목</td>
    <td>   
       <input type="text" size="40" maxlength="50" name="subject">
    </td>
  </tr>
  <tr>
    <td>내 용</td>
    <td>
     <textarea name="content" rows="13" cols="40"></textarea> 
    </td>
  </tr>
  <tr>
  	<td>이미지 첨부</td>
  	<td><input type="file" id="imageInput" name="imgFile"/></td>
  </tr>
<tr>      
 <td> 
  <input type="hidden" name="img" id="selectedFileName">
  <input type="submit" value="글작성" >
  <input type="button" value="목록보기" OnClick="window.location='/blog/img_board2/list'">
</td></tr></table>         
</form>
</c:if>      
</body>


<script>
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
