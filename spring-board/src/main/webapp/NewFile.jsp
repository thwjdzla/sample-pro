<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title></title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<div class="login">
		<h2 class="loginTitle">로그인</h2>
		<div class="loginRow">
			<form name="loginForm" id="loginForm" method="post">
				<div class="loginCol">
					<h2 class="loginTitle2">회원 로그인</h2>
					<div class="loginBox">
						<div class="loginFm">
							<input type="text" class="ipt fw-full" placeholder="아이디를 입력해 주세요." title="아이디를 입력해 주세요." name="mber_id" id="mber_id" maxlength="20" />
							<input type="password" class="ipt fw-full fmMg-1" placeholder="비밀번호를 입력해 주세요." title="비밀번호를 입력해 주세요." name="pw" id="pw" maxlength="20" />
							<span class="chkFm fmMg-1">
								<input type="checkbox" class="chk" id="chkSaveId" name="chkSaveId" value="Y" />
								<span class="act"></span>
								<label for="chkSaveId" class="fc-3">아이디 저장</label>
							</span>
							<span class="forgot">
								<a href="#" class="txtLine" onclick="">아이디 찾기 / 비밀번호 변경</a>
							</span>
							<a href="#" class="btn-1 btnLogin" onclick="">로그인</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>