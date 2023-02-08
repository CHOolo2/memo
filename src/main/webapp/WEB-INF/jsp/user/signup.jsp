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
<title>회원가입</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/jsp/inculde/header.jsp"/>
		<section class="contents d-flex justify-content-center">
			<div class="join-box my-5">
				<h2 class="text-center">회원가입</h2>
				<input type="text" id="idInput" placeholder="아이디" class="form-control mt-2">
				<input type="password" id="passwordInput" placeholder="비밀번호" class="form-control mt-2">
				<input type="password" id="passwordConfirmInput" placeholder="비밀번호 확인" class="form-control mt-2">
				<input type="text" id="nameInput" placeholder="이름" class="form-control mt-2">
				<input type="text" id="emailInput" placeholder="이메일" class="form-control mt-2">
				<button type="button" id="joinBtn" class="btn btn-primary btn-black mt-2">가입</button>
			</div>
		</section>
		<c:import url="/WEB-INF/jsp/inculde/footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function(){
			$("#joinBtn").on("click",function(){
				let id = $("#idInput").val();
				let password = $("#passwordInput").val();
				let passwordConfirm = $("#passwordConfirmInput").val();
				let name = $("#nameInput").val();
				let email = $("#emailInput").val();
				
				if(id == "") {
					alert("아이디를 입력해주세요");
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요");
					return ;
				}
				
				if(password != passwordConfirm) {
					alert("비밀번호가 일치하지 않습니다");
					return ;
				}
				
				if(name == "") {
					alert("이름을 입력하세요");
					return ;
				}
				
				if(email == "") {
					alert("이메일을 입력하세요");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/user/signup"
					,data:{"loginId":id, "password":password,"name":name}
					,success:function(){
						if(data.result == "success"){
							location.href = "/user/signin/view";
						}else{
							alert("회원가입 실패")
						}
					}
					,error:function(){
						elert("회원가입 오류")
					}
				});
			});
		});
	
	</script>
</body>
</html>