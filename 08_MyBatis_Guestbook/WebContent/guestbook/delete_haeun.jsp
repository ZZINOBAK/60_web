<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제화면</title>
<script>
	function save_go(frm) {
		//alert("save_go(frm) 실행~~ frm : " + frm);
		//비밀번호 확인 후 일치하면 수정 요청 처리
		let pwd1 = frm.pwd.value; //지금 입력한 암호
		let pwd2 = "${guestbookVO.pwd}"; //DB에 저장된 암호(암호 노출됨 - 하지말것)
		alert("pwd1: " + pwd1 + ", pwd2: " + pwd2);
		if (pwd1 !== pwd2) {
			alert("암호불일치. 암호를 확인하세요");
			frm.pwd.value = "";
			frm.pwd.focus();
			return false;
		}
		
		frm.action = "delete_ok.jsp"
		frm.submit();
	}
</script>
</head>
<body>

<div id="contatiner">
	<h2>방명록 : 삭제화면</h2>
	<hr>
	<p><a href="list.jsp">[목록으로 이동]</a></p>
	
	<form method="post">
	<table>
		<tbody>
			<tr>
				<th>비밀번호</th>
				<td>
					<input type="password" name="pwd">
					<input type="button" value="삭 제" onclick="save_go(this.form)">
					<input type="hidden" name="idx" value="${guestbookVO.idx }">
				</td>
			</tr>
		</tbody>
	</table>
	</form>
</div>

</body>
</html>