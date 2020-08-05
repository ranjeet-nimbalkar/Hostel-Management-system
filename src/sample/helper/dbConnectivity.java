package sample.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class dbConnectivity {
    public Connection connection;

    public Connection getConnection() {
        String db="hms";
        String user ="ajit";
        String pass="ajit_Ajit44";

        try{
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://192.168.43.207:3306/"+db,user,pass);
        }catch(Exception e){
            System.out.println("Login "+ e);
        }
        return connection;
    }
}
