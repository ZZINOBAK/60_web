<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script>
	function go_login() {
		//location.href = "list.jsp";
		location.href = "login";
	}

	function go_cart() {
		location.href = "cart?type=list";
	}
	
	function go_itemdetail1() {
		location.href = "itemdetail1";
	}
	
	function go_itemdetail2() {
		location.href = "itemdetail2";
	}
	
	function go_orderlist() {
		location.href = "orderlist?type=list";
	}

</script>
</head>
<body>
	<button onclick="go_orderlist()">주문내역</button>
	<button onclick="go_cart()">장바구니</button>
	<button onclick="go_login()">로그인</button>
	<!-- 로그인한 상태면 이게 안떠야하는데... -->
	<button onclick="go_signin()">회원가입</button>
	
	<h1>메인페이지 [ index.jsp ]</h1>
	

	<button onclick="go_itemdetail1()">상세페이지1</button>
	<button onclick="go_itemdetail2()">상세페이지2</button>
</body>
</html>