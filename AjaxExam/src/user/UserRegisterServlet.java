package user;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/UserRegisterServlet")
public class UserRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		String userPhone = request.getParameter("userPhone");
		response.getWriter().write(register(userName, userAge, userGender, userEmail, userPhone));
	}
	
	public String register(String userName, String userAge, String userGender, String userEmail, String userPhone) {
		return Integer.toString(UserDAO.insert(userName, Integer.parseInt(userAge), userGender, userEmail, userPhone));
	}
}