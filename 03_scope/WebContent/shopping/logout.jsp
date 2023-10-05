<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- [로그아웃] 세션초기화(무효화) 후 로그인 화면으로 이동 --%>
<%
	session.invalidate();
	response.sendRedirect("login.jsp");
%>