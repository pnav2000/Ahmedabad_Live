package com.pnv.dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnection {

	static Connection connectionObj = null;

	public static Connection getConnection() throws Exception{
		if (connectionObj == null || !connectionObj.isClosed()) {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connectionObj = DriverManager.getConnection("jdbc:mysql://localhost/task3", "root", "pnav");
		}
		return connectionObj;
		
	}

}
