<%-- 
    Document   : home
    Created on : 26 de abr. de 2023, 11:55:49
    Author     : QI
--%>

<%@page import="model.User" %>
<%
    User uSession = (User) session.getAttribute("userNameSession");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Animaland</title>
    </head>
    <body>
        <%@include file="session/verify.jsp" %>
        <p id="welcome">
            <div>Bem vindo <%= (uSession != null) ? uSession.getUserName() : "visitante" %>!</div>
            <div><button onclick="window.location.href='session/logout.jsp'">Logout</button></div>
        </p>
        <hr>
        <section id="menu">
            <button class="item-home" onclick="window.location.href='cadastro.jsp'">CADASTRAR</button>
            <button class="item-home" onclick="window.location.href='listar.jsp'">LISTAR</button>
        </section>
        
    </body>
</html>
