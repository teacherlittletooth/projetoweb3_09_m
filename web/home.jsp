<%-- 
    Document   : home
    Created on : 26 de abr. de 2023, 11:55:49
    Author     : QI
--%>

<%@page import="model.User" %>
<%
    User uSession = (User) session.getAttribute("userNameSession");
    User u = (User) request.getAttribute("userName");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Bem vindo <%= uSession %>!</h1>
        <h1>Bem vindo <%= u %>!</h1>
    </body>
</html>
