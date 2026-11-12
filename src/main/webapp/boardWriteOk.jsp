<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글 저장</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		String bwriter = request.getParameter("bwriter");
		
		String sql = "INSERT INTO board(btitle, bcontent, bwriter, bhit) VALUES(?,?,?)";
		
		//DB 커넥션 준비를 위한 4개의 변수
		//사용하려는 DB의 드라이버이름, DB 서버의 주소(URL), 계정아이디, 계정비번
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/boardtest";//DB이름(스키마 이름)
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		conn = DriverManager.getConnection(url, username, password);
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, btitle);
		pstmt.setString(2, bcontent);
		pstmt.setString(3, bwriter);
		
	%>
</body>
</html>