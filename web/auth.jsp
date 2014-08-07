<%
    String student="";
    String type="";
    try{
        student=session.getAttribute("student").toString();
        type=session.getAttribute("type").toString();
    }catch(Exception ex){student="";}
    if(student.equals("")||!type.equals("student"))
    {
        response.sendRedirect("login.jsp");
    }
    else if(Integer.parseInt(session.getAttribute("question_count").toString())>20&&type.equals("student"))
    {
        response.sendRedirect("statistics.jsp");
    }
%>