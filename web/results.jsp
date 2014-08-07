<%@ include file="top.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="header.jsp" %>
        <h1>Student Home</h1>
        <%
            ResultSet resultset = statement.executeQuery("select * from tbl_question where id in (select question from student_question where student='"+session.getAttribute("student")+"')");
            int q_no=1;
        %>
        <h1>Your Results <%=session.getAttribute("student")%></h1>
        <h2>Question That You Answered</h2>
            <table>
                <tr>
                    <td>Question #</td>
                    <td>Question</td>
                    <td>Answer</td>
                </tr>
                <%
                if(resultset.next()) {
                %>
                <tr>
                    <td>Question <%=q_no%></td>
                    <td><%=resultset.getString("question")%></td>
                    <td><%=resultset.getString("answer_correct")%></td>
                </tr>
                <%
                }
                %>
            </table>
            <%
            ResultSet resultset1 = statement.executeQuery("select * from tbl_users where user_name='"+session.getAttribute("student")+"'");
            if(resultset1.next())
            {
            %>
            <h2>Result</h2>
            <table>
                <tr>
                    <td>Answered</td>
                    <td>Correct</td>
                    <td>Incorrect</td>
                    <td>Marks</td>
                    <td>Status</td>
                </tr>
                <%
                int questions=1,score=1;
                questions=resultset1.getInt("total_questions");
                score=resultset1.getInt("score");
                try{
                %>
                <tr>
                    <td><%=questions%></td>
                    <td><%=score%></td>
                    <td><%=(questions-score)%></td>
                    <td><%=((score/questions)*100)%></td>
                    <td><%
                        if(((score/questions)*100)>=50)
                        {
                        %>
                        Pass
                        <%
                        }
                        else
                        {
                        %>
                        Fail
                        <%
                        }
                    %></td>
                </tr>
                <%
                }
                catch(Exception exp){}
                %>
            </table>
            <%
            }
            %>
<%@ include file="footer.jsp" %>