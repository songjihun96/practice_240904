<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/master/header.jsp"></jsp:include>
<section>
	<h2>회원 가입</h2>
	<form action="inputProc.jsp" name="frm">
		<table>
			<tr>
				<td>회원아이디(5자이상~15자이하)</td>
				<td><input type="text" name="userid" id="userid"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username" id="username"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" id="passwd"></td>
			</tr>
			<tr>
				<td>비밀번호확인</td>
				<td><input type="password" name="passwd2" id="passwd2"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" id="jumin1" size="6"> - 
					<input type="text" name="jumin2" id="jumin2" size="7">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" id="gender1" value="1"> 남
					<input type="radio" name="gender" id="gender2" value="2"> 여
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="address" size="40" id="address">
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="jobcd" id="jobcd">
						<option value="0">직업을 선택하세요.</option>
						<option value="1">학생</option>
						<option value="2">회사원</option>
						<option value="3">공무원</option>
						<option value="4">군인</option>
						<option value="5">기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>메일수신여부</td>
				<td>
					동의함 <input type="checkbox" name="mailrcv" id="mailrcv" value="Y">
				</td>
			</tr>
			<tr>
				<td>자기소개</td>
				<td>
					<textarea rows="4" cols="40" name="intro" id="intro"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value=" 가 입 " onclick="return check()">
					<input type="reset" value=" 다시입력 ">
				</td>
			</tr>
		</table>
	</form>
</section>
<script>
	function check() {
		if(document.querySelector("#userid").value.trim().length < 5 || document.querySelector("#userid").value.trim().length > 15){
			alert("아이디를 입력하세요.(5~15자)");
			document.querySelector("#userid").value="";
			document.querySelector("#userid").focus();
			return false;
		}
		if(document.querySelector("#username").value.trim().length == 0){
			alert("이름을 입력하세요.");
			document.querySelector("#username").value="";
			document.querySelector("#username").focus();
			return false;
		}
		if(document.querySelector("#passwd").value.trim().length < 4){
			alert("비밀번호를 입력하세요.(4자 이상)");
			document.querySelector("#passwd").value="";
			document.querySelector("#passwd").focus();
			return false;
		}
		if(document.querySelector("#passwd2").value.trim() != document.querySelector("#passwd").value.trim()){
			alert("비밀번호가 맞지 않습니다. 비밀번호 확인을 다시 입력하세요.");
			document.querySelector("#passwd2").value="";
			document.querySelector("#passwd2").focus();
			return false;
		}
		if(document.querySelector("#jumin1").value.trim().length != 6){
			alert("주민번호를 바르게 입력하세요.");
			document.querySelector("#jumin1").value="";
			document.querySelector("#jumin1").focus();
			return false;
		}
		if(document.querySelector("#jumin2").value.trim().length != 7){
			alert("주민번호를 바르게 입력하세요.");
			document.querySelector("#jumin2").value="";
			document.querySelector("#jumin2").focus();
			return false;
		}
		if(document.querySelector("#gender1").checked == false && document.querySelector("#gender2").checked == false){
			alert("성별을 선택하세요.");
			return false;
		}
		if(document.querySelector("#address").value.trim() == ""){
			alert("주소를 입력하세요.");
			document.querySelector("#address").value="";
			document.querySelector("#address").focus();
			return false;
		}
		if(document.querySelector("#jobcd").value == "0"){
			alert("직업을 선택하세요.");
			document.querySelector("#jobcd").focus();
			return false;
		}
		if(document.querySelector("#intro").value.trim() == ""){
			alert("자기소개를 입력하세요.");
			document.querySelector("#address").focus();
			return false;
		}
		return true;
	}
</script>
<jsp:include page="/master/footer.jsp"></jsp:include>