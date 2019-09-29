<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
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
		
		String sql = "insert into member values(?,?,?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		pstmt.setString(3, pw);
		
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
		<script>alert("회원 가입이 되었습니다!");</script>
		<meta http-equiv = 'refresh' content = '0;url=login.jsp'>
<%
	}
%>