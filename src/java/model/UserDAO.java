package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private static Connection conn;
    
    public UserDAO() throws SQLException, ClassNotFoundException {
        conn = MyConnection.getConnection();
    }
    
    public User listByName(String nome) throws SQLException {
        User user = new User();
        
        String sql = "SELECT * FROM usuarios "
                + "WHERE nome = ?";
        
        PreparedStatement prep = conn.prepareStatement(sql);
        prep.setString(1,nome);
        
        ResultSet result = prep.executeQuery();
        
        if(result.next()) {
            user.setId(result.getInt("id_usuario"));
            user.setUserName(result.getString("nome"));
            user.setUserPass(result.getString("senha"));
        }
        
        return user;
    }
}
