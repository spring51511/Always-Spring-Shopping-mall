<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<jsp:useBean id="user" class="user_.UserDTO" scope="page"/>
<jsp:setProperty property="*" name="user"/>


<c:set var="type" value="${param.manager }" scope="session"/>
<c:set var="login" value="${userDAO.login(user) }" scope="session"/>


<section>
	<h3>${not empty login ? '로그인 성공':'로그인 실패'}</h3>

	<a href="index.jsp"><button class="button">홈으로</button></a>
</section>

<%
	session.removeAttribute("list");
%>


<%@ include file="footer.jsp" %>