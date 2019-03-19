package ru.itis.maletskov.springboottwitter.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import ru.itis.maletskov.springboottwitter.models.Message;
import ru.itis.maletskov.springboottwitter.models.User;
import ru.itis.maletskov.springboottwitter.repositories.MessageRepository;

import javax.persistence.EntityManager;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private EntityManager entityManager;

    public Page<Message> messageList(String filter, Pageable pageable) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepository.findByTag(filter, pageable);
        } else {
            return messageRepository.findAll(pageable);
        }
    }

    public Page<Message> messageListForUser(User author, Pageable pageable) {
        return messageRepository.findByAuthor(author, pageable);
    }
}
