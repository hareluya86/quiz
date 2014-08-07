<%
    String student="";
    String type="";
    try{
        student=session.getAttribute("student").toString();
        type=session.getAttribute("type").toString();
    }catch(Exception ex){student="";}
    if(student.equals("")||!type.equals("teacher"))
    {
        response.sendRedirect("login.jsp");
    }
%>