<%@ include file="top.jsp" %>
<%
    String student="";
    try{
        student=session.getAttribute("student").toString();
    }catch(Exception ex){}
    if(student.equals(""))
    {
        response.sendRedirect("login.jsp");
    }
    else 
    {
        response.sendRedirect("login.jsp");
    }
    String message="Answer The question Please...!Mr. "+session.getAttribute("student");
    try{
        int user_id=Integer.parseInt(request.getParameter("id"));
        String user_answer=request.getParameter("answer");
        session.setAttribute("question_count", Integer.parseInt(session.getAttribute("question_count").toString())+1);
        ResultSet rs = statement.executeQuery("select * from tbl_question where id='"+user_id+"' and answer_correct='"+user_answer+"'");
        if(rs.next())
        {
            message="Great Your answer is correct Mr. "+session.getAttribute("student");
        }
        else
        {
            message="Sorry Your Answer is wrong"+session.getAttribute("student");
        }
    }
    catch(Exception ex){}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Quiz</title>
    </head>
    <body>
        <h1><%=message%></h1>
        <p><a href="logout.jsp">Logout</a></p>
        <%
            Random rn=new Random();
            int id = rn.nextInt(200)+1;//request.getParameter("id");
            id=1;
            ResultSet resultset = statement.executeQuery("select * from tbl_question where id='"+id+"'");
            if(resultset.next()) {
        %>
        <form action="index.jsp" name="question_answer" method="post">
            <table>
                <tr>
                    <td>Question # <%=session.getAttribute("question_count")%></td>
                    <td><%=resultset.getString("question")%><input type="hidden" name="id" id="id" value="<%=resultset.getInt("id")%>"/></td>
                </tr>
                <%
                    int [] nums= {15,15,15,15};
                    for(int i=0;i<4;)
                    {
                        int x=(rn.nextInt()%4)+3;
                        boolean b=true;
                        for(int j=0;j<=i;j++)
                        {
                            if(nums[j]==x||x<3)
                                b=false;
                        }
                        if(b)
                            nums[i++]=x;
                    }
                    for(int i=0;i<4;i++)
                    {
                        %>
                        <tr>
                            <td colspan="2">
                                <input type="radio" name="answer" value="<%=resultset.getString(nums[i])%>"/><%=resultset.getString(nums[i])%>
                            </td>
                        </tr>
                        <%
                    }
            }
                %>
                <tr>
                    <td colspan="2">
                        <img height="300px" width="300px" src="images/<%=resultset.getString("image")%>" alt="<%=resultset.getString("question")%>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" name="answered" value="Submit Answer"/>
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>
