<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<title>게시판</title>
</head>
<body >
<b>글목록(전체 글:${count})</b>

<table>
<tr>
    <td align="right" >
    <a href="/blog/blog/writeForm">글쓰기</a>
    </td>
</table>

<c:if test="${count == 0}">
<table border="1" >
<tr>
    <td>
    게시판에 저장된 글이 없습니다.
    </td>
</table>
</c:if>

<c:if test="${count > 0}">
<table border="1"> 
    <tr > 
      <td >번 호</td> 
      <td >제   목</td> 
      <td >이미지</td> 
      <td >작성자</td>
      <td >작성일</td> 
      <td >조 회</td> 
      <td >IP</td>    
    </tr>
   <c:forEach var="board2" items="${list}">
   <tr >
    <td >
    <c:set var="count" value="${count - 1}" />${count}
    </td>
    <td>
	${board2.subject}
      <a href="content?num=${board2.img_board2_num}">
           </a> </td>
    <td>${board2.img} </td>
    <td>
    ${board2.id } 
       </td>
    <td>
    <%-- 날짜 포메팅 --%>
    <fmt:formatDate value="${board2.reg_date }" pattern="yyyy-MM-dd HH:mm" type="date"/>
    </td>
    <td>${board2.readcount}</td>
    <td>${board2.ip}</td>
  </tr>
</c:forEach>

</table>
	
        <a href="list.jsp?pageNum=">[이전]</a>
	
	
        <a href="list.jsp?pageNum= i ">[i ]</a>
	

        <a href="list.jsp?pageNum=startPage + 10">[다음]</a>
</c:if>

</body>
</html>