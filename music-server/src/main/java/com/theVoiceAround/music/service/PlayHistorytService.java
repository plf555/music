package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Collect;

import java.util.Map;

/**
 * @description 播放记录Service
 */
public interface PlayHistorytService {

    Map getHistoryByUserId(Integer userId);

    void createPlayHistory(Integer userId, Integer songId);
}
