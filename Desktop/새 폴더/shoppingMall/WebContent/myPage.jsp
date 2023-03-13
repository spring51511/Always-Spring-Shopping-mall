<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<script>
	const mypagecheck = ${empty login}
	
	if(mypagecheck){
	   alert('먼저 로그인 후 이용 가능한 기능입니다.')
	   location.href = '${cpath}/login.jsp'
	            
	}
   
</script>

<section>
<h3>My page</h3>

<p><input type="text" name="id" value="${login.userid }" readonly></p>
<p><input type="number" name="idx" value="${login.idx }"  readonly></p>
<p><input type="password" name="pw" value="${login.pw }"  readonly></p>
<p><input type="text" name="name" value="${login.name }"  readonly></p>
<p><input type="tel" name="phone" value="${login.phone }"
pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"
placeholder="전화번호 010-0000-0000" readonly></p>
<p><input type="email" name="email" value="${login.email }" placeholder="email" readonly></p>
<p><input type="text" name="address" value="${login.address }" placeholder="addrsss" readonly></p>

<a href="${cpath }/modify.jsp"><button>수정</button></a>
<a href="${cpath }/delete_action.jsp?idx=${login.idx }"><button>탈퇴</button></a>
<a href="${cpath }/orderOne.jsp?userid=${login.userid }"><button>주문 내역</button></a>

</section>


<%@ include file="footer.jsp" %>