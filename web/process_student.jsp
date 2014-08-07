<%
    String message="Answer The question Please...!Mr. "+session.getAttribute("student");
    try{
        ResultSet rs22=statement.executeQuery("select total_questions from tbl_users where user_name='"+session.getAttribute("student")+"'");
        if(rs22.next()&&rs22.getInt("total_questions")>=20)
        {
            response.sendRedirect("results.jsp");
        }
        int user_id=Integer.parseInt(request.getParameter("id"));
        String user_answer=request.getParameter("answer");
        if(user_answer.length()>1)
            session.setAttribute("question_count", Integer.parseInt(session.getAttribute("question_count").toString())+1);
        statement.executeUpdate("insert into student_question(question,student) value('"+user_id+"','"+session.getAttribute("student")+"')");
        statement.executeUpdate("update tbl_users set total_questions=total_questions+1 where user_name='"+session.getAttribute("student")+"'");
        ResultSet rs = statement.executeQuery("select * from tbl_question where id='"+user_id+"' and answer_correct='"+user_answer+"'");
        if(rs.next())
        {
            statement.executeUpdate("update tbl_users set score=score+1 where user_name='"+session.getAttribute("student")+"'");
            message="Great Your answer is correct Mr. "+session.getAttribute("student");
        }
        else
        {
            message="Sorry Your Answer is wrong"+session.getAttribute("student");
        }
    }
    catch(Exception ex){}
%>