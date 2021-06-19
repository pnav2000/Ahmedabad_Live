package com.pnv.dbconnection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.pnv.module.Complain;


public class ComplainManagement {
	public List<Complain> findAllComplainByUserId(int userId) throws Exception{
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		ResultSet responseData = statementObj.executeQuery("select * from usercomplain where user_id = "+userId);
		List<Complain> complainList = getComplainListByResultSet(responseData);
	return complainList;
	}
	
	public List<Complain> getAllComplain() throws Exception{
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		ResultSet responseData = statementObj.executeQuery("select * from usercomplain");
		List<Complain> complainList = getComplainListByResultSet(responseData);
		return complainList;
	}
	
	public Complain findComplainByID(int id, int userId) throws Exception{
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		ResultSet responseData = statementObj.executeQuery("select * from usercomplain where id = "+id+" and user_id="+userId);
		Complain complain = null;
		while(responseData.next()) {
			complain = getComplainObjectByResultSet(responseData);
		}
		return complain;
	}
	
	public boolean saveComplain(Complain complain) throws SQLException, Exception {
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		int isSuccess = statementObj.executeUpdate("insert into usercomplain (user_id,name,email,address,contact,title,discription) values ('"+complain.getUserId()+"','"+complain.getName()+"','"+complain.getEmail()+"','"+complain.getAddress()+"','"+complain.getContact()+"','"+complain.getTitle()+"','"+complain.getDiscription()+"')");
		if (isSuccess > 0)	{
			return true;
			
		}
		return false;
	}

	public boolean updateComplain(Complain complain) throws Exception{
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		int isSuccess = statementObj.executeUpdate("update usercomplain set user_id = '" + complain.getUserId() + "',name = '" + complain.getName() + "',email = '" + complain.getEmail() + "',address = '" + complain.getAddress() + "',contact = '" + complain.getContact() + "',title = '" + complain.getTitle() + "',discription = '"+ complain.getDiscription() + "' where id  = " + complain.getId());
		if(isSuccess > 0) {
			return true;
		}
		return false;
	}
	
	public boolean removeComplainById(long id) throws Exception {
		Statement statementObj = DatabaseConnection.getConnection().createStatement();
		int isSuccess = statementObj.executeUpdate("delete from usercomplain where id="+id);
		if (isSuccess > 0)	{
			return true;
			
		}
		return false;
		
	}
	private List<Complain> getComplainListByResultSet(ResultSet responseData) throws Exception{
		List<Complain> complainList = new ArrayList();
		while (responseData.next()) {
			Complain obj = getComplainObjectByResultSet(responseData);
			complainList.add(obj);
		}
		return complainList;
	}
	
	private Complain getComplainObjectByResultSet(ResultSet responseData) throws Exception{
		Complain obj = new Complain();
		obj.setId(responseData.getInt("id"));
		obj.setUserId(responseData.getInt("user_id"));
		obj.setName(responseData.getString("name"));
		obj.setEmail(responseData.getString("email"));
		obj.setAddress(responseData.getString("address"));
		obj.setContact(responseData.getString("contact"));
		obj.setTitle(responseData.getString("title"));
		obj.setDiscription(responseData.getString("discription"));
		
		return obj;
		
	}
	
	
}
