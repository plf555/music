package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Message;

import java.util.Map;

public interface MessageService {
    Map addMessage(Message message);

    Map selectAllMessagePage(int pageSize, int pageNum, String content);

    Map deleteMessage(Integer id);
}
