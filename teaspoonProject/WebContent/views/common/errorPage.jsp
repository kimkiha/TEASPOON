<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/mypage/mypage_payment.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/reset.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/menubar.css">
<link rel="styleSheet" href="<%=request.getContextPath() %>/resources/css/common/footer.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
<div id="wrap">
	<%@ include file="menubar.jsp" %>
	<div id="content"style="width:1200px; height:1000px" >
	
	<h1 style="color:red; align:center;"><%= message %></h1>
	<%@ include file="../common/footer.jsp" %>
        <!-- //footer-->
    </div>
</div>
</body>
</html>