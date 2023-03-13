<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<!-- <style> -->

<!-- 	section { -->
<!-- 		width: 500px; -->
<!-- 		margin: 30px auto; -->
<!-- 		text-align: center; -->
<!-- 		margin: auto; -->
<!-- 		border: 2px solid pink; -->
<!-- 		border-collapse: collapse; -->
<!-- 		color: gray; -->
<!-- 		margin-top: 30px; -->
<!-- 	} -->
	
<!-- 	button{ -->
<!-- 		margin-bottom: 20px; -->
<!-- 	} -->
<!-- </style> -->




<jsp:useBean id="user" class="user_.UserDTO"/>
<jsp:setProperty property="*" name="user"/>

<c:set var="flag" value="${userDAO.modify(user, param.idx) }" />

<c:set var="login" value="${userDAO.login(user) }" scope="session" />

<section>

<h3>${flag != 0 ? '수정성공' : '수정실패' }</h3>
 
<a href="myPage.jsp"><button>마이페이지</button></a>
</section>

<%@ include file="footer.jsp" %>