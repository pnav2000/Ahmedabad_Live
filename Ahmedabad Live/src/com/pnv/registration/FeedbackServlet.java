package com.pnv.registration;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pnv.dbconnection.FeedbackManagement;
import com.pnv.module.Feedback;
import com.pnv.module.User;

/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet("/feedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackServlet() {
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
		Feedback feedback =  new Feedback();
		feedback.setName(request.getParameter("feedbackName"));
		feedback.setEmail(request.getParameter("feedbackEmail"));
		feedback.setTitle(request.getParameter("feedbackTitle"));
		feedback.setDiscription(request.getParameter("feedbackDiscription"));
		
		HttpSession session = request.getSession(false);
		User user =(User)session.getAttribute("userdata");
		if(user!=null) {
			feedback.setUser_id(user.getId());
			try {
				boolean isSuccess = new FeedbackManagement().saveFeedback(feedback);
				if(isSuccess) {
					request.getRequestDispatcher("/welcome.jsp").forward(request, response);
				}else {
					response.sendRedirect(request.getContextPath()+"error.jsp");
				}
			}catch (Exception e){
				e.printStackTrace();
				response.sendRedirect(request.getContextPath()+("/error.jsp"));
			}
		}else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
			dispatcher.include(request, response);
		}
		
		
	}

}
