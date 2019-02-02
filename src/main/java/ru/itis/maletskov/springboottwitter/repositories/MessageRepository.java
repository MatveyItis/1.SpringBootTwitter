package ru.itis.maletskov.springboottwitter.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.itis.maletskov.springboottwitter.models.Message;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findByTag(String tag);
}
