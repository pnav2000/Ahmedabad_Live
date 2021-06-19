package com.pnv.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.Blob;
import com.pnv.dbconnection.UserManagment;
import com.pnv.module.User;


/**
 * Servlet implementation class SignUp
 */
@WebServlet("/SignUp")
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User userObj = new User();

		userObj.setName(request.getParameter("name"));
		userObj.setEmail(request.getParameter("email"));
		userObj.setContact(request.getParameter("contact"));
		userObj.setPassword(request.getParameter("password"));
		userObj.setRe_password(request.getParameter("re-password"));
		userObj.setDob(request.getParameter("dateofbirth"));
		userObj.setGender(request.getParameter("gender"));
		userObj.setCollege(request.getParameter("college"));
		userObj.setAddress(request.getParameter("address"));
		
		try {
			boolean isSuccess = new UserManagment().registerUser(userObj);
			if (isSuccess) {
				RequestDispatcher dispatcher = request.getRequestDispatcher("/signin.jsp");
				dispatcher.forward(request, response);
			}else {
				response.getWriter().append("Something Went Wrong").append(request.getContextPath());
				RequestDispatcher dispatcher = request.getRequestDispatcher(request.getContextPath()+"/signup.jsp");
				dispatcher.include(request, response);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/error.jsp");
		}
		
		
	}

}
