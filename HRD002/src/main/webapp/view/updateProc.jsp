<%@page import="dao.MemberDao"%>
<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userid = request.getParameter("userid");
	String username = request.getParameter("username");
	String passwd = request.getParameter("passwd");
	String jumin = request.getParameter("jumin1") + request.getParameter("jumin2");
	String gender = request.getParameter("gender");
	String address = request.getParameter("address");
	String jobcd = request.getParameter("jobcd");
	String mailrcv = null;
	if(request.getParameter("mailrcv") != null){
		mailrcv = "Y";
	}else{
		mailrcv = "N";
	}
	String intro = request.getParameter("intro");
	
	MemberVO vo = new MemberVO();
	vo.setUserid(userid);
	vo.setUsername(username);
	vo.setPasswd(passwd);
	vo.setJumin(jumin);
	vo.setGender(gender);
	vo.setAddress(address);
	vo.setJobcd(jobcd);
	vo.setMailrcv(mailrcv);
	vo.setIntro(intro);
	
	MemberDao dao = new MemberDao();
	int n = dao.update(vo);
	
	if(n > 0){
		%>
		<script>
			alert("수정 완료");
			location.href="/view/list.jsp";
		</script>
		<%
	}else{
		%>
		<script>
			alert("수정불가");
			history.back();
		</script>
		<% 
	}
%>