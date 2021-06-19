package com.pnv.registration;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pnv.dbconnection.ComplainManagement;
import com.pnv.dbconnection.UserManagment;
import com.pnv.module.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/userServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("userdata");
		if(user != null) {
			User newUser = new User();
			newUser.setName(request.getParameter("name"));
			newUser.setEmail(request.getParameter("email"));
			newUser.setContact(request.getParameter("contact"));
			newUser.setDob(request.getParameter("dob"));
			newUser.setGender(request.getParameter("gender"));
			newUser.setCollege(request.getParameter("college"));
			newUser.setAddress(request.getParameter("address"));
			newUser.setId(user.getId());
		try {
			boolean isSuccess = false;
				isSuccess = new UserManagment().updateUser(newUser);
			if(isSuccess) {
				session.setAttribute("userdata",newUser);
				response.sendRedirect(request.getContextPath()+"/profile.jsp");
			}else {
				response.sendRedirect(request.getContextPath()+"/error.jsp");
			}
		}  catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/error.jsp");
		}
		}

	}

}
