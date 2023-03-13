<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:set var="dto" value="${FileUtil.getDTO(pageContext.request) }" />

<section>
<h3>${dao.insert(dto) != 0 ? '추가 성공' : '추가 실패' }</h3>



<%-- <h3>dto.uploadFile : ${dto.uploadFile }</h3> --%>

<a href="productList.jsp"><button>목록 보기</button></a>
</section>




<%@ include file="footer.jsp" %>