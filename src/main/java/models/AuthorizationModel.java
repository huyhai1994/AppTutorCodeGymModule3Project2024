package models;

public class AuthorizationModel {
    private String username;
    private String password;

    public AuthorizationModel(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    // Phương thức kiểm tra thông tin đăng nhập (giả lập kiểm tra tĩnh)
    public boolean isValidUser() {
        // Ở đây, kiểm tra username và password tĩnh. Có thể thay thế bằng kiểm tra từ DB.
        return "admin".equals(username) && "password".equals(password);
    }
}
