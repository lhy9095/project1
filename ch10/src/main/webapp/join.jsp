<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="ch10.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<% request.setCharacterEncoding("utf-8"); %>
<!-- Member member = new Member(); -->
<jsp:useBean id="member" class="ch10.Member"></jsp:useBean>
<!-- 화면에 입력된 id, password, name, tel, address를 전부 setter method를 통해 member 객체에 저장 -->
<jsp:setProperty property="*" name="member"/>
</head>
<body>
<%
	MemberDao md = MemberDao.getInstance();
	int result = md.insert(member);  // member => DTO
	if (result > 0) {
%>
<script type="text/javascript">
	alert("입력 성공 ㅋㅋ");
	location.href="loginForm.jsp";
</script>
<%  } else { %>
<script type="text/javascript">
	alert("에효 ! ㅠㅠ");
    history.go(-1);
</script>
<%  } %>
</body>
</html>