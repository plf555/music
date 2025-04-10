package com.theVoiceAround.music.controller;

import com.theVoiceAround.music.entity.Email;
import com.theVoiceAround.music.service.EmailService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@RestController
@RequestMapping("/email")
public class EmailController {
    @Autowired
    private JavaMailSender mailSender;//注入发送邮件的bean

    @Autowired
    private EmailService emailService;

    private static final String SYMBOLS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"; // 数字和26个字母组成

    private static final Random RANDOM = new SecureRandom();

    @GetMapping("/sendEmailCode")
    public void sendEmailCode(String username, String email) {
        Email email1 = new Email();
        String emailServiceCode = this.getRandomCode();
        //可以加入判断验证码是否已存在，已存在则重新随机
        //立即设置插入email库的邮箱号
        email1.setValidateCode(emailServiceCode);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setSubject("[声临其境]修改密码验证码");// 邮箱标题
        message.setText("找回密码的验证码是：" + emailServiceCode + "。该验证码3分钟内有效。");// 邮箱内容
        message.setFrom("573618801@qq.com"); // 发件人邮箱
        message.setTo(email); // 收件人邮箱
        mailSender.send(message);
        //插入用户名，邮箱号，验证码，验证码生成时间（当前时间），验证码到期时间（当前时间+3min）至数据库
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();
        //当前时间
        String currentTime = dateFormat.format(date);
        //当前时间+3分钟
        date.setTime(date.getTime() + 60*3000);
        String expireTime = dateFormat.format(date);

        email1.setUsername(username);
        email1.setEmailNum(email);
        email1.setCreateTime(currentTime);
        email1.setExpireTime(expireTime);
        emailService.addValidateHistory(email1);
    }

    /**
     * 校验邮箱和用户名是否匹配
     */
    @GetMapping("/validateEmailAndUsername")
    public Map validateEmailAndUsername(String username, String email) {
        return emailService.validateEmailAndUsername(username, email);
    }

    /**
     * 校验邮箱验证码是否匹配
     */
    @GetMapping("/validateEamilCode")
    public Map validateEamilCode(String validateCode) {
        Map map = new HashMap<>();
        if(validateCode != null && !validateCode.equals("")){
            //校验
            map = emailService.validateEamilCode(validateCode);
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "参数错误");
        }
        //验证失效时间
        return map;
    }


    /**
     * 获取长度为 6 的随机字母+数字
     */
    public static String getRandomCode() {
        char[] nonceChars = new char[6];  //指定长度为6位/自己可以要求设置

        for (int index = 0; index < nonceChars.length; ++index) {
            nonceChars[index] = SYMBOLS.charAt(RANDOM.nextInt(SYMBOLS.length()));
        }
        return new String(nonceChars);
    }

}


