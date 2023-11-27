package pl.coderslab.charity.User;



public interface UserService {
    UserEntity findUserByEmail(String email);
    void saveUser(UserEntity user);
}
