<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="top.jsp" %>
<%@ include file="auth.jsp" %>
<%@ include file="process_student.jsp" %>
<%@ include file="header.jsp" %>
        <h1>Student Home</h1>
        <%
            if(session.getAttribute("student") == null)
                response.sendRedirect("login.jsp");
            
            //Get all unanswered questions by the student
            String studentName = session.getAttribute("student").toString();
            String unansweredQuestionsQuery = "select *"
                                                + "from tbl_question "
                                                + "where id not in "
                                                + "(select question from student_question where student = \""+studentName +"\")";
            
            ResultSet unansweredQuestions = statement.executeQuery(unansweredQuestionsQuery);
            
            int numUnanswereQuestions = 0;
            while(unansweredQuestions.next()){
                numUnanswereQuestions++;
            }
            if(numUnanswereQuestions >0){
                //get a random question
                int randomQuestionIndex = (int)Math.ceil(Math.random()*numUnanswereQuestions);
                unansweredQuestions.absolute(randomQuestionIndex); 
                
        %>
        <form action="student.jsp" name="question_answer" method="post">
            <table>
                <tr>
                    <td>Question</td>
                    <td><%=unansweredQuestions.getString("question")%><input type="hidden" name="id" id="id" value="<%=unansweredQuestions.getInt("id")%>"/></td>
                </tr>
                <%
                    int [] nums= {15,15,15,15};
                    for(int i=0;i<4;)
                    {
                        Random rn = new Random();
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
                                <input type="radio" name="answer" value="<%=unansweredQuestions.getString(nums[i])%>"/><%=unansweredQuestions.getString(nums[i])%>
                            </td>
                        </tr>
                        <%
                    }
                %>
                <tr>
                    <td colspan="2">
                        <img height="300px" width="300px" src="images/<%=unansweredQuestions.getString("image")%>" alt="<%=unansweredQuestions.getString("question")%>"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" name="answered" value="Submit Answer"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <%=message%>
                    </td>
                </tr>
            </table>
        </form>
            <%
            }
            else
            {
            %>
            <h1>No more Questions available for you.</h1>
            <%
            }
            %>
<%@ include file="footer.jsp" %>