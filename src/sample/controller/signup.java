package sample.controller;

import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import sample.Strings;
import sample.helper.dbConnectivity;

import java.io.IOException;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;

public class signup implements Initializable {

   
    public TextField et_fname;
    public TextField et_lname;
   public PasswordField et_pass;
    public PasswordField et_cpass;
    public TextField et_dob;
    public TextField et_email;
    public TextField et_contact;
    public TextField et_parentNo;
    public TextField et_address;
    public RadioButton radio_male;
    public RadioButton radio_female;

    String S_fname,S_lname,S_pass,S_dob,S_email,S_contact,S_parent,S_gender,S_addr;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        ToggleGroup tg = new ToggleGroup();
        radio_male.setToggleGroup(tg);
        radio_female.setToggleGroup(tg);

        tg.selectedToggleProperty().addListener(new ChangeListener<Toggle>() {
            public void changed(ObservableValue<? extends Toggle> ob, Toggle o, Toggle n) {
                RadioButton rb = (RadioButton)tg.getSelectedToggle();
                if (rb != null) {
                    S_gender = rb.getText();
                    System.out.println(S_gender);
                }
            }
        });

    }

    public void tab_sign_in(MouseEvent mouseEvent) throws IOException {
        Parent root = FXMLLoader.load(getClass().getResource("/sample/view/login.fxml"));
        Node node=(Node) mouseEvent.getSource();
        Stage stage=(Stage) node.getScene().getWindow();
        stage.setScene(new Scene(root));
    }

    public void tab_sign_up(MouseEvent mouseEvent) {
    }



  
    public void sign_up(MouseEvent mouseEvent)  {
        dbConnectivity connectionClass =new dbConnectivity();
        Connection connection=connectionClass.getConnection();
        S_fname = et_fname.getText();
        S_lname = et_lname.getText();
        S_pass = et_pass.getText();
        S_dob = et_dob.getText();
        S_email = et_email.getText();
        S_contact = et_contact.getText();
        S_parent = et_parentNo.getText();
        S_addr = et_address.getText();


        if(S_fname.equals(""))
            showAlert(" Please Enter First Name");

        else if(S_lname.equals(""))
            showAlert(" Please Enter Last Name");
        else if(S_email.equals(""))
            showAlert(" Please Enter Email ");
        else if(!isValid(S_email))
            showAlert("Incorrect Email ");
          else  if(S_dob.equals(""))
            showAlert(" Please Enter Date Of Birth");
          else if(!Strings.isValid(S_contact))
            showAlert(" Incorrect Contact No!");
        else if(!Strings.isValid(S_parent))
            showAlert("Incorrect Parent Contact No!");
        else if(S_gender.equals(""))
            showAlert(" Please Enter Gender");
        else if(S_addr.equals(""))
            showAlert(" Please Enter Address");
        else if(S_pass.equals("") || !S_pass.equals(et_cpass.getText()))
            showAlert(" Incorrect Password!");
        else{


            String sql="call Signup('"+S_fname+"','"+S_lname+"','"+S_pass+"','"+S_dob+"','"+S_contact+"','"+S_addr+"','"+S_parent+"','"+S_gender+"','"+S_email+"',@op_id)";


            Statement statement = null;

            try {
                statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery(sql);
                if (resultSet.next()) {
                  String  generatedID = String.valueOf(resultSet.getInt(1));
                    System.out.println("Generated Emp Id: " + generatedID);
                     showAlert("Your StudentID is  "+resultSet.getInt(1));
                }
            } catch (SQLException e) {
              System.out.println("err "+e);
            }


        }

    }

    private void showAlert(String text) {
        Alert alert = new Alert(Alert.AlertType.INFORMATION);
        alert.setTitle("Alert");

        alert.setHeaderText(null);
        alert.setContentText(text);
        alert.showAndWait();
    }
    static boolean isValid(String email) {
        String regex = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";
        return email.matches(regex);
    }


}
