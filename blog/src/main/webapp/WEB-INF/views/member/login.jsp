<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</head>
<style>
  
   html,
   body {
     height: 100%;
   }
   
   body {
     display: flex;
     align-items: center;
     padding-top: 40px;
     padding-bottom: 40px;
     background-color: #f5f5f5;
   }
   
   .form-signin {
     width: 100%;
     max-width: 330px;
     padding: 15px;
     margin: auto;
   }
   
   .form-signin .checkbox {
     font-weight: 400;
   }
   
   .form-signin .form-floating:focus-within {
     z-index: 2;
   }
   
   .form-signin input[type="email"] {
     margin-bottom: -1px;
     border-bottom-right-radius: 0;
     border-bottom-left-radius: 0;
   }
   
   .form-signin input[type="password"] {
     margin-bottom: 10px;
     border-top-left-radius: 0;
     border-top-right-radius: 0;
   }
</style>
<body class="text-center">
	<main class="form-signin">
      <form action="/blog/member/loginPro" method="post">         
         <h1 class="h3 mb-3 fw-normal">로그인 페이지</h1>
         
         <div class="form-floating">
            <input type="text" class="form-control" name="id" id="id" placeholder="아이디 입력...">
            <label for="id">아이디</label>
         </div>
         <div class="form-floating">
            <input type="password" class="form-control" name="pw" id="pwd" placeholder="Password">
            <label for="pwd">비밀번호</label>
         </div>
         
         <div class="checkbox mb-3">
            <label>
               <input type="checkbox" name="re" value="remember-me"> 아이디 저장
            </label>
         </div>
         <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
         <p class="mt-5 mb-3 text-muted">&copy; 2023</p>
      </form>
   </main>
  </body>
</html>