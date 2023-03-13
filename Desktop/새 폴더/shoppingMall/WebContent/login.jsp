<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!-- 	private int idx; -->
<!-- 	private String userid; -->
<!-- 	private String pw; -->
<!-- 	private String name; -->
<!-- 	private String phone; -->
<!-- 	private Date joindate; -->
<!-- 	private String email; -->
<!-- 	private String address; -->






<section>

<h3>로그인</h3>

<form method="POST" action="login_action.jsp">

<p><input type="text" name="userid"  placeholder="아이디" required></p>
<p><input type="password" name="pw"  placeholder="비밀번호" required></p>
<p><input type="radio" name="manager" value="m">매니저<p>
<p><input type="submit" value="제출"></p>

</form>

</section>




<%@ include file="footer.jsp" %>