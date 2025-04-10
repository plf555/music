package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.SongList;

import java.util.Map;

/**
 * @description 歌单Service
 */
public interface SongListService {
    Map addSongList(SongList songList);

    Map getAllSongListPage(int pageSize, int pageNum, String title);

    SongList selectSongListById(Integer id);

    Map deleteSongList(Integer id);

    Map updateSongList(SongList songList);

    Map selectAllSongList();

    Map getAllSongListByKeywords(String keywords);

    Map getRecommendSongList(Integer userId);

    Map getRecommendSongListWithNoId();

    Map getRecommendList(Integer userId);


}
