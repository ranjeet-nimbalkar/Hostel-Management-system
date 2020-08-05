package sample.controller.user;

import com.jfoenix.controls.JFXButton;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.AnchorPane;
import sample.Strings;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;

public class HomePage extends Strings implements  Initializable {
    public JFXButton tab_hostel;
    public JFXButton tab_contact;
    public JFXButton tab_notify;
    public JFXButton tab_profile;
    public JFXButton tab_home;
    public AnchorPane holderPane;
    AnchorPane home;

    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {
        createPage(home, Strings.path);

    }

    public void Roll_click(MouseEvent mouseEvent) {
    }

    public void Notification_click(MouseEvent mouseEvent) {
    }

    public void Contact_click(MouseEvent mouseEvent) throws IOException {
        createPage(home, "/sample/view/contact_us.fxml");
    }

    public void Hostel_click(MouseEvent mouseEvent) {
        createPage(home, "/sample/view/hostels_tab.fxml");
    }

    public void Home_click(MouseEvent mouseEvent) {
        createPage(home, "/sample/view/home_tab.fxml");
    }


    private void setNode(Node node){

        holderPane.getChildren().clear();
        holderPane.getChildren().add((Node) node);


    }
    public void createPage(AnchorPane homeN, String path){
        try {
            homeN = FXMLLoader.load(getClass().getResource(path));
            setNode(homeN);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
