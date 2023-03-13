<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<jsp:useBean id="user" class="qna.QnaDTO" />
<jsp:setProperty name="user" property="*"/>

<section>
<h3>${qnaDAO.insert(user) != 0 ? '추가 성공' : '추가 실패' }</h3>


<%-- <h3>dto.uploadFile : ${dto.uploadFile }</h3> --%>



<a href="qna.jsp"><button>목록으로</button></a>
</section>


<%@ include file="footer.jsp" %>