<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<jsp:useBean id="user" class="qna.QnaDTO" />
<jsp:setProperty name="user" property="*"/>

<section>
<h3>${qnaDAO.update(user, param.QnAidx) != 0 ? '수정 성공' : '수정 실패' }</h3>

<a href="qna.jsp"><button>목록 보기</button></a>
</section>

<%@ include file="footer.jsp" %>