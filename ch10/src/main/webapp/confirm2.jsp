<%@page import="ch10.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	MemberDao md = MemberDao.getInstance();
	int result = md.confirm(id);
	if (result > 0) out.println("이미 사용중이니 다른 아이디를 쓰세요");
	else out.println("사용 가능한 아이디입니다.");
%>
</head>
<body>

</body>
</html>