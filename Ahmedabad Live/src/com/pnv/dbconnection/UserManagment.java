package com.pnv.dbconnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.websocket.Decoder.BinaryStream;

import com.mysql.cj.jdbc.Blob;
import com.pnv.module.Complain;
import com.pnv.module.User;

public  class UserManagment {
	public boolean registerUser(User user) throws SQLException, Exception {
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		int isSuccess = statementObj.executeUpdate("insert into userdata (name,email,contact,password,re_password,dob,gender,college,address) values ('"+user.getName()+"','"+user.getEmail()+"','"+user.getContact()+"','"+user.getPassword()+"','"+user.getRe_password()+"','"+user.getDob()+"','"+user.getGender()+"','"+user.getCollege()+"','"+user.getAddress()+"')");
		if (isSuccess > 0) {
			return true;
		}else {
			throw new Exception();
		}
	}
	
	public boolean updateUser(User user) throws Exception{
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		int isSuccess = statementObj.executeUpdate("update userdata set name = '" + user.getName() + "',email = '" + user.getEmail() + "',contact = '" + user.getContact() + "',gender = '" + user.getGender() + "',college = '" + user.getCollege() + "',address = '" + user.getAddress() + "' where id  = " + user.getId());
		if(isSuccess > 0) {
			return true;
		}
		return false;
	}
	
	public User getUserByEmail(String email) throws SQLException, Exception{
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		ResultSet resultset = statementObj.executeQuery("select * from userdata where email = '"+email+"'");
		User user = new User();
		while(resultset.next()) {
			user.setId(resultset.getInt("id"));
			user.setName(resultset.getString("name"));
			user.setEmail(resultset.getString("email"));
			user.setContact(resultset.getString("contact"));
			user.setPassword(resultset.getString("password"));
			user.setRe_password(resultset.getString("re_password"));
			user.setDob(resultset.getString("dob"));
			user.setGender(resultset.getString("gender"));
			user.setCollege(resultset.getString("college"));
			user.setAddress(resultset.getString("address"));
		}
		return user;
	}
}
