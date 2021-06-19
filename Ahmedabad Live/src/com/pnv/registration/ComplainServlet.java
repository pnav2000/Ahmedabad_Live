package com.pnv.registration;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pnv.dbconnection.ComplainManagement;
import com.pnv.module.Complain;
import com.pnv.module.User;

/**
 * Servlet implementation class ComplainServlet
 */
@WebServlet("/complainServlet")
public class ComplainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPDATE_ACTION = "update";
	private static final String DELETE_ACTION = "delete";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComplainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String action = request.getParameter("action");
		switch(action) {
		case DELETE_ACTION:
			if(id>0) {
				try {
					boolean isSuccess = new ComplainManagement().removeComplainById(id);
					if(isSuccess) {
						request.getRequestDispatcher("/complainDisplay.jsp").forward(request, response);
					}else {
						response.sendRedirect(request.getContextPath()+"/error.jsp");
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			break;
		case UPDATE_ACTION:
			HttpSession session = request.getSession(false);
			User user = (User)session.getAttribute("userdata");
			try {
				Complain complain = new ComplainManagement().findComplainByID(id, user.getId());
				request.setAttribute("complain", complain);
				request.getRequestDispatcher("/complainRegister.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Complain complain = new Complain();
		
		complain.setName(request.getParameter("complainerName"));
		complain.setEmail(request.getParameter("complainerEmail"));
		complain.setAddress(request.getParameter("complainerAddress"));
		complain.setContact(request.getParameter("complainerContact"));
		complain.setTitle(request.getParameter("complainerTitle"));
		complain.setDiscription(request.getParameter("complainerDiscription"));
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("userdata");
		if (user!=null) {
			complain.setUserId(user.getId());
			try {
				boolean isSuccess = false;
				if(request.getParameter("id") != null) {
					complain.setId(Integer.parseInt(request.getParameter("id")));
					isSuccess = new ComplainManagement().updateComplain(complain);
					
				}else {
					isSuccess = new ComplainManagement().saveComplain(complain);
				}
				if(isSuccess) {
					response.sendRedirect(request.getContextPath()+"/complainDisplay.jsp");
				}else {
					response.sendRedirect(request.getContextPath()+"/error.jsp");
				}
			}  catch (Exception e) {
				e.printStackTrace();
				response.sendRedirect(request.getContextPath()+"/error.jsp");
			}
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
			dispatcher.include(request, response);
		}
		
	}

}
