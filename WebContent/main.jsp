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
</style>
<body class="is-preload">
<%
	if(session.getAttribute("id") == null) {
%>
<input type="button" id="login" value="로그인" onclick="location.href='login.jsp'">
<% } else {
%>
	<form method="post" action="logout.jsp">
	<input type="submit" id="logout" value="로그아웃">
	</form>
<% } %>
<section id="header">
				<header class="major">
					<h1>아름다운 우리 말, 한글</h1>
					<p>10월 2일부터 10월 9일까지</p>
				</header>
				<div class="container">
					<ul class="actions special">
						<li><a href="#one" class="button primary scrolly">이벤트 안내</a></li>
					</ul>
				</div>
			</section>

		<!-- One -->
			<section id="one" class="main special">
				<div class="container">
					<span class="image fit primary"><img src="images/pic01.jpg" alt="" /></span>
					<div class="content">
						<header class="major">
							<h2>이벤트, 하나</h2>
						</header>
						<img id="hg2" src="images/hg2.jpg" alt="" width="300px" height="200"/><br>
						<p>
						[ㄱ, ㄷ, ㅁ, ㅇ, ㅈ, ㅎ]<br>
						주어진 초성으로 자신만의 문장을 완성시켜주세요.<br>
						예) 멋진 한글들, 만두가 좋아 ... (글자수, 중복 제한 없음)<br>
						이벤트에 참여하신 분들 중 3분을 선정하여 선물을 드립니다.
						</p>
						<br>
						<form method="post" action="event.jsp">
				
						
											<%
						request.setCharacterEncoding("utf-8");
					
						Connection conn = null;	
						PreparedStatement pstmt = null;
						
						String id = (String) session.getAttribute("id");
						String name = (String) session.getAttribute("name");
						
						String url = "jdbc:oracle:thin:@localhost:1521:xe";
						String user = "HANGULDAY";
						String pass = "1234";
						
						String sql = "SELECT * FROM MEMBER WHERE id='"+id+"'";
						
						
						
						try{
							Class.forName("oracle.jdbc.driver.OracleDriver");
							conn = DriverManager.getConnection(url, user, pass);
					
							Statement st = conn.createStatement();
						    st.executeUpdate(sql);
						    ResultSet rs = st.executeQuery(sql);
						    
						    if(rs.next()){
						    	%>	
							이름: <input type="text" id="name" name="name" value="<%= rs.getString("name")%>" readonly="readonly"><br><br>
							내용: <input type="text" id="content" name="content"><br><br>
							전화번호: <input type="text" id="phone" name="phone"><br><br>
							<input type="submit" value="참여"><br><br>
							<input type="button" id="winning" value="당첨확인" onclick="location.href='winningCheck.jsp'">
								  <%
						    } else {
						    	%>
						    	이름: <input type="text" id="name" name="name"><br><br>
						    	내용: <input type="text" id="content" name="content"><br><br>
							전화번호: <input type="text" id="phone" name="phone"><br><br>
							<input type="button" value="참여" onclick="nono()"><br><br>
						    	<%
						    }
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
						</form>
					</div>
				</div>
			</section>
			
			<!-- Two -->
			<section id="two" class="main special">
				<div class="container">
					<span class="image fit primary"><img src="images/pic01.jpg" alt="" /></span>
					<div class="content">
						<header class="major">
							<h2>이벤트, 둘</h2>
						</header>
						<p>
						알쏭달쏭 헷갈리는 맞춤법 퀴즈<br>
						다음 문장의 단어 중 표준어를 선택해 문장을 완성해주세요.<br>
						많이 맞추신 분들께 추첨을 통해 선물을 드립니다.<br>
						</p>
						<br>
						<form action="quiz.jsp" method="post">
					        <p>Q1. 이번 프로젝트의 팀장
					        <select name="quiz1"> 
								<option value="1">으로써</option>
		    					<option value="2">으로서</option>
		    				</select>
		    				책임감이 막중하다.
		    				</p>
					        <p>
					        Q2. 아픈건 다
					        <select name="quiz2"> 
								<option value="1">낳았어</option>
		    					<option value="2">나았어</option>
		    				</select>
		    				?
					        </p>
					        <p>
					        Q3. 놀러 갈 생각을 하니 
					        <select name="quiz3"> 
								<option value="1">왠지</option>
		    					<option value="2">웬지</option>
		    				</select>
		    				가슴이 두근거린다.
					        </p>
					        <p>
					        Q4. 자꾸 내 발
					        <select name="quiz4"> 
								<option value="1">건드리지</option>
		    					<option value="2">건들이지 </option>
		    				</select>
		    				마라.
					        </p>
					        <p>
					        Q5. 수줍은 미소만 
					        <select name="quiz5"> 
								<option value="1">띄고</option>
		    					<option value="2">띠고 </option>
		    				</select>
		    				있었다.
					        </p>
					        <%
					        String sql2 = "SELECT * FROM MEMBER WHERE id='"+id+"'";
		
							try{
								Class.forName("oracle.jdbc.driver.OracleDriver");
								conn = DriverManager.getConnection(url, user, pass);
						
								Statement st2 = conn.createStatement();
							    st2.executeUpdate(sql2);
							    ResultSet rs2 = st2.executeQuery(sql2);
							    
							    while(rs2.next()){
					        %>
					        <input type="hidden" name="name" value="<%=rs2.getString("name")%>" readonly="readonly">
					        <%
							    }
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
					        <input type="submit" value="완료">
					      </form>
					</div>
				</div>
			</section>
			
			
			
			
			<script>
			function nono(){
				alert("로그인이 필요합니다.");
			}
			</script>
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