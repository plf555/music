package com.theVoiceAround.music.controller;

import com.theVoiceAround.music.entity.Message;
import com.theVoiceAround.music.entity.Singer;
import com.theVoiceAround.music.service.MessageService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/message")
public class MessageController {

    @Autowired
    MessageService messageService;

    /**
     * 删除一条留言
     */
    @GetMapping("/deleteAMessage")
    public Map deleteASinger(int id){
        return messageService.deleteMessage(id);
    }

    /**
     * 分页查询所有歌手, 包含模糊搜索
     * params: 分页参数以及查询条件
     */
    @GetMapping("/allMessagePage")
    public Map selectAllMessagePage(int pageSize, int pageNum, String content){
        Map resultMap = messageService.selectAllMessagePage(pageSize, pageNum, content);
        return resultMap;
    }

    /**
     * 添加留言
     */
    @PostMapping("/addMessage")
    public Map addMessage(@RequestBody Message message){
        Map resultMap = new HashMap();
        if(message.getContent() != null && !message.getContent().equals("") && message.getType() != null && !message.getType().equals("")){
            resultMap = messageService.addMessage(message);
            return resultMap;
        }else if(message.getContent() == null || message.getContent().equals("")){
            resultMap.put(Consts.CODE, "0");
            resultMap.put(Consts.MESSAGE, "留言内容不能为空");
            return resultMap;
        }else if(message.getType() == null || message.getType().equals("")){
            resultMap.put(Consts.CODE, "0");
            resultMap.put(Consts.MESSAGE, "请选择留言类型");
            return resultMap;
        }else {
            resultMap.put(Consts.CODE, "0");
            resultMap.put(Consts.MESSAGE, "出现内部异常");
            return resultMap;
        }
    }
}
