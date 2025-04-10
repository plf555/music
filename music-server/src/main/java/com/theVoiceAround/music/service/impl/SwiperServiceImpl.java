package com.theVoiceAround.music.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.theVoiceAround.music.entity.Swiper;
import com.theVoiceAround.music.mapper.SwiperMapper;
import com.theVoiceAround.music.service.SwiperService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SwiperServiceImpl implements SwiperService {

    @Autowired
    private SwiperMapper swiperMapper;
    @Override
    public Map getSwiperInfo() {
        Map map = new HashMap();
        List resultList = swiperMapper.selectList(null);
        map.put(Consts.CODE,"1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", resultList);
        return map;
    }

    @Override
    public Map selectAllSwiper(int pageSize, int pageNum) {
        QueryWrapper<Swiper> queryWrapper = new QueryWrapper<>();
        Map map = new HashMap<>();
        IPage<Swiper> iPage = new Page<>(pageNum, pageSize);
        IPage<Swiper> swiperIPage = swiperMapper.selectPage(iPage, queryWrapper);
        long total = swiperIPage.getTotal();
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", swiperIPage);
        map.put("total", total);
        return map;
    }

    @Override
    public Map addSwiper(Swiper swiper) {
        Map map = new HashMap<>();
        if(swiper.getSingerId() != null && !swiper.getSingerId().equals("")){
            swiperMapper.insert(swiper);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "添加成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "添加失败");
        }

        return map;
    }

    @Override
    public Map updateSwiper(Swiper swiper) {
        //基于主键修改
        Map map = new HashMap<>();
        if(swiper != null){
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String currentTime = dateFormat.format(new Date());
            swiper.setUpdateTime(currentTime);
            swiperMapper.updateById(swiper);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "修改成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "修改失败, swiper为空");
        }
        return map;
    }

    @Override
    public Map deleteASwiper(Integer swiperId) {
        Map map = new HashMap();
        System.out.println("swiperId:" + swiperId);
        if(swiperId != null && !swiperId.equals("")){
            swiperMapper.deleteById(swiperId);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "删除成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "ID不能为空");
        }
        return map;
    }
}
