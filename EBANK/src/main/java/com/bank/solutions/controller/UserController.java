package com.bank.solutions.controller;

import com.bank.solutions.model.Account;
import com.bank.solutions.model.Beneficiary;
import com.bank.solutions.model.ExternalAccountDetails;
import com.bank.solutions.model.User;
import com.bank.solutions.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping
    public List<User> getAllUsers() {
        return userService.findAll();
    }

    @GetMapping("/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        Optional<User> user = userService.findById(id);
        return user.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        return userService.save(user);
    }

    @PutMapping("/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody User userDetails) {
        Optional<User> user = userService.findById(id);
        if (user.isPresent()) {
            User updatedUser = user.get();
            updatedUser.setName(userDetails.getName());
            updatedUser.setEmail(userDetails.getEmail());
            updatedUser.setPassword(userDetails.getPassword());
            userService.save(updatedUser);
            return ResponseEntity.ok(updatedUser);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        if (userService.findById(id).isPresent()) {
            userService.deleteById(id);
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping("/{userId}/accounts")
    public ResponseEntity<Account> createAccountForUser(@PathVariable Long userId, @RequestBody Account accountRequest) {
        Account account = userService.createAccountForUser(userId, accountRequest.getType(), accountRequest.getBalance());
        if (account != null) {
            return ResponseEntity.ok(account);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/{userId}/accounts")
    public ResponseEntity<List<Account>> getUserAccounts(@PathVariable Long userId) {
        User user = userService.getUserById(userId);
        if (user == null) {
            return ResponseEntity.notFound().build();
        }
        List<Account> accounts = user.getAccounts();
        return ResponseEntity.ok(accounts);
    }

    @PostMapping("/{userId}/transfer")
    public ResponseEntity<String> transferMoney(
            @PathVariable Long userId,
            @RequestParam Double amount,
            @RequestParam Long fromAccountId,
            @RequestParam Long toAccountId,
            @RequestParam String description) {
        try {
            userService.transferMoney(userId, amount, fromAccountId, toAccountId, description);
            return ResponseEntity.ok("Money transferred successfully");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/{userId}/transfer-external")
    public ResponseEntity<String> transferMoneyExternal(
            @PathVariable Long userId,
            @RequestParam Double amount,
            @RequestParam Long fromAccountId,
            @RequestBody ExternalAccountDetails toAccountDetails,
            @RequestParam String description) {
        try {
            userService.transferMoneyExternal(userId, amount, fromAccountId, toAccountDetails, description);
            return ResponseEntity.ok("Money transferred externally successfully");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @PostMapping("/{userId}/beneficiaries")
    public ResponseEntity<String> addBeneficiary(
            @PathVariable Long userId,
            @RequestBody Beneficiary beneficiary) {
        try {
            userService.addBeneficiary(userId, beneficiary);
            return ResponseEntity.ok("Beneficiary added successfully");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }

    @DeleteMapping("/{userId}/beneficiaries/{beneficiaryId}")
    public ResponseEntity<String> removeBeneficiary(
            @PathVariable Long userId,
            @PathVariable Long beneficiaryId) {
        try {
            userService.removeBeneficiary(userId, beneficiaryId);
            return ResponseEntity.ok("Beneficiary removed successfully");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }

    }
    @PostMapping("/{userId}/transfer-to-beneficiary")
    public ResponseEntity<String> transferMoneyToBeneficiary(
            @PathVariable Long userId,
            @RequestParam Double amount,
            @RequestParam Long fromAccountId,
            @RequestParam Long beneficiaryId,
            @RequestParam String description) {
        try {
            userService.transferMoneyToBeneficiary(userId, amount, fromAccountId, beneficiaryId, description);
            return ResponseEntity.ok("Money transferred to beneficiary successfully");
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }


}
