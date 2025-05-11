package com.theVoiceAround.music.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.theVoiceAround.music.entity.SongList;

import java.util.List;

/**
 * @description 歌单Mapper
 */
public interface SongListMapper extends BaseMapper<SongList>{
    List getAllSongListByKeywords(String keywords);
}
