<%-- 
    Document   : index
    Created on : 3 de mai. de 2023, 10:00:45
    Author     : QI
--%>

<%
    if(session.getAttribute("userNameSession") != null){
        response.sendRedirect("home.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="img/logotipo.jpg"/>
        <link rel="stylesheet" href="css/style.css"/>
        <title>Animaland - PetShop</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <form action="verifica_usuario.java" method="post" id="form-login">
            <img src="img/logotipo.jpg" alt="Logotipo da loja" width="250"/>
            <br>
            
            <input type="email" name="user" id="user" placeholder="Insira seu email" required>
            <br><br>
            
            <input type="password" name="pass" id="pass" placeholder="Insira sua senha" required>
            <br><br>
            
            <input type="submit" value="Entrar">
        </form>
    </body>
</html>
