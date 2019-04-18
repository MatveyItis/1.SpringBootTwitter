package ru.itis.maletskov.springboottwitter.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import ru.itis.maletskov.springboottwitter.models.Message;
import ru.itis.maletskov.springboottwitter.models.User;
import ru.itis.maletskov.springboottwitter.models.dto.MessageDto;
import ru.itis.maletskov.springboottwitter.repositories.MessageRepository;

import javax.persistence.EntityManager;

@Service
public class MessageService {
    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private EntityManager entityManager;

    public Page<MessageDto> messageList(String filter, Pageable pageable, User user) {
        if (filter != null && !filter.isEmpty()) {
            return messageRepository.findByTag(filter, pageable, user);
        } else {
            return messageRepository.findAll(pageable, user);
        }
    }

    public Page<MessageDto> messageListForUser(Pageable pageable, User currentUser, User author) {
        return messageRepository.findByUser(pageable, author, currentUser);
    }
}
