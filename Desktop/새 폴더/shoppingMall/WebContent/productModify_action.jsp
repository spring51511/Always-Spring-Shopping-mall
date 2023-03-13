<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<c:set var="dto" value="${FileUtil.getDTO(pageContext.request) }" />

<section>
<h3>${dao.update(dto, param.pidx) != 0 ? '수정 성공' : '수정 실패' }</h3>

<a href="productDetail.jsp?pidx=${param.pidx }"><button>수정한 내용 확인</button></a>
</section>


<%@ include file="footer.jsp" %>