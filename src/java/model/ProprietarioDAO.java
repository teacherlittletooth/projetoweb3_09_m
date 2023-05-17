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
    //SELECT (READ)
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
    
    
    //Insert (CREATE)
    public void insertProprietario(Proprietario pro) throws SQLException {
        //Criar a query para inserção
        String query = "INSERT INTO proprietarios(nome, cpf, logradouro, numero, cep, cidade)"
                + "VALUES(?,?,?,?,?,?)";
        
        //Preparando a query para lançar no BD
        PreparedStatement prep = conn.prepareStatement(query);
        
        //Pegar os atributos recebidos do objeto Proprietario
        //e lançar na query
        prep.setString(1, pro.getNome());
        prep.setString(2, pro.getCpf());
        prep.setString(3, pro.getLogradouro());
        prep.setInt(4, pro.getNumero());
        prep.setString(5, pro.getCep());
        prep.setString(6, pro.getCidade());
        
        //Lnaçar a query pronta para o BD
        prep.execute();
        prep.close();
    }
    
    
    //DELETE
    public void deleteProprietario(int i) throws SQLException {
        String query = "DELETE FROM proprietarios "
                + "WHERE id_proprietario = " + i;
        
        PreparedStatement prep = conn.prepareStatement(query);
        
        prep.execute();
        prep.close();
    }
    
    
    //LIST BY ID (Selecionar apenas um registro)
    public Proprietario listById(int id) throws SQLException {
        Proprietario p = new Proprietario();
        
        String sql = "SELECT * FROM proprietarios "
                + "WHERE id_proprietario = " + id;
        
        PreparedStatement prep = conn.prepareStatement(sql);
        ResultSet result = prep.executeQuery();
        
        if(result.next()) {
            p.setIdProprietario(result.getInt("id_proprietario"));
            p.setNome(result.getString("nome"));
            p.setCpf(result.getString("cpf"));
            p.setCep(result.getString("cep"));
            p.setCidade(result.getString("cidade"));
            p.setLogradouro(result.getString("logradouro"));
            p.setNumero(result.getInt("numero"));
        }
        
        return p;
    }
    
    
    //UPDATE
    public void updateProprietario(Proprietario p) throws SQLException {
        String sql = "UPDATE proprietarios SET nome = ?,"
                + "cpf = ?, logradouro = ?, numero = ?,"
                + "cep = ?, cidade = ? "
                + "WHERE id_proprietario = ?";
        
        PreparedStatement prep = conn.prepareStatement(sql);
        prep.setString(1, p.getNome());
        prep.setString(2, p.getCpf());
        prep.setString(3, p.getLogradouro());
        prep.setInt(4, p.getNumero());
        prep.setString(5, p.getCep());
        prep.setString(6, p.getCidade());
        prep.setInt(7, p.getIdProprietario());
        
        prep.execute();
        prep.close();
    }
}
