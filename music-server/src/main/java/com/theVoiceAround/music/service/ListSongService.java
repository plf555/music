package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.ListSong;

import java.util.Map;

/**
 * @description 歌单歌曲Service
 */
public interface ListSongService {
    Map getListSong(Integer songListId);

    Map addSongToSongList(ListSong listSong);

    Map deleteASongFromSongList(Integer songListId, Integer songId);
}
