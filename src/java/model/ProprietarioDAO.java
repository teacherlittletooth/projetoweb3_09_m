package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProprietarioDAO {
    private static Connection conn;
    
    public ProprietarioDAO() throws SQLException, ClassNotFoundException {
        conn = MyConnection.getConnection();
    }
    
    //Iniciando métodos do CRUD
    //SELECT (CREATE)
    public ArrayList<Proprietario> listProprietario() throws SQLException {
        //Criar lista vazia
        ArrayList<Proprietario> list = new ArrayList<>();
        
        //Query SQL
        String query = "SELECT * FROM proprietarios";
        
        //Preparando a query para lançar no banco de dados
        PreparedStatement prep = conn.prepareStatement(query);
        
        //Recebendo o resultado da query na variável result
        //da classe ResultSet
        ResultSet result = prep.executeQuery();
        
        //Enqunto houverem resultados, executa a operação
        while(result.next()) {
            //Objeto vazio de Proprietario
            Proprietario proprietario = new Proprietario();
            
            //Inserindo atributos neste objeto por meio dos setters
            proprietario.setIdProprietario(result.getInt("id_proprietario"));
            proprietario.setNome(result.getString("nome"));
            proprietario.setCpf(result.getString("cpf"));
            proprietario.setLogradouro(result.getString("logradouro"));
            proprietario.setNumero(result.getInt("numero"));
            proprietario.setCep(result.getString("cep"));
            proprietario.setCidade(result.getString("cidade"));
            
            //Adicionando objeto preenchido na lista
            list.add(proprietario);
        }
        
        //Retornando a lista com todos os registros do BD
        return list;
    }
    
}
