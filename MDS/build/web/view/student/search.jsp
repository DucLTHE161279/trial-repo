<%-- 
    Document   : search
    Created on : Jan 21, 2022, 3:28:32 PM
    Author     : Sap-lap
--%>

<%@page import="model.Student"%>
<%@page import="model.Department"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            ArrayList<Department> depts = (ArrayList<Department>)request.getAttribute("depts");
            ArrayList<Student> students = (ArrayList<Student>)request.getAttribute("students");
            int did = (Integer)request.getAttribute("did");
        %>
        <script>
            function submitForm()
            {
                document.getElementById("frmSearch").submit();
            }
        </script>
    </head>
    <body>
        <form action="search" method="GET" id="frmSearch">
            Department: 
            <select name="did" onchange="submitForm();">
                <option value="-1">----SELECT A DEPARTMENT----</option>
                <% for (Department d : depts) {
                %>
                <option
                    <%=(d.getId()==did)?"selected=\"selected\"":""%>
                    value="<%=d.getId()%>"><%=d.getName()%></option>
                <%}%>
            </select>
        </form>
            <%if(students.size()>0){%>
            <table>
                <tr>
                    <td>Id</td>
                    <td>Name</td>
                    <td>Gender</td>
                    <td>Dob</td>
                    <td>Department</td>
                </tr>
                <%for (Student s : students) {
                %>
                <tr>
                    <td><%=s.getId() %></td>
                    <td><%=s.getName()%></td>
                    <td><%=s.isGender()%></td>
                    <td><%=s.getDob()%></td>
                    <td><%=s.getDept().getName() %></td>
                </tr>
                <%}%>
            </table> 
            <%}else{%>
            No record to display.
            <%}%>
    </body>
</html>
