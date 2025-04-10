package com.theVoiceAround.music.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @description 歌曲实体类
 */

@Data
@TableName("song")
public class Song implements Serializable {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 歌手id
     */
    @TableField("singer_id")
    private Integer singerId;

    /**
     * 歌曲名称
     */
    @TableField("name")
    private String name;

    /**
     * 所在专辑
     */
    @TableField("album")
    private String album;

    /**
     * 创建时间
     */
    @TableField("create_time")
    private String createTime;

    /**
     * 更新时间
     */
    @TableField("update_time")
    private String updateTime;

    /**
     * 歌曲封面图片
     */
    @TableField("pic")
    private String pic;

    /**
     * 歌词
     */
    @TableField("lyric")
    private String lyric;

    /**
     * 歌曲地址
     */
    @TableField("url")
    private String url;

    /**
     * 播放次数
     */
    @TableField("play_count")
    private String playCount;

    /**
     * 歌曲风格
     */
    @TableField("style")
    private String style;

    /**
     * 歌手名
     */
    @TableField(exist = false)
    private String singerName;




}
