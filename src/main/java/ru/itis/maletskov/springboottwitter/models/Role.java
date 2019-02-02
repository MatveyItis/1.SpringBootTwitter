package ru.itis.maletskov.springboottwitter.models;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    USER;

    public String getAuthority() {
        return name();
    }
}
