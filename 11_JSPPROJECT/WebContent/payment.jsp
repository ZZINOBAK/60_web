<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제완료</title>
<script>
	function go_main() {
		window.location.href = "index.jsp";
	}
	
	function go_orderList() {
		var form = document.getElementById("paymentForm");
        
		var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "type"; // 이름 설정
        aInput.value = "list"; // 값을 설정

        // 폼에 추가 데이터를 추가
        form.appendChild(aInput);
        
        // 폼을 서버로 제출
        form.submit();
	}

</script>
</head>
<body>
	<button onclick="go_main()">메인페이지로가기</button>

	<h1>구매완료test</h1>
	<form action="orderlist" method="get" id="paymentForm">
		<table>
	        <thead>
	            <tr>
	                <th>장바구니번호</th>
	                <th>제품번호</th>
	                <th>아이디</th>
	                <th>수량</th>
	                <th>상품명</th>
	                <th>가격</th>
	                <th>할인가</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="vo" items="${list}">
	                <tr>
	                    <td>${vo.oNum}
	                    <input type="hidden" name="cNum" value="${vo.oNum}">
	                    </td>
	                    <td>${vo.productNum}</td>
	                    <td>${vo.id}</td>
	                    <td>${vo.cCount}</td>
	                    <td>${vo.productName}</td>
	                    <td>${vo.price}</td>
	                    <td>${vo.saleprice}</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
		<button onclick="go_orderList()">주문내역확인</button>
	</form>
	
</body>
</html>