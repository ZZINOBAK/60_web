<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 전달받은 데이터(파라미터값)를 화면 출력 --%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String ha = request.getParameter("ha");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>응답페이지</title>
</head>
<body>
	<h2>응답페이지(04_resp_id_pw.jsp)</h2>
	<h3>(응답)당신이 입력한 데이터가 맞나요?</h3>
	<h2>아이디 : <%=id %></h2>
	<h2>암호 : <%=pw %></h2>
	<h1><%=ha %></h1> 
	<%--체크박스는 on / null 로 출력되는군...--%>
</body>
</html>



