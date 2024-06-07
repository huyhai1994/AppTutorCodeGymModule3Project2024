package controllers;

import services.AuthozirationService;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


@WebServlet(name = "AuthorizationServlet", urlPatterns = ControllersUrl.AUTHORIZATION)
public class AuthorizationServlet extends HttpServlet {
    private AuthozirationService authozirationService;


    @Override
    public void init(ServletConfig config) throws ServletException {
        this.authozirationService = new AuthozirationService();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String url = req.getPathInfo();
        switch (url) {
            case "/login":
                this.authozirationService.renderPageLogin(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        String url = req.getPathInfo();
        switch (url) {
            case "/login":
                try {
                    this.authozirationService.login(req, resp);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }
}
