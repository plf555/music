package com.theVoiceAround.music.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @description 类注释
 */
@Data
@TableName("download_history")
public class DownloadHistory implements Serializable {
    /**
     * 主键
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 用户id
     */
    @TableField("user_id")
    private Integer userId;

    /**
     * 歌曲id
     */
    @TableField("song_id")
    private Integer songId;

    /**
     * 播放时间
     */
    @TableField("download_time")
    private String downloadTime;

    /**
     * 歌手名
     */
    @TableField(exist = false)
    private String singerName;

    /**
     * 专辑
     */
    @TableField(exist = false)
    private String songAlbum;

    /**
     * 歌词
     */
    @TableField(exist = false)
    private String songLyric;

    /**
     * 歌曲名
     */
    @TableField(exist = false)
    private String songName;

    /**
     * 歌曲图片
     */
    @TableField(exist = false)
    private String songPic;

    /**
     * 歌曲地址
     */
    @TableField(exist = false)
    private String songUrl;
}
