package com.theVoiceAround.music.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.theVoiceAround.music.entity.Singer;
import com.theVoiceAround.music.mapper.SingerMapper;
import com.theVoiceAround.music.service.SingerService;
import com.theVoiceAround.music.utils.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Taliy4h
 * @date 2021/2/3 14:34
 * @description 歌手Service实现类
 */
@Service
public class SingerServiceImpl implements SingerService {

    @Autowired
    private SingerMapper singerMapper;

    @Override
    public Map addSinger(Singer singer) {
        Map map = new HashMap<>();
        if(singer != null && !singer.getName().equals("")){
            singer.setPic(Consts.DEFAULT_SINGER_PIC_PATH);
            singerMapper.insert(singer);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "添加成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "添加失败, 歌手姓名不能为空");
        }

        return map;
    }

    @Override
    public Map getSingerById(Integer singerId) {
        Map map = new HashMap<>();
        if(singerId != null && !singerId.equals("")){
            map.put(Consts.CODE, "1");
            map.put("data",singerMapper.selectById(singerId));
            map.put(Consts.MESSAGE, "查询成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "查询失败");
        }
        return map;
    }

    @Override
    public Map getSingerByPicName(String picName) {
        Map map = new HashMap<>();
        if(picName != null && !picName.equals("")){
            if(picName.indexOf(".") != -1){
                picName = picName.substring(0, picName.indexOf(".")).substring(picName.lastIndexOf("/") + 1);
                map.put(Consts.CODE, "1");
                map.put("data",singerMapper.getSingerByPicName(picName));
                map.put(Consts.MESSAGE, "查询成功");
            }
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "查询失败, 图片名不能为空");
        }

        return map;
    }

    @Override
    public Map updateSinger(Singer singer) {
        //基于主键修改
        Map map = new HashMap<>();
        if(singer != null){
            singerMapper.updateById(singer);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "修改成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "修改失败, 歌手为空");
        }
        return map;
    }

    @Override
    public Map deleteSinger(Integer id) {
        Map map = new HashMap<>();
        if(id != null && id != 0){
            singerMapper.deleteById(id);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "删除成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "删除失败, 歌手ID错误");
        }
        return map;
    }

    @Override
    public Map selectAllSingerPage(int pageSize, int pageNum, String singerName) {
        QueryWrapper<Singer> queryWrapper = new QueryWrapper<>();
        if(singerName != null && !singerName.equals("")){
            queryWrapper.like("name", singerName);
        }
        Map map = new HashMap<>();
        IPage<Singer> iPage = new Page<>(pageNum, pageSize);
        IPage<Singer> singerIPage = singerMapper.selectPage(iPage, queryWrapper);
        long total = singerIPage.getTotal();
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", singerIPage);
        map.put("total", total);
        return map;
    }

    @Override
    public Map selectAllSinger() {
        Map map = new HashMap();
        List<Singer> resultList = singerMapper.selectList(null);
        map.put("data", resultList);
        map.put("total", resultList.size());
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        return map;
    }

    @Override
    public Singer selectSingerById(Integer id) {
        return singerMapper.selectById(id);
    }


    @Override
    public Map selectSingerBySex(Integer sex) {
        Map map = new HashMap();
        if(sex != null && !sex.equals("")){
            List resultList = singerMapper.selectList(new QueryWrapper<Singer>().eq("sex", sex));
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "查询成功");
            map.put("data", resultList);
        }else {
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "参数错误");
        }
        return map;
    }
}
