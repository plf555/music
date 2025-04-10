package com.theVoiceAround.music.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.theVoiceAround.music.entity.Consumer;
import com.theVoiceAround.music.entity.Email;
import com.theVoiceAround.music.mapper.ConsumerMapper;
import com.theVoiceAround.music.mapper.EmailMapper;
import com.theVoiceAround.music.service.EmailService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class EmailServiceImpl implements EmailService {

    @Autowired
    private EmailMapper emailMapper;

    @Autowired
    private ConsumerMapper consumerMapper;

    @Override
    public Map validateEmailAndUsername(String username, String email) {
        Map map = new HashMap<>();
        QueryWrapper<Consumer> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("username", username).eq("email", email);
        Consumer consumer = consumerMapper.selectOne(queryWrapper);
        if(consumer != null){
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "验证码已发送至邮箱");
            return map;
        }else {
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "用户名与邮箱不匹配");
            return map;
        }
    }

    @Override
    public Map validateEamilCode(String validateCode) {
        Map map = new HashMap<>();
        //查找记录
        QueryWrapper<Email> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("validate_code",validateCode);
        Email email1 = emailMapper.selectOne(queryWrapper);
        if(email1 != null){
            //校验失效时间
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            //当前时间
            String currentTime1 = dateFormat.format(date);
            //失效时间
            String expireTime1 = email1.getExpireTime();
            try {
                Date expireTime = dateFormat.parse(expireTime1);
                Date currentTime = dateFormat.parse(currentTime1);
                boolean expired = currentTime.before(expireTime);
                //如果当前时间 < 失效时间，则未失效
                if(expired){
                    map.put(Consts.CODE, "1");
                    map.put(Consts.MESSAGE, "验证成功");
                }else {
                    map.put(Consts.CODE, "0");
                    map.put(Consts.MESSAGE, "验证码已失效");
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "验证码错误");
        }

        return map;
    }

    @Override
    public void addValidateHistory(Email email) {
        emailMapper.insert(email);
    }
}
