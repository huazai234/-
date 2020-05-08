<%@page import="java.util.Set"%>
<%@page import="com.entiy.Product"%>
<%@page import="com.entiy.ShopCart"%>
<%@page import="java.util.Map"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body>	
<table border="1" cellspacing="0">
	<thead>
		<tr>
			<th>产品编号</th>
			<th>产品名称</th>
			<th>产品价格</th>
			<th>产品数量</th>
			<th>小计</th>
			<th>操作</th>
		</tr>
	</thead>
	<tbody>	
	<c:forEach items="${cart.list}" var="product" varStatus="idx">
		<tr>
				<td>
					${product.pid}
				</td>
				<td>
					${product.name}
				</td>
				<td class="price">
					${product.price}
				</td>
				<td >
					<span class="add span">+</span>
					<span class="count">
			    	${product.cartCount}
			    	</span>
			    	<span class="sub span">-</span>
				</td>
				<td class="all">
					${product.price*product.cartCount}
				</td>
				<td>
					<a href="BuyCart?delete=${idx.index}">删除</a>
				</td>
			</tr>		
	</c:forEach>			
	</tbody>
</table>
<a href="list.jsp">返回主页面</a>
<script type="text/javascript">
	$(".span").css("cursor","pointer")
	$(".add").click(function(){
	   
		var value=$(this).next().text()
		if(value>=0){
			$(this).next().text(parseInt(value)+1)
			console.log()
		}
		$(this).parent().next().text(parseInt($(this).next().text())*parseInt($(this).parent().prev().text()))
	})
	$(".sub").click(function(){
	    
		var value=$(this).prev().text()
		if(value>0){
			$(this).prev().text(parseInt(value)-1)
			console.log()
		}
		$(this).parent().next().text(parseInt($(this).prev().text())*parseInt($(this).parent().prev().text()))
	})
	
</script>
</body>
</html>