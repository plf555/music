package com.theVoiceAround.music.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.theVoiceAround.music.entity.Message;
import com.theVoiceAround.music.entity.Singer;
import com.theVoiceAround.music.mapper.MessageMapper;
import com.theVoiceAround.music.service.MessageService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Service
public class MessageServiceImpl implements MessageService {

    @Autowired
    private MessageMapper messageMapper;

    @Override
    public Map addMessage(Message message) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = dateFormat.format(new Date());
        message.setTime(currentTime);
        Map map = new HashMap<>();
        messageMapper.insert(message);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "留言成功");
        return map;
    }

    @Override
    public Map selectAllMessagePage(int pageSize, int pageNum, String content) {
        QueryWrapper<Message> queryWrapper = new QueryWrapper<>();
        if(content != null && !content.equals("")){
            queryWrapper.like("content", content);
        }
        Map map = new HashMap<>();
        IPage<Message> iPage = new Page<>(pageNum, pageSize);
        IPage<Message> messageIPage = messageMapper.selectPage(iPage, queryWrapper);
        long total = messageIPage.getTotal();
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", messageIPage);
        map.put("total", total);
        return map;
    }

    @Override
    public Map deleteMessage(Integer id) {
        Map map = new HashMap<>();
        if(id != null && id != 0){
            messageMapper.deleteById(id);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "删除成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "删除失败, 留言ID错误");
        }
        return map;
    }
}
