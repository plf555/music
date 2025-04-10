package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Consumer;

import java.util.List;
import java.util.Map;

/**
 * @description 客户端用户Service
 */
public interface ConsumerService {
    Map selectAllUserPage(int pageSize, int pageNum, String username);

    Map addConsumer(Consumer consumer);

    Consumer selectUserById(Integer id);

    Map deleteUser(Integer id);

    Map updateConsumer(Consumer consumer);

    Map selectAllConsumer();

    Map changePassword(String username, String password);

    /**
     * 验证密码
     */
    Consumer verifyPassword(String username, String password);

    String selectStyleById(Integer userId);
}
