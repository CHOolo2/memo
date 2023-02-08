<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/static/css/styles.css" type="text/css">
<title>로그인</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/inculde/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="join-box my-5">
				<input type="text" id="idInput" placeholder="아이디" class="form-control mt-2">
				<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-2">
				<button type="button" id="LoginBtn" class="btn btn-primary btn-black mt-2">로그인</button>
				
				<div class="text- center mt-4"><a herf="/user/signup/view"></a></div>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/inculde/footer.jsp"/>
	</div>
	<script>
		$(document).ready(function(){
			$("#loginBtn").on("click",function(){
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				
				if(id == "") {
					alert("아이디를 입력해주세요");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				$.ajax({
					type:"post"
					,url:"/user/signin"
					,data:{"loginnId":id, "password":password}
					,succcess:function(){
						if(data.result == "success"){
							location.href = "/post/list/view";
						}else{
							alert("아이디 또는 비밀번호를 확인해주세요")
						}
					}
					,error:function(){
						alert("로그인 에러")
					}
				});
		});
	</script>
</body>
</html>