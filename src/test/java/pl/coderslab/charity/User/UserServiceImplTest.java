package pl.coderslab.charity.User;

import org.junit.Before;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import pl.coderslab.charity.Role.RoleEntity;
import pl.coderslab.charity.Role.RoleRepository;

import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.jupiter.api.extension.ExtensionContext;
import org.junit.jupiter.api.extension.ParameterContext;
import org.junit.jupiter.api.extension.ParameterResolver;
import org.junit.jupiter.api.extension.RegisterExtension;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

class UserServiceImplTest {

    private UserRepository userRepositoryMock;
    private UserServiceImpl userService;

    private RoleRepository roleRepositoryMock;
    private BCryptPasswordEncoder passwordEncoder;

    public UserServiceImplTest(UserRepository userRepositoryMock, UserServiceImpl userService, RoleRepository roleRepositoryMock, BCryptPasswordEncoder passwordEncoder) {
        this.userRepositoryMock= userRepositoryMock;
        this.userService = userService;
        this.roleRepositoryMock = roleRepositoryMock;
        this.passwordEncoder = passwordEncoder;
    }

    @Before
    public void setup() {

        userRepositoryMock = mock(UserRepository.class);
        roleRepositoryMock = mock(RoleRepository.class);
        userService = new UserServiceImpl(userRepositoryMock, roleRepositoryMock, passwordEncoder);

    }

    @Test
    void findUserByEmail() {

        Set<RoleEntity> roles = new HashSet<>(Arrays.asList((new RoleEntity(1, "ROLE_USER"))));
        UserEntity user = new UserEntity(1L, "Maciek", "admin@admin.pl", "bubel", roles);
        when(userRepositoryMock.findUserEntitiesByEmail("admin@admin.pl")).thenReturn(user);
        assertTrue(userService.findUserByEmail("admin@admin.pl")==userRepositoryMock.findUserEntitiesByEmail("admin@admin.pl"));
    }
}