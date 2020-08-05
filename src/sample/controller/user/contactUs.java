package sample.controller.user;


import javafx.fxml.Initializable;
import sample.helper.dbConnectivity;

import java.awt.*;
import java.awt.event.MouseEvent;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class contactUs extends HomePage implements Initializable {
    public TextField et_h_name;
    public TextField et_name;
    public TextField et_id;
    public TextField et_subject;
    public TextArea et_text;
 String S_h_name,S_name,S_roll,S_subject,S_text;


    public void submit(MouseEvent mouseEvent) throws SQLException {
        dbConnectivity connectionClass =new dbConnectivity();
        Connection connection=connectionClass.getConnection();
        S_name=et_name.getText();
        S_h_name=et_h_name.getText();
        S_roll=et_id.getText();
        S_subject=et_subject.getText();
        S_text=et_text.getText();

        if(S_name.equals(""))
            System.out.println(" Please Enter Name");
        else if(S_h_name.equals(""))
            System.out.println(" Please Enter Name");
        else if(S_roll.equals(""))
            System.out.println(" Please Enter Name");
        else if(S_subject.equals(""))
            System.out.println(" Please Enter Name");
        else if(S_text.equals(""))
            System.out.println(" Please Enter Name");
        else{
            String sql="INSERT INTO `message`(`senderID`, `RoomID`, `hostelID`, `subject`, `message`) VALUES ('"+KEY_STUDENT_ID+"','"+KEY_ROOM_ID+"','"+KEY_HOSTELID+"','"+S_subject+"','"+S_text+"')";


            Statement statement=connection.createStatement();
            ResultSet resultSet =statement.executeQuery(sql);
              }


    }
}
