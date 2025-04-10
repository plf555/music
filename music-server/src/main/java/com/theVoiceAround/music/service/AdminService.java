package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Admin;

import java.util.List;

/**
 * @description 管理员Service
 */
public interface AdminService { //可以继承IService提供更多的查询接口
    /**
     * 验证密码
     */
    List<Admin> verifyPassword(String username, String password);
}
