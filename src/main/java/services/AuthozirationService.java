package services;

import models.AuthorizationModel;

public class AuthozirationService {
    public boolean authenticate(String username, String password) {
        AuthorizationModel user = new AuthorizationModel(username, password);
        return user.isValidUser();
    }

}
