<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//  Cookie c=new Cookie("useName",request.getParameter("uname"));
//  c.setMaxAge(10);
//  response.addCookie(c);
//  session.setAttribute("user", request.getParameter("uname"));
%>
<script>
	location.href='${pageContext.request.contextPath}/list.jsp';
</script>
</body>
</html>