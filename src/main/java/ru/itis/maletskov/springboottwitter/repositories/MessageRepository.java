package ru.itis.maletskov.springboottwitter.repositories;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.query.Param;
import ru.itis.maletskov.springboottwitter.models.Message;
import ru.itis.maletskov.springboottwitter.models.User;

public interface MessageRepository extends JpaRepository<Message, Long> {
    Page<Message> findByTag(String tag, Pageable pageable);

    Page<Message> findAll(Pageable pageable);

    Page<Message> findByAuthor(@Param("author") User user, Pageable pageable);
}
