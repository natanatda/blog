<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<title>게시판</title>
		<link href="style.css" rel="stylesheet" type="text/css">
		<script type="text/javascript">
			function deleteSave(){
				if(document.delForm.passwd.value==''){
					alert("비밀번호를 입력하세요");
					document.delForm.passwd.focus();
					return false;
				}
			}
		</script>
	</head>
	<body>
		<div class="center">
			<h3>글삭제</h3>
			<form method="post" name="delForm" action="deletePro?pageNum=${pageNum}" onsubmit="return deleteSave();">
				<table border="1" >
					<tr height="30">
						<td align="center">
						<h3>비밀번호를 입력해 주세요</h3>
					</tr>
					<tr height="30">
						<td align="center">비밀번호 :
							<input type="password" name="passwd" size="8" maxlength="12">
							<input type="hidden" name="num" value="${num }"></td>
					</tr>
					<tr height="30">
						<td align="center">
							<input type="submit" value="글삭제">
							<input type="button" value="글목록"
							onclick="location='list?pageNum=${pageNum}'">
						</td>
					</tr>	
				</table>
			</form>
		</div>
	</body>
	
</html>