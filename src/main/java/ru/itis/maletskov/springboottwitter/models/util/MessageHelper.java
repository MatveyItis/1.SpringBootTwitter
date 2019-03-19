package ru.itis.maletskov.springboottwitter.models.util;

import ru.itis.maletskov.springboottwitter.models.User;

public abstract class MessageHelper {
    public static String getAuthorName(User author) {
        return author != null ? author.getUsername() : "<none>";
    }
}
