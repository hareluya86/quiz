<%@ include file="top.jsp" %>
<%@ include file="header.jsp" %>
<%
    String student="";
    String type="";
    try{
        student=session.getAttribute("student").toString();
        type=session.getAttribute("type").toString();
    }catch(Exception ex){}
    if(!student.equals("")&&type.equals("student"))
    {
        response.sendRedirect("student.jsp");
    }
    if(!student.equals("")&&type.equals("teacher"))
    {
        response.sendRedirect("teacher.jsp");
    }
    try{
        String user_name=request.getParameter("user_name");
        String user_password=request.getParameter("user_password");
        ResultSet rs = statement.executeQuery("select * from tbl_users where user_name='"+user_name+"' and user_password='"+user_password+"'");
        if(rs.next())
        {
            session.setAttribute("student", user_name);
            session.setAttribute("type", rs.getString("user_type"));
            session.setAttribute("question_count", 1);
            response.sendRedirect("student.jsp");
        }
        else
        {
        }
    }
    catch(Exception ex){}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form action="login.jsp" name="login_form" id="login_form" method="post">
            <table>
                <tr>
                    <td>
                        Student Name
                    </td>
                    <td>
                        <input type="text" name="user_name" id="user_name" required="required"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        Student Password
                    </td>
                    <td>
                        <input type="password" name="user_password" id="user_password" required="required"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" name="login_submit" id="login_submit"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
