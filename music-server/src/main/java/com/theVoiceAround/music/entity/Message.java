package com.theVoiceAround.music.entity;


import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

@Data
@TableName("message")
public class Message implements Serializable {

    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 留言内容
     */
    @TableField("content")
    private String content;

    /**
     * 留言时间
     */
    @TableField("time")
    private String time;

    /**
     * 留言类型
     */
    @TableField("type")
    private String type;

    /**
     * 留言类型
     */
    @TableField("contact")
    private String contact;
}
