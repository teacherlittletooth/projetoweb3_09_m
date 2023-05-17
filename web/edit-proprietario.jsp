<%-- 
    Document   : edit-proprietario
    Created on : 17 de mai. de 2023, 11:42:52
    Author     : QI
--%>

<%@page import="model.Proprietario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Proprietario p = (Proprietario)request.getAttribute("prop");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Animaland</title>
    </head>
    <body>
        <h1>EDITAR</h1>
        <hr>
        <form action="CadastroProprietario" method="post">
            
            <input type="text" name="id" value="<%= p.getIdProprietario() %>" readonly>
            
            <br><br>
            
            <input type="text" name="nome" value="<%= p.getNome() %>" placeholder="Nome do proprietário" required>
            
            <br><br>
            
            <input type="text" name="cpf" value="<%= p.getCpf() %>" placeholder="CPF do proprietário" required>
        
            <br><br>
            
            <input type="text" name="logradouro" value="<%= p.getLogradouro() %>" placeholder="Logradouro (rua, avenida, beco, etc)" required>
            
            <br><br>
            
            <input type="number" name="numero" value="<%= p.getNumero() %>" placeholder="Número" required>
            
            <br><br>
            
            <input type="text" name="cep" value="<%= p.getCep() %>" placeholder="CEP" required>
            
            <br><br>
            
            <select name="cidade" required>
                <option value="<%= p.getCidade() %>"><%= p.getCidade() %></option>
                <option value="Porto Alegre">Porto Alegre</option>
                <option value="Viamão">Viamão</option>
                <option value="Alvorada">Alvorada</option>
                <option value="Gravataí">Gravataí</option>
                <option value="Sapucaia">Sapucaia</option>
                <option value="Guaíba">Guaíba</option>
            </select>
            
            <br><br>
            
            <input type="submit" value="Atualizar">
        </form>
        <br>
        <a href="home.jsp">Página Inicial</a>
    </body>
</html>
