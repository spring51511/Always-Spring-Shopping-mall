<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<section>
<h3>회원수정</h3>

<!-- <form method="GET" action="modify_form.jsp"> -->

<!-- <p><input type="number" name="idx" placeholder="IDX" required></p> -->
<!-- <p><input type="submit" value="수정"></p> -->

<!-- </form> -->


<c:set var="dto" value="${userDAO.selectOne(login.userid) }"/>

<form method="POST" action="modify_action.jsp?idx=${dto.idx }">
<p>회원번호　<input type="number" name="idx" value="${dto.idx }" readonly></p>
<p>아이디　　<input type="text" name="userid" value="${dto.userid }"readonly></p>
<p>비밀번호　<input type="password" name="pw" value="${dto.pw }" required></p>
<p>이름　　　<input type="text" name="name" value="${dto.name }"  required></p>
<p>전화번호　<input type="tel" name="phone" value="${dto.phone }"
pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
placeholder="전화번호 010-0000-0000" required></p>
<p>이메일　　<input type="email" name="email" value="${dto.email }"  required></p>
<p>주소　　　<input type="text" name="address" value="${dto.address }" required></p>

<p>　　　　　<input type="submit" value="수정제출"></p>
</form>

</section>

<%@ include file="footer.jsp" %>