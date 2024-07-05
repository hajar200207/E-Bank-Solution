package com.bank.solutions.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GenerationType;
import jakarta.persistence.*;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;
    private String name;
    private String email;
    private String password;

    @OneToMany(mappedBy = "user", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Account> accounts = new ArrayList<>();

    public Account createAccount(String type, Double initialBalance) {
        Account account = new Account();
        account.setType(type);
        account.setBalance(initialBalance);
        account.setCreationDate(new Date());
        this.accounts.add(account);
        account.setUser(this);
        return account;
    }


}
