<%@page import="vo.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String choice = (String)request.getAttribute("choice");
	String find = (String)request.getAttribute("find");
	String search = (String)request.getAttribute("search");
	ArrayList<MemberVO> list = (ArrayList<MemberVO>)request.getAttribute("list");
%>
<jsp:include page="/master/header.jsp"></jsp:include>
<section>
	<h2>회원검색</h2>
	<table>
		<tr>
		<td colspan="5">
			<form action="searchProc.jsp" name="frm" method="post">
				검색조건 : <select name="choice" id="choice">
					<option value="userid" <%= choice != null && choice.equals("userid") ? "selected":"" %> >회원ID</option>
					<option value="username" <%= choice != null && choice.equals("username") ? "selected":"" %> >회원이름</option>
				</select>
				<input type="text" name="find" id="find" value='<%= find != null ? find : "" %>'>
				<input type="submit" value=" 검 색 " onclick="return check()">
			</form>
		</td>
		</tr>
		<tr style="background-color: beige;">
			<td>회원ID</td>
			<td>회원명</td>
			<td>생년월일</td>
			<td>성별</td>
			<td>직업</td>
		</tr>
		<%
			if(list != null){
				if(request.getAttribute("search").equals("no")){
					out.print("<tr><td colspan='5'>검색된 데이터가 없습니다.</td></tr>");
				}
				else{
					for(MemberVO vo : list){
						%>
							<tr>
								<td><%=vo.getUserid() %></td>
								<td><%=vo.getUsername() %></td>
								<td><%=vo.getJumin() %></td>
								<td><%=vo.getGender() %></td>
								<td><%=vo.getJobcd() %></td>
							</tr>
						<%
					}
				}
			}
		%>
	</table>
</section>
<script>
	function check() {
		if(document.querySelector("#find").value.trim() == ""){
			alert("검색 조건을 입력하시오. ");
			document.querySelector("#find").focus();
			return false;
		}
		return true;
	}
</script>
<jsp:include page="/master/footer.jsp"></jsp:include>