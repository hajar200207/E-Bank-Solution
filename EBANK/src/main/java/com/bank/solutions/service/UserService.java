package com.bank.solutions.service;




import com.bank.solutions.model.Account;
import com.bank.solutions.model.User;
import com.bank.solutions.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    public List<User> findAll() {
        return userRepository.findAll();
    }

    public Optional<User> findById(Long id) {
        return userRepository.findById(id);
    }

    public User save(User user) {
        return userRepository.save(user);
    }

    public void deleteById(Long id) {
        userRepository.deleteById(id);
    }
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User getUserById(Long userId) {
        return userRepository.findById(userId).orElse(null);
    }

    public Account createAccountForUser(Long userId, String type, Double initialBalance) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null) {
            Account account = user.createAccount(type, initialBalance);
            userRepository.save(user);
            return account;
        }
        return null;
    }
}
