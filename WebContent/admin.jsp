<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="assets/css/main.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
<style>
#hg2{
	margin: 50px;
}
#login{
	border: none;
	box-shadow: none;
	color: #ffffff !important;
	margin: 0px;
}
#logout{
	border: none;
	box-shadow: none;
	color: #ffffff !important;
	margin: 0px;
}
#winnig{
	font-size: 6px;
}
</style>
<body class="is-preload">
	<form method="post" action="logout.jsp">
	<input type="submit" id="logout" value="로그아웃" onclick="location.href='main.jsp'">
	</form>
<section id="header">
				<header class="major">
					<h1>한글날 이벤트</h1>
					<p>10월 2일부터 10월 9일까지</p>
				</header>
				<div class="container">
					<ul class="actions special">
						<li><a href="#one" class="button primary scrolly">관리자 페이지</a></li>
					</ul>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="main special">
				<div class="container">
					<span class="image fit primary"><img src="images/pic02.jpg" alt="" /></span>
					<div class="content">
						<header class="major">
							<h2>이벤트 하나</h2>
						</header>
						<%
						request.setCharacterEncoding("utf-8");
					
						Connection conn = null;	
						PreparedStatement pstmt = null;
						
						String id = (String) session.getAttribute("id");
						
						String url = "jdbc:oracle:thin:@localhost:1521:xe";
						String user = "HANGULDAY";
						String pass = "1234";
						
						String sql = "SELECT * FROM EVENT";
						
						try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							conn = DriverManager.getConnection(url, user, pass);
					
							Statement st = conn.createStatement();
						    st.executeUpdate(sql);
						    ResultSet rs = st.executeQuery(sql);
						    %>
						    <table align="center" width="100%" cellpadding="0" cellspacing="0" border="0">
						    	<tr>
						    		<td>이름</td>
						    		<td>내용</td>
						    		<td width="80px">참여일</td>
						    		<td width="60px">당첨여부</td>			    
						    		<td width="80px">선택</td>		
						    	</tr>
								<tr height="30" align="center" ></tr>
						    <%
						    while(rs.next()){
						    	out.print("<tr>");
						    	out.print("<td>"+rs.getString(1)+"</td>");
						    	out.print("<td>"+rs.getString(3)+"</td>");
						    	out.print("<td>"+rs.getString(4)+"</td>");
						    	out.print("<td>"+rs.getString(5)+"</td>");
						    	String name = rs.getString(1);
						    	String content = rs.getString(3);
						    	%>
						    	<td width="80px"><input type="button" id="winning" value="당첨" onclick="location.href='winning.jsp?name=<%=name%>&content=<%=content%>'"></td>
						    	<%
						    	out.print("</tr>");
						    }
						    %></table><%
						}catch(Exception e){
							e.getStackTrace();
						}finally{
							try{
								if(pstmt != null)
									pstmt.close();
								if(conn != null)
									conn.close();
							}catch(Exception e){
								e.getStackTrace();
							}
						}
						
					%>
					</div>
				</div>
			</section>
			
			<!-- One -->
			<section id="two" class="main special">
				<div class="container">
					<span class="image fit primary"><img src="images/pic02.jpg" alt="" /></span>
					<div class="content">
						<header class="major">
							<h2>이벤트 둘</h2>
						</header>
			<%
			try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							conn = DriverManager.getConnection(url, user, pass);
							
							String sql2 = "SELECT * FROM EVENT2";
					
							Statement st2 = conn.createStatement();
						    st2.executeUpdate(sql2);
						    ResultSet rs2 = st2.executeQuery(sql2);
						    %>
						    <table align="center" width="100%" cellpadding="0" cellspacing="0" border="0">
						    	<tr>
						    		<td>이름</td>
						    		<td>점수</td>
						    		<td width="80px">참여일</td>		
						    	</tr>
								<tr height="30" align="center" ></tr>
						    <%
						    while(rs2.next()){
						    	out.print("<tr>");
						    	out.print("<td>"+rs2.getString(1)+"</td>");
						    	out.print("<td>"+rs2.getString(2)+"점</td>");
						    	out.print("<td>"+rs2.getString(3)+"</td>");
						    	String name = rs2.getString(1);
						    	String score = rs2.getString(2);
						    	out.print("</tr>");
						    }
						    %></table><%
						}catch(Exception e){
							e.getStackTrace();
						}finally{
							try{
								if(pstmt != null)
									pstmt.close();
								if(conn != null)
									conn.close();
							}catch(Exception e){
								e.getStackTrace();
							}
						}
						
					%>
			
		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
</body>
</html>