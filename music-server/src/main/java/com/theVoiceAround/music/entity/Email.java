package com.theVoiceAround.music.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("email")
public class Email {
    /**
     * 主键id
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户名
     */
    @TableField("username")
    private String username;

    /**
     * 邮箱号
     */
    @TableField("email_num")
    private String emailNum;

    /**
     * 邮箱验证码
     */
    @TableField("validate_code")
    private String validateCode;

    /**
     * 验证码生成时间
     */
    @TableField("create_time")
    private String createTime;

    /**
     * 验证码失效时间
     */
    @TableField("expire_time")
    private String expireTime;

}
