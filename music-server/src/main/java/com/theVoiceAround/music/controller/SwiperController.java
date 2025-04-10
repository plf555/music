package com.theVoiceAround.music.controller;

import com.theVoiceAround.music.entity.Swiper;
import com.theVoiceAround.music.service.SwiperService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/swiper")
public class SwiperController {

    @Autowired
    private SwiperService swiperService;

    /**
     * 添加轮播图
     */
    @PostMapping("/addSwiper")
    public Map addSwiper(HttpServletRequest request, @RequestParam("file")MultipartFile mpFile){
        Map map = new HashMap();
        String singerId = request.getParameter("singerId").trim(); //绑定歌手id
        String singerName = request.getParameter("singerName").trim();  //绑定歌手名
        //获取文件类型
        String fileAllName = mpFile.getOriginalFilename();
        String fileType = fileAllName.substring(fileAllName.lastIndexOf("."),fileAllName.length());
        //上传图片文件
        if(mpFile.isEmpty() || (!fileType.equals(".jpg") && !fileType.equals(".png") && !fileType.equals(".jpeg"))){
            map.put(Consts.CODE,"0");
            map.put(Consts.MESSAGE,"轮播图添加失败, 上传文件为空或文件格式错误");
            return map;
        }
        String fileName = System.currentTimeMillis() + fileType;
        //去除字符中的所有空白字符和斜杠，这样是为了防止上传文件进入服务器因为由空格而访问不到对应资源
        fileName.replaceAll("\\s*", "");
        fileName.replaceAll("\\\\", "");
        String filePath = Consts.FILE_PATH + "/img/swiper";
        File file1 = new File(filePath);
        //如果文件路径不存在，则新增
        if(!file1.exists()){
            file1.mkdir();
        }
        //实际的文件地址
        File dest = new File(filePath + System.getProperty("file.separator") + fileName);
        //存储到数据库里的文件路径：相对路径
        String storeUrlPath = "/img/swiper/" + fileName;

        try {
            mpFile.transferTo(dest);
            Swiper swiper = new Swiper();
            if(singerId != null && !singerId.equals("")){
                swiper.setSingerId(Integer.parseInt(singerId));
            }
            swiper.setSingerName(singerName);
            swiper.setUrl(storeUrlPath);
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentTime = dateFormat.format(new Date());
            swiper.setUpdateTime(currentTime);
            map = swiperService.addSwiper(swiper);
            map.put("path",storeUrlPath);
            return map;
        } catch (IOException e) {
            e.printStackTrace();
            map.put(Consts.MESSAGE, "轮播图添加失败"+e.getMessage());
        } finally {
            return map;
        }
    }

    /**
     * 删除轮播图
     */
    @GetMapping("/deleteASwiper")
    public Map deleteASwiper(Integer swiperId){
        return swiperService.deleteASwiper(swiperId);
    }


    /**
     * 获取轮播图信息
     */
    @GetMapping("/getSwiperInfo")
    public Map getSwiperInfo(){
        return swiperService.getSwiperInfo();
    }

    /**
     * 修改歌手信息
     */
    @PostMapping("/updateSwiperInfo")
    public Map updateSwiperInfo(@RequestBody Swiper swiper){
        Map map = swiperService.updateSwiper(swiper);
        return map;
    }
    /**
     * 分页查询所有Swiper
     * params: 分页参数
     */
    @GetMapping("/getAllSwiper")
    public Map selectAllSingerPage(int pageSize, int pageNum){
        Map resultMap = swiperService.selectAllSwiper(pageSize, pageNum);
        return resultMap;
    }

}
