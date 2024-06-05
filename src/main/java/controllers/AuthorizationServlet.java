package controllers;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet(name = "AuthorizationServlet", urlPatterns = ControllersUrl.AUTHORIZATION)
public class AuthorizationServlet extends HttpServlet {

    @Override
    public void init(ServletConfig config) throws ServletException {
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Lấy thông tin người dùng và mật khẩu từ request
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String action = req.getParameter("action");

        HttpSession session = req.getSession();
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        if ("login".equals(action)) {
            // Kiểm tra thông tin đăng nhập (ở đây đơn giản kiểm tra tĩnh, bạn có thể kết nối DB để kiểm tra)
            if ("admin".equals(username) && "password".equals(password)) {
                // Đăng nhập thành công
                session.setAttribute("username", username);
            } else {
                // Đăng nhập thất bại
                out.println("<html><body>");
                out.println("<h3>Invalid username or password</h3>");
                out.println("<a href='/authorization/login.jsp'>Try again</a>");
                out.println("</body></html>");
            }
        } else if ("logout".equals(action)) {
            // Xử lý đăng xuất
            session.invalidate();
            resp.sendRedirect("/authorization/login.jsp");
        }
    }
}
