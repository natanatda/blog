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
<c:if test="${board == null}">
<form method="post" name="writeform" action="/blog/img_board2/writePro" enctype="multipart/form-data">
</c:if>
<c:if test="${board != null}">
<form method="post" name="writeform" action="/blog/img_board2/updatePro" >

</c:if>
<table border="1">
   <tr>
    <td align="right" colspan="2">
	    <a href="/blog/img_board2/list"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td>아이디</td>
    <c:if test="${board.id == null }">
    <td>
       <input type="text" size="10" maxlength="10" name="id">
    </td>
    </c:if>
    <c:if test="${board.id != null }">
    <td>
      ${board.id}
    </td>
    </c:if>
  </tr>
  <tr>
    <td>제 목</td>
    <c:if test="${board.subject == null}">
    <td>   
       <input type="text" size="40" maxlength="50" name="subject">
    </td>
    </c:if>
    <c:if test="${board.subject != null}">
    <td>   
       <input type="text" size="40" maxlength="50" name="subject" value="${board.subject}">
    </td>
    </c:if>
  </tr>
  <tr>
    <td>내 용</td>
    <c:if test="${board.content == null}">
    <td>
     <textarea name="content" rows="13" cols="40"></textarea> 
    </td>
    </c:if>
    <c:if test="${board.content != null}">
    <td>
     <textarea name="content" rows="13" cols="40">${board.content}</textarea> 
    </td>
    </c:if>
  </tr>
  <c:if test="${board.img == null}">
  <tr>
  	<td>이미지 첨부</td>
  	<td><input type="file" id="imageInput" name="imgFile"/></td>
  </tr>
  </c:if>
<tr>      
 <td> 
  <input type="hidden" value="${board.img_board2_num}" name="img_board2_num"/>
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='/blog/img_board2/list'">
</td></tr></table>         
</form>      
</body>
</html>      
