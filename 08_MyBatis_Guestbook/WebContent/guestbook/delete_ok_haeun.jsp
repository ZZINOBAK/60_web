<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 사용해서 DB데이터 삭제(DELETE) 후 화면전환 
	비교값 : 전달받은 pwd 파라미터 값과 session에 저장된 guestbookVO pwd 값 비교
	- 일치하면 : DB 삭제 후 목록페이지로 이동
	- 불일치면 : 이전페이지(삭제화면) 이동 - 암호 재입력 할 수 있도록
	삭제성공 : 전체목록 페이지로 이동
	예외발생 : 예외메시지 표시 후 이전화면(삭제페이지) 또는 상세페이지로 이동
--%>
<%
	//0. 한글처리
	request.setCharacterEncoding("UTF-8");
	
	//1. 파라미터 값 확인(추출) - VO에 저장
%>
	<jsp:useBean id="guestbookVO" class="com.mystudy.mybatis.GuestbookVO" />
	<jsp:setProperty property="*" name="guestbookVO"/>
<%
	System.out.println("> delete_ok.jsp vo : " + guestbookVO);

	//2. DB 데이터 수정처리(SqlSession 객체 사용 DB UPDATE)
	SqlSession ss = DBService.getFactory().openSession(true);
	
		try {
			int result = ss.delete("guestbook.delete", guestbookVO);
			//3. 페이지 전환 : 입력 성공시 페이지 이동(전환)
			System.out.println("result : " + result);
%>
		<script>
			alert("정상 입력되었습니다\n목록페이지로 이동합니다");
			location.href = "list.jsp";
		</script>
<%		
		} catch (Exception e) {
			//3. 페이지 전환 : 입력 성공시 페이지 이동(전환)
			System.out.println(">> [예외발생] 입력실패");
			e.printStackTrace();
%>
		<script>
			alert("[예외발생] 입력작업중 오류발생\n"
					+ "담당자(8282)에게 연락하세요\n"
					+ "이전페이지로 이동합니다");
			history.back();
		</script>
<%		
		} finally {
			ss.close();
		}
%>		
