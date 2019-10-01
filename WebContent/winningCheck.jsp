<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*"%>
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
</style>
<%
	request.setCharacterEncoding("utf-8");

	//String name = request.getParameter("name");
	String id = (String) session.getAttribute("id");
	String content = request.getParameter("content");
	String phone = request.getParameter("phone");
	Boolean success=true;

	Connection conn = null;	
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "HANGULDAY";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "SELECT * FROM EVENT, MEMBER WHERE EVENT.NAME=MEMBER.NAME AND ID='"+id+"'";
		
		Statement st = conn.createStatement();
	    st.executeUpdate(sql);
	    ResultSet rs = st.executeQuery(sql);
		%>
<body class="is-preload">
		<!-- One -->
			<section id="one" class="main special">
				<div class="container">
					<span class="image fit primary"><img src="images/pic01.jpg" alt="" /></span>
					<div class="content">
					<p><%
					if(rs.next()){
			String winning = rs.getString(5);
			if(winning.equals("O")){
				%>
				<img id="win" src="images/win.jpg" alt="" width="300px" height="300px"/><br>
				<h3>이벤트에 당첨되셨습니다!</h3>
				<p>빠른 시일 내에 개인 연락처로 연락 드려<br>선물을 보내드리도록 하겠습니다~</p>
				<%
				//out.print("이벤트에 당첨되셨습니다!");
			} else if(winning.equals("X")){
				%>
				<img id="lose" src="images/lose.png" alt="" width="300px" height="300px"/><br>
				<h3>이벤트에 당첨되지 않았습니다.</h3>
				<p>다음 기회에 도전해봐요~</p>
				<%
				//out.print("이벤트에 당첨되지 않으셨습니다ㅜㅜ");
			}
		} else {
			%>
			<script>alert("이벤트에 참여하세요.");</script>
			<meta http-equiv = 'refresh' content = '0;url=main.jsp'>
			<%
		}
 		
		%>
					</p>
					</div>
				</div>
			</section><%
			}catch(Exception e){
		e.printStackTrace();
		success=false;
	}finally{
		if(pstmt!=null){ try{ pstmt.close(); }catch(Exception e){ e.printStackTrace(); } } 
		if(conn!=null){ try{ conn.close(); }catch(Exception e){ e.printStackTrace(); } } 
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