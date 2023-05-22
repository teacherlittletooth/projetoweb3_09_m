package model;

import java.sql.SQLException;

public class User {
    //Atributos
    private int id;
    private String userName;
    private String userPass;
    
    //Construtor
    public User(){}
    
    public User(String u, String p) {
       this.userName = u;
       this.userPass = p;
    }
    
    public User(int id, String u, String p) {
       this.id = id;
       this.userName = u;
       this.userPass = p;
    }
    
    //Getters & Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    
    public String getUserName() {
        return this.userName;
    }
    
    public void setUserName(String u) {
        this.userName = u;
    }

    public String getUserPass() {
        return userPass;
    }

    public void setUserPass(String userPass) {
        this.userPass = userPass;
    }
    
    //toString -> Representação do objeto
    @Override
    public String toString() {
        return "<hr>Nome: " + userName +
               "<br>Senha: " + userPass;
    }
    
    //Métodos gerais
    public boolean isLogged() throws SQLException, ClassNotFoundException {
        UserDAO udao = new UserDAO();
        User uBanco = udao.listByName(this.userName);
        
        if(uBanco.getUserName() != null){
            return (uBanco.getUserPass().equals(this.userPass));
        } else {
            return false;
        }
        
    }
    
    
}//Fim da classe
