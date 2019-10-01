<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");

	String quiz1=request.getParameter("quiz1");
	String quiz2=request.getParameter("quiz2");
	String quiz3=request.getParameter("quiz3");
	String quiz4=request.getParameter("quiz4");
	String quiz5=request.getParameter("quiz5");
	int score=0;
	
	if(quiz1.equals("2")){
		score=score+1;
	}
	if(quiz2.equals("2")){
		score=score+1;
	}
	if(quiz3.equals("1")){
		score=score+1;
	}
	if(quiz4.equals("1")){
		score=score+1;
	}
	if(quiz5.equals("2")){
		score=score+1;
	}
	
	String name = request.getParameter("name");
	String id = (String) session.getAttribute("id");
	String pw = request.getParameter("pw");
	Boolean success=true;

	Connection conn = null;	
	PreparedStatement pstmt = null;
	
	try{
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "HANGULDAY";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "insert into EVENT2 values(?,?,SYSDATE,'X')";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, score);
		
		pstmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
		success=false;
	}finally{
		if(pstmt!=null){ try{ pstmt.close(); }catch(Exception e){ e.printStackTrace(); } } 
		if(conn!=null){ try{ conn.close(); }catch(Exception e){ e.printStackTrace(); } } 
	}
	
	if(success){
%>
		<meta http-equiv = 'refresh' content = '0;url=main.jsp'>
<%
	}

	
	if(score==5){
		%> <script>alert("5점! 당신을 맞춤법의 왕으로 임명합니다^^ ㅎ ");</script>
		<meta http-equiv = 'refresh' content = '0;url=main.jsp'><%
	} else if(score==4){
		%> <script>alert("4점! 아쉬워요ㅜ 좀 더 노력하면 당신도 맞춤법 왕 ㅎ ㅎ..");</script>
		<meta http-equiv = 'refresh' content = '0;url=main.jsp'><%
	} else if(score==3){
		%> <script>alert("3점! 더 노력 하세요~");</script>
		<meta http-equiv = 'refresh' content = '0;url=main.jsp'><%
	} else if(score==2){
		%> <script>alert("2점! 분발 하세요");</script>
		<meta http-equiv = 'refresh' content = '0;url=main.jsp'><%
	} else if(score==1){
		%> <script>alert("1점! 열심히 공부 하세요~");</script>
		<meta http-equiv = 'refresh' content = '0;url=main.jsp'><%
	} else if(score==0){
		%> <script>alert("빵점! 당신 한국인 맞나여. .. ");</script>
		<meta http-equiv = 'refresh' content = '0;url=main.jsp'><%
	}

	
%>
</body>
</html>