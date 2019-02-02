package ru.itis.maletskov.springboottwitter.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import ru.itis.maletskov.springboottwitter.models.Message;
import ru.itis.maletskov.springboottwitter.repositories.MessageRepository;

import java.util.List;
import java.util.Map;

@Controller
public class MainController {
    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model) {
        model.put("messages", messageRepository.findAll());
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(@RequestParam String text,
                             @RequestParam String tag,
                             Map<String, Object> model) {
        Message message = new Message(text, tag);
        messageRepository.save(message);
        model.put("messages", messageRepository.findAll());
        return "main";
    }

    @PostMapping("filter")
    public String filter(@RequestParam String filter,
                         Map<String, Object> model) {
        Iterable<Message> messages;
        if (filter != null && !filter.equals("")) {
            messages = messageRepository.findByTag(filter);
        } else {
            messages = messageRepository.findAll();
        }
        model.put("messages", messages);
        return "main";
    }

}
