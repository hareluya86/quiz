<%
    Class.forName("com.mysql.jdbc.Driver");
    //Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/online_quiz?"+"user=root&password=apple123");
    //VL 20140807
    Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/online_quiz?"+"user=online_quiz&password=apple123");
    //VL 20140807
    Statement statement = conn.createStatement();
%>
<%@page import="com.sun.org.apache.regexp.internal.REDebugCompiler"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>