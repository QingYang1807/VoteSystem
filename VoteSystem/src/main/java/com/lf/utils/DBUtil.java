package com.lf.utils;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBUtil {
    static Connection con=null;
            static{
                try {
                    //加载驱动
                    Class.forName("com.mysql.jdbc.Driver");
                    //获取连接对象
                    con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vote_system?useUnicode=true&characterEncoding=UTF-8", "root", "123456");
                } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static Connection getConnection(){
        return con;
    }

}
