<%-- 
    Document   : logout
    Created on : Apr 19, 2014, 7:56:05 PM
    Author     : ZESHAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String student="";
    try{
        student=session.getAttribute("student").toString();
    }catch(Exception ex){}
    if(!student.equals(""))
    {
        session.invalidate();
    }
    response.sendRedirect("login.jsp");
%>