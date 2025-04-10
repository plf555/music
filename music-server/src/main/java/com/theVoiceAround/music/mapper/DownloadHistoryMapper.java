package com.theVoiceAround.music.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.theVoiceAround.music.entity.DownloadHistory;

import java.util.List;

public interface DownloadHistoryMapper extends BaseMapper<DownloadHistory> {
    List getHistoryByUserId(Integer userId);

    List selectHear(Integer userId);
}
