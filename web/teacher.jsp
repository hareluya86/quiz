<%@ include file="top.jsp" %>
<%@ include file="auth_teacher.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="process_teacher.jsp" %>
        <h1>Teacher Home</h1>
        <form action="teacher.jsp" name="question_answer" method="post">
            <table>
                <tr>
                    <td>Question</td>
                    <td><input name="question" id="question"/></td>
                </tr>
                <tr>
                    <td>Correct Answer</td>
                    <td><input name="answer_correct" id="answer_correct"/></td>
                </tr>
                <tr>
                    <td>Incorrect Answer</td>
                    <td><input name="answer_wrong1" id="answer_wrong1"/></td>
                </tr>
                <tr>
                    <td>Incorrect Answer</td>
                    <td><input name="answer_wrong2" id="answer_wrong2"/></td>
                </tr>
                <tr>
                    <td>Incorrect Answer</td>
                    <td><input name="answer_wrong3" id="answer_wrong3"/></td>
                </tr>
                <tr>
                    <td>Image</td>
                    <td><input type="file" name="image" id="image"/></td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center;">
                        <input type="submit" name="question_added" value="Submit Question"/>
                    </td>
                </tr>
            </table>
        </form>
<%@ include file="footer.jsp" %>