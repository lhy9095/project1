<%@page import="ch10.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="sessionChk.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="common.css">
<script type="text/javascript">
	function chk() {
		if (frm.password.value != frm.password2.value) {
			alert("암호와 암호확인이 다릅니다"); frm.password.focus();
			frm.password.value = "";  frm.password2.value = "";
			return false;
		}		
	}
</script>
</head>
<body>
<%
	MemberDao md = MemberDao.getInstance();	
	Member member = md.select(id);
	pageContext.setAttribute("member", member);
%>
<form action="update.jsp" method="post" name="frm" onsubmit="return chk()">
	<!-- id는 수정하면 안됨/ type="hidden" : 화면에는 안 보이지만 update.jsp로 보냄 -->
	<input type="hidden" name="id" value="${member.id }">
<table><caption>회원 정보 수정</caption>
	<tr><th>아이디</th><td>${member.id }</td></tr>
	<tr><th>암호</th><td><input type="password" name="password" required="required"></td></tr>
	<tr><th>암호확인</th><td><input type="password" name="password2" required="required"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name" required="required"
		value="${member.name }"></td></tr>
	<tr><th>주소</th><td><input type="text" name="address" required="required"
		value="${member.address }"></td></tr>
	<tr><th>전화번호</th><td><input type="tel" name="tel" required="required"
		pattern="010-\d{3,4}-\d{4}" placeholder="010-1111-1111"
		title="전화형식은 010-3/4자리-4자리" value="${member.tel }"></td></tr>
	<tr><th>가입일</th><td>${member.reg_date }</td></tr>
	<tr><th colspan="2"><input type="submit" value="확인"	></th></tr>		
</table>
</form>
</body>
</html>