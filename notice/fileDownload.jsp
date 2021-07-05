<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.File" %>
<%@ page import="file.FileDTO" %>
<%@ page import="file.FileDAO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=sevice-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<Script src="js/bootstrap.js"></Script>
<title>홈페이지</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>

	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="main.jsp">홈페이지</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collaapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인</a></li>
				<li><a href="bbs.jsp">게시판</a></li>
				<li><a href="upload.jsp">업로드</a></li>
				<li class="active"><a href="fileDownload.jsp">다운로드</a></li>
			</ul>
			<%
				if (userID == null) {
			%>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
			<%
				} else {
			%>	
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>			
			<%		
				}
			%>
		</div>
	</nav>
<%
// 	String directory = "C:/JSP/upload/";
// 	String files[] = new File(directory).list();
	
// 	for(String file : files) {
// 		out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file=" + 
// 			java.net.URLEncoder.encode(file, "UTF-8") + "\">" +file + "</a><br>");
// 	}
	ArrayList<FileDTO> fileList = new FileDAO().getList();
	
	for(FileDTO file : fileList) {
		out.println("<a href=\"" + request.getContextPath() + "/downloadAction?file=" +
		java.net.URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">" +
				file.getFileName() + "(다운로드 횟수: " + file.getDownloadCount() + ")</a><br>");
	}

%>
</body>
</html>