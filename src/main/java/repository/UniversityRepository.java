/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package repository;


import entity.University;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author user
 */
public class UniversityRepository extends Repository<University>{

    @Override
    public List<University> getList() {
        try(Connection connection = connect()){
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from university");
            
            
            List<University> list = new ArrayList<>();
            while(resultSet.next()){
                list.add(new University(
                        resultSet.getInt("id"),
                        resultSet.getString("name")));
            }
            return list;
        }catch(Exception e){
            e.printStackTrace();
            return Collections.emptyList();
            
        }

    }
    public List<University> getList(Integer id, String name) {

        try (Connection connection = connect()) {            
            String sql = "select * from university where ";

            int index=1;
            if(id!=null){
                sql+="id=? and ";
                
            }
            if(name!=null && name.trim().length()>0){
                sql+="name like ? and ";
                index++;
            }
           
            sql=sql.substring(0, sql.length()-5);
            System.out.println(sql);
            
            PreparedStatement statement = connection.prepareStatement(sql);


           
         
            if(name!=null && name.trim().length()>0){
                statement.setString(index, "%"+name+"%");
                index--;
            }
             if(id!=null){
                statement.setInt(index, id);
                index--;
            }
            
            ResultSet resultSet = statement.executeQuery();
            List<University> list = new ArrayList<>();
            while (resultSet.next()) {
                list.add(new University(
                        resultSet.getInt("id"), 
                        resultSet.getString("name")));
            }

            return list;
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }


    }

    @Override
    public University getById(Integer id) {
        try(Connection connection =connect()){
            PreparedStatement statement = connection.prepareStatement("select * from university where id=?");
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            
            if(resultSet.next()){
                return new University(
                        resultSet.getInt("id"),
                            resultSet.getString("name"));
            }else{
                return null;
            }
            
            
        }catch(Exception e) {
            e.printStackTrace();
            return null;
        }

    }

    @Override
    public University insert(University university) {
        try (Connection connection = connect()) {

            PreparedStatement statement =
                    connection.prepareStatement(
                            "insert into university(name) values(?)",
                            Statement.RETURN_GENERATED_KEYS);

            statement.setString(1, university.getName());
            statement.execute();

            ResultSet resultSet = statement.getGeneratedKeys();
            if (resultSet.next()) {

                university.setId((resultSet.getInt(1)));
            }
            return university;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public boolean update(University university) {
        
        try (Connection connection = connect()) {


            String sql = "update university set ";
            int index = 0;
            if (university.getName() != null) {
                sql += "name=?,";
                index++;
            }
            
            sql = sql.substring(0, sql.length() - 1);
            sql += " where id=?";
            System.out.println(sql);

            PreparedStatement statement = connection.prepareStatement(sql);

            statement.setString(index, university.getName());
            index--;

            return statement.execute();


        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean delete(Integer id) {
       try (Connection connection = connect()) {


            PreparedStatement statement = connection.prepareStatement(
                    "delete from university where id=?");
            statement.setInt(1, id);
            return statement.execute();


        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }   
    
}
