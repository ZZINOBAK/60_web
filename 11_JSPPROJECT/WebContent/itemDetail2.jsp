<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script>
	function go_cart() {
            location.href = "cart?type=insert";
	} // 이 function 사용 안해도 될듯????
</script>
</head>
<body>
	<h1>상세페이지2test</h1>

	<form action="cart" method="GET">
		<input type="hidden" name="productNum" value="2">
		<input type="hidden" name="id" value="test">
		<input type="hidden" name="productName" value="test2">
		<input type="hidden" name="price" value="2">
		<input type="hidden" name="saleprice" value="2">
		<input type="hidden" name="image" value="test2">
		<p>수량 : <input type="number" name="cCount" value="2"></p>
		<input type="submit" value="장바구니담기">
		<input type="hidden" name="type" value="insert">
	</form>
	
</body>
</html>