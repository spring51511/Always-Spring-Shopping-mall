<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<!-- userid       varchar2(255)   primary key, -->
<!--     idx         number          default user_idx.nextval, -->
<!--     pw          varchar2(255)   not null, -->
<!--     name        varchar2(255)   not null, -->
<!--     phone       varchar2(100)   not null, -->
<!--     joindate    Date            default sysdate, -->
<!--     email       varchar2(1000)  not null, -->
<!--     address     varchar2(1000)  not null; -->

<section>
<h3>가입</h3>   
    
<form method="POST" action="join_action.jsp">

<p><input type="text" name="userid" placeholder="userid" required></p>
<p><input type="password" name="pw" placeholder="pw" required></p>
<p><input type="text" name="name" placeholder="name" required></p>
<p><input type="tel" name="phone" 
pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
placeholder="전화번호 010-0000-0000" required></p>
<p><input type="email" name="email" placeholder="email" required></p>
<p><input type="text" name="address" placeholder="address" required></p>
<p><input type="submit" value="제출"></p>

</form>

</section>


<%@ include file="footer.jsp" %>