package com.theVoiceAround.music.controller;

import com.alibaba.fastjson.JSON;
import com.theVoiceAround.music.entity.Admin;
import com.theVoiceAround.music.service.AdminService;
import com.theVoiceAround.music.utils.Consts;
import com.theVoiceAround.music.utils.MD5Encryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
public class AdminController {

    @Autowired
    private AdminService adminService;

    /**
     * 判断登录是否成功
     */
    @PostMapping("/admin/login")
    public Map loginStatus(@RequestBody String params, HttpSession session){
        Map map = new HashMap();
        Map paramsMap = JSON.parseObject(params);
        String username = (String) paramsMap.get("name");
        String password = (String) paramsMap.get("password");
//        String password = MD5Encryptor.EncoderBySpring(password_tmp);
        List<Admin> resultList = adminService.verifyPassword(username, password);
        if(!resultList.isEmpty()){
            map.put(Consts.CODE, 1);
            map.put(Consts.MESSAGE, "登录成功");
            session.setAttribute(Consts.USERNAME,username);
        }else{
            map.put(Consts.CODE, 0);
            map.put(Consts.MESSAGE,"用户名或密码错误");
        }

        return map;
    }
}
