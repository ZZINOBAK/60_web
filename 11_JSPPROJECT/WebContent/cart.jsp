<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="./css/product.css">

	<style>
		.table {
            width: 100%;
            border-bottom: 1px solid #d3d3d3;
            border-collapse: collapse;
            border-spacing: 0;
        }
        .tr { 
        	border-bottom: 1px solid #d3d3d3 ;
        }
        .th {
            padding: 12px 0;
            border-top: 2px solid #000;
            border-bottom: 1px solid #d3d3d3;
            background: #fff;
            color: #383838;
            font-size: 0.95em;
            text-align: center;
            letter-spacing: -0.1em;
        }
        .td { 
        	text-align: center;
        }
	</style>
<title>장바구니</title>
<script>
	function go_main() {
		window.location.href = "index.jsp";
	}

	function go_login() {
		//location.href = "list.jsp";
		location.href = "login";
	}
	
	function go_before() {
	    window.history.back(); // 이전 페이지로 이동
	}
	
	function go_purchase(newAction) {
		// 폼의 action 속성을 변경하는 함수
	    var form = document.getElementById("cartForm");
	    
	    form.action = newAction;
	    
	    form.submit();
	}
	
	function go_update() {
     // 사용자가 입력한 수정된 값을 가져옵니다.
        var updatedValue = document.getElementById("cCountInput").value;

        // 폼 데이터를 업데이트합니다.
        document.getElementById("cCountInput").value = updatedValue;
        
        var form = document.getElementById("cartForm");

        var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "type"; // 이름 설정
        aInput.value = "update"; // 값을 설정

        form.appendChild(aInput);
        
        form.submit();
	}
	
	function go_delete() {
        // 폼을 가져옴
        var form = document.getElementById("cartForm");
                
        // 추가 데이터를 생성
        var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "type"; // 이름 설정
        aInput.value = "delete"; // 값을 설정

        // 폼에 추가 데이터를 추가
        form.appendChild(aInput);
        
        // 폼을 서버로 제출
        form.submit();

	}
	
	function selectAll() {
	    var checkboxes = document.getElementsByName("selectedItems");
	    var checkAllButton = document.getElementById("checkAllButton");

	    // 모든 체크박스를 선택 또는 선택 해제합니다.
	    for (var i = 0; i < checkboxes.length; i++) {
        checkboxes[i].checked = !checkboxes[i].checked;
    	}
	}
</script>
</head>
<body>
	<button onclick="go_main()">메인페이지로가기</button>

	<button onclick="go_login()">로그인</button>
	<!-- 로그인한 상태면 이게 안떠야하는데... -->
	
		<h1>장바구니</h1>
		<form action="cart" method="get" id="cartForm" >
		    <table class="table">
		        <thead class="th">
		            <tr class="tr">
		                <th>선택</th>
		                <th>상품명</th>
		                <th>상품번호</th>
		                <th>수량</th>
		                <th>가격</th>
		                <th>할인가</th>
		            </tr>
		        </thead>
		        <tbody>
		            <c:forEach var="vo" items="${list}">
		                <tr>
		                    <td class="td">
		                        <input type="checkbox" name="selectedItems" value="${vo.productNum}">
		                        <input type="hidden" name="productNum" value="${vo.productNum}">
		                    </td>
		                    <td class="td">${vo.productName}
		                    <input type="hidden" name="productName" value="${vo.productName}">
		                    </td>
		                    <td class="td">${vo.productNum}</td>
		                    <td class="td">
		                        <input type="number" name="cCount" id="cCountInput" value="${vo.cCount}">
		                        <input type="hidden" name="cNum" value="${vo.cNum}">
		                    </td>
		                    <td class="td">${vo.price}
		                    <input type="hidden" name="price" value="${vo.price}">
		                    </td>
		                    <td class="td">${vo.saleprice}
		                    <input type="hidden" name="saleprice" value="${vo.saleprice}">
		                    </td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
		    <button type="button" onclick="selectAll()">전체 선택</button>
		    <button type="button" onclick="go_before()">계속 쇼핑하기</button>
		    <button type="button" onclick="go_purchase('purchase')">구매하기</button>
		    <button type="button" onclick="go_update()">수량변경</button>
		    <button type="button" onclick="go_delete()">삭제하기</button>
		</form>
</body>
</html>