package com.theVoiceAround.music.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName("swiper")
public class Swiper {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 轮播图资源相对路径
     */
    @TableField("url")
    private String url;

    /**
     * 绑定歌手ID
     */
    @TableField("singer_id")
    private Integer singerId;

    /**
     * 绑定歌手名
     */
    @TableField("singer_name")
    private String singerName;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private String updateTime;

}
