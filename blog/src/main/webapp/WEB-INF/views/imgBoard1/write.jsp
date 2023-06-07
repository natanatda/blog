<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>write</title>
</head>
<body>
	<h3>글쓰기</h3>
	<form action="writePro" method="post" name="writeForm">
		<c:if test="${article!=null }">
			<input type="hidden" name="num" value="${num }"> 
		</c:if>
		<c:if test="${ref!=null }">
			<input type="hidden" name="num" value="${num}"> 
			<input type="hidden" name="ref" value="${ref}"> 
			<input type="hidden" name="re_step" value="${re_step}">
			<input type="hidden" name="re_level" value="${re_level}"> 
		</c:if>
		
		<input type="hidden" name="writer" value="${sessionScope.id}"> 
		<table border="1">
			<tr>
				<td colspan="2"><a href="list">글목록</a></td>
			</tr>
			<tr>
				<td width="70"> 제목 </td>
				<td width="330">
					<c:if test="${ref==null}">
						<input type="text" name="subject" value="${article.subject }">
					</c:if>
					<c:if test="${ref!=null}">
						<input type="text" name="subject" value="[답변]">
					</c:if>
				 </td>
			</tr>
			<tr>
				<td width="70">Email</td>
				<td width="330"> <input type="text" name="email" value="${article.email}"> </td>
			</tr>
			<tr>
				<td width="70"> 내용 </td>
				<td width="330">
					<textarea rows="13" cols="40" name="content" >${article.content }</textarea>
				</td>
			</tr>
			<tr>
				<td width="70">비밀번호 </td>
				<td width="330"> <input type="password" name="passwd"> </td>
			</tr>
			<tr>
				<td colspan="2">
					<c:if test="${article==null }">
						<input type="submit" value="글쓰기">
					</c:if>
					<c:if test="${article!=null }">
						<input type="button" value="글수정" onclick="updatePro()">
					</c:if>
					<input type="reset" value="다시작성">
					<input type="button" value="목록보기" onclick="location='list'">
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
   function updatePro() {
       document.forms['writeForm'].action = "/spring/board/updatePro";
       document.forms['writeForm'].submit();
   }
</script>
</html>