<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>아이디/비밀번호 찾기</title>
<link rel="stylesheet" href="style.css">
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>

body {
    background-color: #edf0ef; /* 옅은 회색 배경 테마 */
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.find-container {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
    text-align: center;
}

h2, h4 {
    color: #333; /* 검은색 텍스트 */
}

input {
    background-color: #4682b4; /* 스틸 블루 색상 */
    color: white;
    padding: 10px;
    margin: 10px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input:hover {
    background-color: #36648b; /* 더 어두운 스틸 블루로 변경 (hover 시) */
}

</style>
</head>
<body>
	<h2>아이디/비밀번호 찾기</h2>
	<br>
	<input id="findId" type="button" name="findId" value="아이디 찾기" >
	<input id="findPw" type="button" name="findPw" value="비밀번호 찾기" >
</body>

<script>
$('#findId').on('click',function(){
	console.log('아이디 찾기 페이지 진입');
	location.href='findId';
});

$('#findPw').on('click',function(){
	console.log('비밀번호 찾기 페이지 진입');
	location.href='findPw';
});
</script>
</html>