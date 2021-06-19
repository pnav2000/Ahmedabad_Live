package com.pnv.dbconnection;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.pnv.module.Feedback;

public class FeedbackManagement {
	
	public boolean saveFeedback(Feedback feedback) throws SQLException, Exception {
		Connection con = DatabaseConnection.getConnection();
		con.setAutoCommit(false);
		Statement statementObj = con.createStatement();
		int isSuccess = statementObj.executeUpdate("insert into feedback (user_id,name,email,title,discription) values ('"+feedback.getUser_id()+"','"+feedback.getName()+"','"+feedback.getEmail()+"','"+feedback.getTitle()+"','"+feedback.getDiscription()+"')");
		if (isSuccess > 0) {
			con.commit();
			return true;
		}
		return false;
	}
}
