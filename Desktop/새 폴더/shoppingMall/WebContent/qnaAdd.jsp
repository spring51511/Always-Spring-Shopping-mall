<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<div class=join>
	<h3>QNA 작성</h3>

<form action="qnaAdd_action.jsp" Method="POST">
	<table>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="userid" placeholder="${login.userid == null ? '비회원' : login.userid }" value="${login.userid }" readonly></td>
		</tr>
		<tr>
			<th>게시글 제목</th>
			<td><input type="text" name="subject" placeholder="제목을 입력하세요"></td>
		</tr>
		
		<tr>
			<th>게시글 내용</th>
			<td><textarea rows="30" cols="50" name="content" placeholder="내용을 작성하세요"></textarea></td>
		</tr>
	</table>
	
	<div class="update">
	<p><input type="submit" value="등록"></p>
	</div>
</form>
</div>




<%@ include file="footer.jsp" %>