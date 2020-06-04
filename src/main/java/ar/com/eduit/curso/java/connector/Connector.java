package ar.com.eduit.curso.java.connector;

import java.sql.Connection;
import java.sql.DriverManager;
/**
 * 
 * @author Ricardo
 */
public final class Connector {
    /**
     * 
     * Conectamos con la base de datos
     */
    private static final String driver="com.mysql.cj.jdbc.Driver"; // driver 6 o superior
    //private static final String driver="com.mysql.jdbc.Driver";  // driver 5
    private final static String vendor="mysql";
    private final static String server="localhost";
    //private final static String server="sql10.freemysqlhosting.net";
    private final static String port="3306";
    private final static String db="colegio";
    //private final static String db="sql10334882";
    private final static String params="";
    private final static String user="root";
    //private final static String user="sql10334882";
    private final static String pass="";
    //private final static String pass="WC9HB91glm";
    private final static String url="jdbc:"+vendor+"://"+server+":"+port+"/"+db+params+"?useTimezone=true&serverTimezone=UTC";
    private static Connection conn=null;
    private Connector(){}
    
    public synchronized static Connection getConnection(){
        if(conn==null){
            try{
                Class.forName(driver);
                conn=DriverManager.getConnection(url, user, pass);
            }catch(Exception e){
                e.printStackTrace();
            }
        }
        return conn;
    }
    
}

