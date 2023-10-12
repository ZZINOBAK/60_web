<%@page import="com.mystudy.mybatis.GuestbookVO"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");
	
	//1. 파라미터 값 확인(추출) - VO에 저장
	
	String idx = request.getParameter("idx");
%>
	<jsp:useBean id="guestbookVO" class="com.mystudy.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO"/>
	
<%
 	
	//DB에서 전체 데이터 조회 후 화면 출력
	// openSession(), openSession(false) : Auto Commit 해제상태(트랜잭션 처리 필요)
	// openSession(true) : 자동커밋 상태로 세션 객체 생성(SQL 실행후 자동커밋)
	//1. SqlSession 객체 생성
	SqlSession ss = DBService.getFactory().openSession();
	
	//2. 매퍼(mapper)의 SQL 실행해서 데이터 가져오기
	// SqlSession selectList(매퍼정보) : select 결과를 List 형태로 받기
	// SqlSession selectOne(매퍼정보) : select 결과가 하나인(1,0) 경우
	GuestbookVO list = ss.selectOne("guestbook.one", guestbookVO);
	ss.close();
	
	System.out.println("list : " + list);
	
	//3. SQL문 실행 후 받은 데이터 화면 출력
	pageContext.setAttribute("attr_list", list);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%=idx %></p>
	<c:forEach var="vo" items="${attr_list }">
		${vo.name }
	</c:forEach>
	<table>
		<tbody>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="content" rows="5" cols="60"></textarea>
				</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="submit" value="저 장">
					<input type="reset" value="취 소">
				</td>
			</tr>
		</tfoot>
	</table>
</body>
</html>