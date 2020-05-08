<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Set"%>
<%@page import="com.entiy.Repository"%>
<%@page import="com.entiy.Product"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Map<Integer,Product>proMap=Repository.getProducts();
%>
<table border="1" cellspacing="0">
	<thead>
		<tr>
			<th>产品编号</th>
			<th>产品名称</th>
			<th>产品价格</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>
		<%
		
			Set<Integer> keys=proMap.keySet();
			for(Integer k :keys){
		%>
			<tr>
				<td>
					<%=proMap.get(k).getPid() %>
				</td>
				<td>
					<%=proMap.get(k).getName() %>
				</td>
				<td>
					<%=proMap.get(k).getPrice() %>
				</td>
				<td>
					<a href="BuyCart?add=<%=proMap.get(k).getPid() %>">添加</a>
				</td>
			</tr>
			<% 
			}
		%>
	</tbody>
</table>
<a href="cart.jsp">查看购物车</a>
<span>${msg}</span>
</body>
</html>