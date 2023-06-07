<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>게시판</title>
</head>
<body>  
<h3>글내용 보기</h3>
	<form>
		<table border="1">  
		  <tr height="30">
		    <td align="center" width="125">글번호</td>
		    <td align="center" width="125">${article.num }</td>
		    <td align="center" width="125">조회수</td>
		    <td align="center" width="125">${article.readcount} </td>
		  </tr>
		  <tr height="30">
		    <td align="center" width="125">작성자</td>
		    <td align="center" width="125">${article.writer}</td>
		    <td align="center" width="125">작성일</td>
		    <td align="center" width="125">${article.reg_date}</td>
		  </tr>
		  <tr height="30">
		    <td align="center" width="125">글제목</td>
		    <td align="center" width="375" align="center" colspan="3">
			     ${article.subject}</td>
		  </tr>
		  <tr>
		    <td align="center" width="125">글내용</td>
		    <td align="left" width="375" colspan="3"><pre>${article.content}</pre></td>
		  </tr>
		  <tr height="30">      
		    <td colspan="4" align="right" >
		    	<c:if test="${sessionScope.id!=null }">
		    		<c:if test="${writerTrue}">
					  <input type="button" value="글수정" 
				       onclick="location='update?num=${article.num}&pageNum=${pageNum}'">
					   &nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="button" value="글삭제" 
				       onclick="location='delete?num=${article.num}&pageNum=${pageNum}'">
					   &nbsp;&nbsp;&nbsp;&nbsp;
					</c:if>
		    		<c:if test="${adminTrue}">
				      <input type="button" value="답글쓰기" 
				       onclick="location='write?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}'">
					   &nbsp;&nbsp;&nbsp;&nbsp;
			    	</c:if>
		    	</c:if>
		       <input type="button" value="글목록" 
		       onclick="location='list?pageNum=${pageNum}'">
		      	
		    </td>
		  </tr>
		</table>    
	</form>      
</body>
</html>      