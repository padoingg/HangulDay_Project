<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Boolean isLogin = false;
	
	Connection conn = null;	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "HANGULDAY";
		String pass = "1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "SELECT * FROM MEMBER WHERE ID='" + id + "' AND PW='" + pw + "'";
	    
	    pstmt = conn.prepareStatement(sql);
	    rs = pstmt.executeQuery(sql);
	
		while(rs.next()){
			isLogin=true;
		}
		
		if (isLogin) {
				session.setAttribute("id", id);
				session.setAttribute("pw", pw);
				response.sendRedirect("main.jsp");
		} else { 
		%>
		<script>
		alert("로그인 실패");
		history.back();
		</script>
		<%
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e){
				e.getStackTrace();
			}
		} 
%>