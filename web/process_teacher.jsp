<%
    String question_added="";
    try{
        question_added=request.getParameter("question_added");
        if(question_added.length()>1)
        {
            String query="insert into tbl_question(question,answer_correct,answer_incorrect_1,answer_incorrect_2,answer_incorrect_3) values('"+request.getParameter("question")+"','"+request.getParameter("answer_correct")+"','"+request.getParameter("answer_wrong1")+"','"+request.getParameter("answer_wrong2")+"','"+request.getParameter("answer_wrong3")+"')";
            statement.executeUpdate(query);
        }
    }
    catch(Exception ex){}
%>