<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="board.boardDto"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>  
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
    <!-- CSS 파일 연결 -->
    <link rel="stylesheet" href="css/board.css">
<title>Insert title here</title>
</head>
<body>
	<%
		String delNum = request.getParameter("bnum"); //유저가 삭제하려는 글 번호
		
		String sql = "DELETE FROM board WHERE bnum=?"; 
		//유저가 삭제하려고 하는 글 번호 내용 가져오기
		
		String driverName = "com.mysql.jdbc.Driver"; 
		String url = "jdbc:mysql://localhost:3306/boardtest"; //db이름(스키마이름)
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		PreparedStatement pstmt = null;		
						
		try {
			Class.forName(driverName); //jdbc 드라이버 로딩
			conn = DriverManager.getConnection(url, username, password);
			//DB와 jsp 서버간의 connenction(연결통로)가 생성
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, delNum);
			
			int result = pstmt.executeUpdate();
			
			if(result == 1) {
				System.out.println("삭제 성공!");
			} else {
				System.out.println("삭제 실패!");
			}
			
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try{
				if(pstmt != null) {
					pstmt.close();
				}				
				if(conn != null) {
					conn.close();
				}
				
			} catch(Exception e) {
				
			}
		}
	
		response.sendRedirect("boardList.jsp");
			
	%>
</body>
</html>