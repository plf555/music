package com.theVoiceAround.music.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.theVoiceAround.music.entity.ListSong;

import java.util.List;

/**
 * @description 歌单里面歌曲Mapper
 */
public interface ListSongMapper extends BaseMapper<ListSong>{

    List getListSong(Integer sogListId);
}
