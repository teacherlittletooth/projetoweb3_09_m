<%-- 
    Document   : listar
    Created on : 10 de mai. de 2023, 09:44:15
    Author     : QI
--%>
<%@page import="model.Proprietario"%>
<%@page import="model.ProprietarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Animaland</title>
    </head>
    <body>
        <h1>LISTAR</h1>
        <hr>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>NOME</th>
                    <th>CPF</th>
                    <th>LOGRADOURO</th>
                    <th>NÚMERO</th>
                    <th>CEP</th>
                    <th>CIDADE</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <%
                ProprietarioDAO pdao = new ProprietarioDAO();
                for(Proprietario p : pdao.listProprietario()) {
                %>
                <tr>
                    <td><%= p.getIdProprietario() %></td>
                    <td><%= p.getNome() %></td>
                    <td><%= p.getCpf() %></td>
                    <td><%= p.getLogradouro() %></td>
                    <td><%= p.getNumero() %></td>
                    <td><%= p.getCep() %></td>
                    <td><%= p.getCidade() %></td>
                    <td>
                        <a href="UpdateProprietario?cod=<%= p.getIdProprietario() %>">📝</a>
                    </td>
                    <td onclick="confirmDelete(<%= p.getIdProprietario() %>)">❌</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>

        <hr>
        <a href="home.jsp">Página Inicial</a>
        
        <script>
            function confirmDelete(cod) {
                if(confirm("Deseja realmente excluir?")){
                    window.location.replace("DeleteProprietario?cod=" + cod);
                } else {
                    alert("Exclusão cancelada!");
                }
            }
        </script>
    </body>
</html>
