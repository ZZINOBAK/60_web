<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--(실습) 전달받은 데이터를 DB에 입력처리 
	정상입력 : list.jsp 페이지로 이동(입력건수 0보다 크면 list.jsp 재요청처리)
	예외발생 : 현재페이지에 오류메시지 보여주기
--%>
<%
	//1. 파라미터 값 추출(sabun, name, pay)
	int sabun = Integer.parseInt(request.getParameter("sabun"));
	if (sabun > 0) {
		session.setAttribute("sabun", sabun);
	}
	
	String name = request.getParameter("name");
	if (name != null) {
		session.setAttribute("name", name);
	}
	
	String pay = request.getParameter("pay");
	if (pay != null) {
		session.setAttribute("pay", pay);
	}
	
	System.out.println(sabun);
	System.out.println(name);
	System.out.println(pay);
	
	final String DRIVER = "oracle.jdbc.OracleDriver";
	final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "mystudy";
	final String PASSWORD = "mystudypw";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;	
	
	int result = 0;
	try {
		//1. JDBC 드라이버 로딩
		Class.forName(DRIVER);
		
		//2. DB연결 - Connection 객체 생성 <- DriverManager
		conn = DriverManager.getConnection(URL, USER, PASSWORD);
		
		String sql = "INSERT INTO EMPLOYEE (sabun, NAME, REGDATE, pay) VALUES (?, ?, sysdate, ?)";
		//3. Statement 문 실행(SQL 문 실행)
		pstmt = conn.prepareStatement(sql);
		
		//4. SQL 실행 결과에 대한 처리
		//4-1. SQL문 실행
		
		//4-2. SQL 실행결과에 대한 처리
		int i = 1;
		pstmt.setInt(i++, sabun);
		pstmt.setString(i++, name);
		pstmt.setString(i++, pay);
		
		result = pstmt.executeUpdate();
	} catch(Exception e) {
		e.printStackTrace();
		System.out.println("[예외발생] 작업중 예외가 발생 : " + e.getMessage());
		result = -1;
	} finally {
		//5. 클로징 처리에 의한 자원 반납
		try {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch(Exception e) {}
	}
	System.out.println(result);
	//2. DB 입력작업
	
	//3. 화면전환
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
</head>
<body>
	<%
	if (result > 0) {
		out.print(name + "님 사원 등록 완료");
		response.sendRedirect("list.jsp");
	} else {
		out.println(name + "님 사원 등록 실패");
		out.println("담당자(8282)에게 연락하세요");
	}
%>	
	
	<a href="addForm.jsp">입력페이지로 이동</a>
	<a href="list.jsp">전체목록 보기</a>
</body>
</html>