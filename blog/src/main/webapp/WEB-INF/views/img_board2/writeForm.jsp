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
<form method="post" name="writeform" action="/blog/blog/writePro" >
<input type="hidden" name="num">
<input type="hidden" name="ref">
<input type="hidden" name="re_step">
<input type="hidden" name="re_level">

<table border="1">
   <tr>
    <td align="right" colspan="2">
	    <a href="/blog/blog/list.jsp"> 글목록</a> 
   </td>
   </tr>
   <tr>
    <td>이 름</td>
    <td>
       <input type="text" size="10" maxlength="10" name="id"></td>
  </tr>
  <tr>
    <td>제 목</td>
    <td>   
    <c:if test="${num == null}">
       <input type="text" size="40" maxlength="50" name="subject">
	</c:if>
    </td>
  </tr>
  <tr>
    <td>내 용</td>
    <td>
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
  <tr>
  	<td>이미지 첨부</td>
  	<td><input type="file" name="save"/></td>
  </tr>
<tr>      
 <td> 
  <input type="submit" value="글쓰기" >  
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='/blog/blog/list'">
</td></tr></table>         
</form>      
</body>
</html>      
