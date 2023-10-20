<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>주문내역</title>
<script>
	function go_main() {
		window.location.href = "index.jsp";
	}

	function go_delete(oNum) {
        // 폼을 가져옴
        var form = document.getElementById("cartForm");
                
        // 추가 데이터를 생성
        var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "type"; // 이름 설정
        aInput.value = "delete"; // 값을 설정

        var oNumInput = document.createElement("input");
        oNumInput.type = "hidden";
        oNumInput.name = "oNum";
        oNumInput.value = oNum; // oNum 값을 설정

        // 폼에 추가 데이터를 추가
        form.appendChild(aInput);
        
        form.appendChild(oNumInput);

        // 폼을 서버로 제출
        form.submit();

	}
	
</script>
</head>
<body>
	<button onclick="go_main()">메인페이지로가기</button>
	<h1>주문내역</h1>
	<p>나중에 비회원인지 회원이면 로그인하는그런 창 만들어야함</p>
	<form action="orderlist" method="get" id="cartForm" >
	    <table>
	        <thead>
	            <tr>
	                <th>주문번호</th>
	                <th>아이디</th>
	                <th>상품명</th>
	                <th>수량</th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="vo" items="${list}">
	                <tr>
	                    <td>${vo.oNum}</td>
	                    <td>${vo.id}</td>
	                    <td>${vo.productName}</td>
	                    <td>${vo.cCount}</td>
	                    <td>
	                        <button onclick="go_delete('${vo.oNum}')">주문취소</button>
                    	</td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</form>
	
</body>
</html>