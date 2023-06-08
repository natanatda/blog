<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
		<script type="text/javascript" src="/blog/resources/static/libs/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		
		<title>Insert title here</title>
	</head>
	<body>
	    <form method="post" action="/save-content">
	        <textarea id="editor" name="content"></textarea>
	        <button type="submit">저장</button>
	    </form>
    </body>

	    <script>
	        var oEditors = [];
	        nhn.husky.EZCreator.createInIFrame({
	            oAppRef: oEditors,
	            elPlaceHolder: "editor",
	            sSkinURI: "/blog/resources/static/libs/smarteditor/SmartEditor2Skin.html",
	            fCreator: "createSEditor2"
	        });
	    </script>

</html>