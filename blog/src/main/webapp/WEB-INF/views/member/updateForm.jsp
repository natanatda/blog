<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<style>
	body {
	  min-height: 100vh;
	
	  background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
	  background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	  background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	  background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
	  background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
	}
	.input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
</style>
<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원정보</h4>
        <form action="/blog/member/updatePro" method="post" class="validation-form" novalidate>
           <div class="row">
            <div class="col-md-6 mb-3">
              <label for="id">아이디</label>
              <input type="text" class="form-control" name="id" id="id" value="${dto.id}" disabled>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div>
            <div class="col-md-6 mb-3">
              <label for="pw">비밀번호</label>
              <input type="password" class="form-control" name="pw" id="pw" value="${dto.pw}" >
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div>
          </div>
          <div class="mb-3">
              <label for="name">이름</label>
              <input type="text" class="form-control" name="name" id="name" value="${dto.name}" >
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>            
          </div>
          <div class="mb-3">
              <label for="birth">생년월일</label>
              <fmt:formatDate value="${dto.birth}" pattern="yyyy-MM-dd" var="formattedBirth" />
              <input type="date" class="form-control" name="birth" id="birth" value="${formattedBirth}" >
              <div class="invalid-feedback">
                생년월일을 선택해주세요.
              </div>            
          </div>
          <div class="mb-3">
            <label for="phone">전화번호</label>
            <input type="text" class="form-control" name="phone" id="phone" value="${dto.phone}" >
            <div class="invalid-feedback">
              핸드폰번호를 입력해주세요.
            </div>
          </div>
          <div class="mb-3">
            <label for="email">이메일</label>
            <input type="email" class="form-control" name="email" id="email" value="${dto.email}" >
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>         
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block w-100" type="submit">수정</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <a class="link-dark" href="/blog/member/main">Home</a>
    </footer>
  </div>
  
</body>
</html>