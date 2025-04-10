package com.theVoiceAround.music.controller;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.theVoiceAround.music.entity.Comment;
import com.theVoiceAround.music.entity.Consumer;
import com.theVoiceAround.music.mapper.CommentMapper;
import com.theVoiceAround.music.service.CommentService;
import com.theVoiceAround.music.service.ConsumerService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/consumer")
public class ConsumerController {

    @Autowired
    private ConsumerService consumerService;

    @Autowired
    private CommentMapper commentMapper;

    /**
     * 用户登录
     */
    @PostMapping("/login")
    public Map consumerLogin(@RequestBody String params, HttpSession session){
        Map map = new HashMap();
        Map paramsMap = JSON.parseObject(params);
        String username = (String) paramsMap.get("name");
        String password = (String) paramsMap.get("password");
        Consumer consumer = consumerService.verifyPassword(username, password);
        if(consumer != null){
            map.put(Consts.CODE, 1);
            map.put(Consts.MESSAGE, "登录成功");
            map.put("id", consumer.getId());
            map.put("username", consumer.getUsername());
            map.put("avatar", consumer.getAvatar());
            session.setAttribute(Consts.USERNAME,username);
        }else{
            map.put(Consts.CODE, 0);
            map.put(Consts.MESSAGE,"用户名或密码错误");
        }

        return map;
    }

    /**
     * 添加用户
     */
    @PostMapping("/addConsumer")
    public Map addSinger(@RequestBody Consumer consumer){
        Map map = consumerService.addConsumer(consumer);
        return map;
    }

    /**
     * 分页查询所有用户, 包含模糊搜索
     * params: 分页参数以及查询条件
     */
    @GetMapping("/allConsumerPage")
    public Map selectAllUserPage(int pageSize, int pageNum, String username){
        Map resultMap = consumerService.selectAllUserPage(pageSize, pageNum, username);
        return resultMap;
    }

    /**
     * 查询所有用户
     */
    @GetMapping("/getAllConsumer")
    public Map getAllConsumer(){
        return consumerService.selectAllConsumer();
    }

    /**
     * 删除一名用户
     */
    @GetMapping("/deleteAConsumer")
    public Map deleteAConsumer(int id){
        //删除前查询出旧文件路径
        Consumer consumer1 = consumerService.selectUserById(id);
        String oldFilePath = consumer1.getAvatar();
        Map map = consumerService.deleteUser(id);
        //删除用户后将其头像删除
        if(consumer1 != null && !oldFilePath.equals(Consts.DEFAULT_MALE_AVATAR_PATH)
                && !oldFilePath.equals(Consts.DEFAULT_FEMALE_AVATAR_PATH)){
            File oldFile = new File(Consts.FILE_PATH + oldFilePath);
            oldFile.delete();
        }
        //同时删除该用户在评论表中的信息
        QueryWrapper<Comment> queryWrapper = new QueryWrapper<>();
        commentMapper.delete(queryWrapper.eq("consumer_id", id));
//        //同时删除该歌手所拥有的歌曲，并且返回这些歌曲的id用作删除歌单中歌曲
//        List songIdList = songService.deleteSongBySingerId(id);
//        //根据上面得到的歌曲id，删除歌单里面拥有该歌手歌曲的数据
//        for(int i=0; i<songIdList.size(); i++){
//            listSongServiceImpl.deleteASongFromSongList((Integer) songIdList.get(i));
//        }
        return map;
    }

    /**
     * 修改用户信息
     */
    @PostMapping("/updateConsumerInfo")
    public Map updateSingerInfo(@RequestBody Consumer consumer){
        Map map = consumerService.updateConsumer(consumer);
        return map;
    }

    /**
     * 根据用户id查询用户的详细信息
     */
    @GetMapping("/selectInfoById")
    public Map selectInfoById(int id){
        Map map = new HashMap();
        Consumer consumer = consumerService.selectUserById(id);
        if(consumer != null){
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "查询成功");
            map.put("data", consumer);
        }else {
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "未找到记录");
        }
        return map;
    }

    /**
     * 曲风查询
     */
    @GetMapping("/selectStyleById")
    public Map selectStyleById(int id){
        Map map = new HashMap();
        String style = consumerService.selectStyleById(id);
        if(style != null){
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "查询成功");
            map.put("data", style);
        }else {
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "未找到记录");
        }
        return map;
    }

    /**
     * 修改密码
     */
    @PostMapping("/changePassword")
    public Map changePassword(@RequestBody String params){
        Map map = new HashMap();
        Map paramsMap = JSON.parseObject(params);
        String username = (String) paramsMap.get("username");
        String password = (String) paramsMap.get("password");
        if(username != null && !username.equals("") && password != null && !password.equals("")){
            return consumerService.changePassword(username, password);
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "输入错误");
            return map;
        }
    }


    /**
     * 更新用户头像
     */
    @PostMapping("/updateConsumerAvatar")
    public Map updateConsumerAvatar(@RequestParam("file") MultipartFile avatarFile, @RequestParam("id") int id){
        Map map = new HashMap();
        if(avatarFile.isEmpty()){ //前端做了类型判断，此处不再判断
            map.put(Consts.CODE, 0);
            map.put(Consts.MESSAGE, "文件为空");
            return map;
        }
        //文件名等于当前时间 + 源文件名
        String fileName = System.currentTimeMillis() + avatarFile.getOriginalFilename();
        //去除字符中的所有空白字符，这样是为了防止上传文件进入服务器因为由空格而访问不到对应资源
        fileName.replaceAll("\\s*", "");
        String filePath = Consts.FILE_PATH + Consts.AVATAR_PATH;
        File file1 = new File(filePath);
        //如果文件路径不存在，则新增
        if(!file1.exists()){
            file1.mkdir();
        }
        //实际的文件地址
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        //存储到数据库里的文件路径：相对路径
        String storeDBPath = Consts.AVATAR_PATH + "/" + fileName;
        try {
            //更新前查询出旧文件路径
            Consumer consumer1 = consumerService.selectUserById(id);
            String oldFilePath = consumer1.getAvatar();
            avatarFile.transferTo(dest);
            Consumer consumer = new Consumer();
            consumer.setId(id);
            consumer.setAvatar(storeDBPath);
            map = consumerService.updateConsumer(consumer);
            //更新成功后删除旧文件
            if(consumer1 != null && !oldFilePath.equals(Consts.DEFAULT_FEMALE_AVATAR_PATH) &&
                    !oldFilePath.equals(Consts.DEFAULT_MALE_AVATAR_PATH)){
                File oldFile = new File(Consts.FILE_PATH + oldFilePath);
                oldFile.delete();
            }
            map.put(Consts.MESSAGE, "上传成功");
            map.put("avatar",storeDBPath);
            return map;
        } catch (IOException e) {
            e.printStackTrace();
            map.put(Consts.MESSAGE, "上传失败"+e.getMessage());
        } finally {
            return map;
        }
    }
}
