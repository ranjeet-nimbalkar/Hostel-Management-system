package sample.controller.user;

import javafx.concurrent.Task;
import javafx.concurrent.WorkerStateEvent;
import javafx.event.EventHandler;
import javafx.fxml.Initializable;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

import java.net.URL;
import java.util.ResourceBundle;

public class HomeTab implements Initializable {
    public Label label_title;
    public ImageView bac_img;
    int[] img ={2,3,4,1,3,2,4,1,2,3,4};
    @Override
    public void initialize(URL url, ResourceBundle resourceBundle) {

       // bac_img.setImage(new Image("/sample/images/"+2+".png"));

        Task<Integer> task = new Task<Integer>() {
            @Override protected Integer call() throws Exception {
                int iterations;
                for (iterations = 2; iterations < 11; iterations++) {
                    if (isCancelled()) {
                        break;
                    }
                    Thread.sleep(2500);

                   bac_img.setImage(new Image("/sample/images/"+img[iterations]+".png"));

                }
                return iterations;
            }
        };new Thread(task).start();
     /*   Task<Void> sleeper = new Task<Void>() {
            @Override
            protected Void call() throws Exception {
                try {
                    Thread.sleep(5000);
                } catch (InterruptedException e) {
                }
                return null;
            }
        };
        sleeper.setOnSucceeded(new EventHandler<WorkerStateEvent>() {
            @Override
            public void handle(WorkerStateEvent event) {
              System.out.println("Hello World");
            }
        });
        new Thread(sleeper).start();*/
    }

}
