package edu.minishop.log;

import java.io.IOException;
import java.util.logging.FileHandler;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.logging.SimpleFormatter;

public class LogFactory {
    public static Logger getLogger(){
        Logger logger = Logger.getLogger("Hauphvn");
        FileHandler fileHandler = null;
        try {
            fileHandler = new FileHandler("/home/cmd/myProject/Minishop/logs/getAllProduct.log");
        } catch (IOException e) {
            e.printStackTrace();
        }
        fileHandler.setFormatter( new SimpleFormatter());
        logger.addHandler(fileHandler);
        logger.setLevel(Level.WARNING);
        logger.setUseParentHandlers(false);// Not show to console
        return logger;
    }

}
