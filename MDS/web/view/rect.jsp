<%-- 
    Document   : rect
    Created on : Jan 10, 2022, 2:51:57 PM
    Author     : Sap-lap
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Rect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%
            //implicit objects: request, response, session, application
            ArrayList<Rect> rects = (ArrayList<Rect>)request.getAttribute("rects");
            int width = (Integer)request.getAttribute("width");
            int height = (Integer)request.getAttribute("height");
        %>
    </head>
    <body>
        <canvas id="myCanvas" width="<%=width%>" height="<%=height%>" style="border:1px solid #d3d3d3;">
            Your browser does not support the HTML5 canvas tag.</canvas>

        <script>
            var c = document.getElementById("myCanvas");
            var ctx = c.getContext("2d");
            ctx.beginPath();
            <% for (Rect r : rects) {%>
                 ctx.rect(<%=r.getX()%>, <%=r.getY()%>, <%=r.getW()%>, <%=r.getH()%>);
            <%}%> 
            ctx.stroke();
        </script> 
    </body>
    
</html>
