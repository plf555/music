package com.theVoiceAround.music.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.theVoiceAround.music.entity.Comment;
import com.theVoiceAround.music.entity.LikeRecords;
import com.theVoiceAround.music.entity.Score;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Taliy4h
 * @date 2021/3/15 14:56
 * @description 歌曲或歌单评论Mapper
 */
public interface CommentMapper extends BaseMapper<Comment>{
    List getCommentBySongListId(Integer songListId);

//    LikeRecords getLikeRecords(@Param("commentId") Integer commentId, @Param("userId")Integer userId);
    List<Score> selectComment();
}
