package com.theVoiceAround.music.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.theVoiceAround.music.entity.Collect;
import com.theVoiceAround.music.entity.Score;

import java.util.List;

/**
 * @description 收藏Mapper
 */
public interface CollectMapper extends BaseMapper<Collect> {
    List<Score> selectCollect();
}
