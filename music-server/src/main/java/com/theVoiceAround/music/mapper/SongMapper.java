package com.theVoiceAround.music.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.theVoiceAround.music.entity.Song;

import java.io.Serializable;
import java.util.List;

/**
 * @author Taliy4h
 * @date 2021/2/22 17:40
 * @description 歌曲Mapper
 */
public interface SongMapper extends BaseMapper<Song> {
    List getAllSongByKeywords(String keywords);

    List selectAllSongBySingerIdAlias(Integer singerId);

    List getASongBySongIdAlias(Integer id);

    //播放量top50
    List getRankList();

    void increasePlayCount(Integer songId);

    String getSingerNameBySongId(Integer songId);

    Song getASongBySongId(Integer songId);

}
