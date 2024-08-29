<%@page import="vo.MemberVO"%>
<%@page import="dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDao dao = new MemberDao();
	MemberVO vo = dao.listOne(request.getParameter("userid"));
%>
<jsp:include page="/master/header.jsp"></jsp:include>
<section>
	<h2>회원 목록 수정</h2>
	<form action="updateProc.jsp" name="frm">
		<table>
			<tr>
				<td>회원아이디(수정불가)</td>
				<td><input type="text" name="userid" id="userid" value="<%=vo.getUserid()%>" readonly></td>
			</tr>
			<tr>
				<td>회원성명</td>
				<td><input type="text" name="username" id="username" value="<%=vo.getUsername()%>"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="passwd" id="passwd" value="<%=vo.getPasswd()%>"></td>
			</tr>
			<tr>
				<td>비밀번호 확인</td>
				<td><input type="password" name="passwd2" id="passwd2"></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td>
					<input type="text" name="jumin1" id="jumin1" value="<%=vo.getJumin().substring(0, 6)%>"> - 
					<input type="text" name="jumin2" id="jumin2" value="<%=vo.getJumin().substring(6, 13)%>">
				</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="gender" id="gender1" value="1" <%=vo.getGender().equals("1")?"checked":"" %>>
					<input type="radio" name="gender" id="gender2" value="2" <%=vo.getGender().equals("2")?"checked":"" %>>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<input type="text" name="address" id="address" value="<%= vo.getAddress()%>" size="40">
				</td>
			</tr>
			<tr>
				<td>직업</td>
				<td>
					<select name="jobcd" id="jobcd">
						<option value="0">직업을 선택하세요.</option>
						<option value="1" <%=vo.getJobcd().equals("1")?"selected":"" %>>학생</option>
						<option value="2" <%=vo.getJobcd().equals("2")?"selected":"" %>>회사원</option>
						<option value="3" <%=vo.getJobcd().equals("3")?"selected":"" %>>공무원</option>
						<option value="4" <%=vo.getJobcd().equals("4")?"selected":"" %>>군인</option>
						<option value="5" <%=vo.getJobcd().equals("5")?"selected":"" %>>기타</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>메일수신여부</td>
				<td> 동의함 <input type="checkbox" <%=vo.getMailrcv().equals("Y")?"checked":"" %>></td>
			</tr>
			<tr>
				<td>자기소개</td>
				<td>
					<textarea name="intro" id="intro" rows="4" cols="40"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value=" 수정하기 " onclick="return check()">
					<input type="reset" value=" 초기화 ">
				</td>
			</tr>
		</table>
	</form>
</section>
<script>
	function check() {
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