package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Email;

import java.util.Map;

public interface EmailService {
    Map validateEmailAndUsername(String username, String email);

    Map validateEamilCode(String validateCode);

    void addValidateHistory(Email email);
}
