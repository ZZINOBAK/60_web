<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 화면에 표시 --%>
<%
	String name = request.getParameter("username");
	String id = request.getParameter("userid");
	String pw = request.getParameter("pwd");
	String email = request.getParameter("email");
	String gender = request.getParameter("gender");

	String[] hobby = request.getParameterValues("hobby");

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 데이터</title>
</head>
<body>
	<h1>회원가입 정보(07_resp.jsp)</h1>
	<ul>
		<li>이름 : <%=name %></li>
		<li>아이디 : <%=id %></li>
		<li>암호 : <%=pw %></li>
		<li>이메일 : <%=email %></li>
		<li>성별 : <%=gender %></li>
  		<li>취미 : 
  		<%
  			if (hobby == null) {
			out.write("선택안함");
		} else {
			for (String str : hobby) {
				out.write(str + "&nbsp;&nbsp;");
			}
		}
  		 %>
		</li>
		
	</ul>
</body>
</html>