package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Collect;

import java.util.Map;

/**
 * @description 收藏Service
 */
public interface CollectService {

    Map addCollect(Collect collect);

    String getACollect(Integer userId, Integer songId);

    Map getCollectByUserId(Integer userId);

    Map deleteACollect(Integer userId, Integer songId);
}
