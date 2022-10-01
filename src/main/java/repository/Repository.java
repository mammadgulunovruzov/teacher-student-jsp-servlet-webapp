 package repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public abstract class Repository<T>{

    protected Connection connect() throws Exception {

        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/freedom", "root", "12345");

    }
    public abstract List<T> getList();

    public abstract T getById(Integer id);

    public abstract T insert(T teacher);


    public abstract  boolean update(T teacher);


    public abstract boolean delete(Integer id) ;




}
