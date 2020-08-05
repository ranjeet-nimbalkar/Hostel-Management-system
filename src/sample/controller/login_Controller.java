package sample.controller;

import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Label;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import sample.Strings;
import sample.helper.dbConnectivity;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class login_Controller extends Strings {
    public PasswordField et_pass;
    public TextField et_user;
    public Label label_user;
    public Label label_pass;

    String S_user,S_pass;


    public void tab_sign_up(MouseEvent mouseEvent) throws IOException {
      //  Parent root = FXMLLoader.load(getClass().getResource("/sample/view/signup.fxml"));
        Parent root = FXMLLoader.load(getClass().getResource("/sample/view/signup.fxml"));
        Node node=(Node) mouseEvent.getSource();
        Stage stage=(Stage) node.getScene().getWindow();
        stage.setScene(new Scene(root));
        System.out.println("gvcf");
    }

    public void tab_sign_in(MouseEvent mouseEvent) {
    }

    public void sign_in(MouseEvent mouseEvent) {
       S_user=et_user.getText();
       S_pass=et_pass.getText();
       if(S_user.equals(""))
           label_user.setVisible(true);
       else if(S_pass.equals(""))
           label_pass.setVisible(true);
       else{
           dbConnectivity connectionClass=new dbConnectivity();
           Connection connection=connectionClass.getConnection();
           String sql ="call login_user("+S_user+",'"+S_pass+"')";
           try {
               Statement statement=connection.createStatement();
               ResultSet resultSet =statement.executeQuery(sql);
               if(resultSet.next())
                  if(resultSet.getInt(1)==999)
                  System.out.println(" Login Failed ");
                  else
               {
                   //  StudentID, FirstName, LastName, Gender, Email, RoomID
                   KEY_STUDENT_ID = resultSet.getString(1);
                   KEY_STUD_NAME  = resultSet.getString(2);
                   KEY_STUD_NAME = KEY_STUD_NAME +" "+ resultSet.getString(3);
                   KEY_GENDER = resultSet.getString(4);
                   KEY_EMAIL = resultSet.getString(5);
                   KEY_ROOM_ID = resultSet.getString(6);
                   System.out.println(KEY_STUDENT_ID+KEY_STUD_NAME);
                   Parent root = FXMLLoader.load(getClass().getResource("/sample/view/HomePage.fxml"));
                   Node node=(Node) mouseEvent.getSource();
                   Stage stage=(Stage) node.getScene().getWindow();
                   stage.setScene(new Scene(root));
               }
           } catch (SQLException | IOException e) {
               e.printStackTrace();
           }

       }
    }


}
