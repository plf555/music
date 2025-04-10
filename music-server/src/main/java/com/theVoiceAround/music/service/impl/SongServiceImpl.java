package com.theVoiceAround.music.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.theVoiceAround.music.entity.DownloadHistory;
import com.theVoiceAround.music.entity.Song;
import com.theVoiceAround.music.mapper.SongMapper;
import com.theVoiceAround.music.mapper.DownloadHistoryMapper;
import com.theVoiceAround.music.service.PlayHistorytService;
import com.theVoiceAround.music.service.SongService;
import com.theVoiceAround.music.utils.Consts;
import com.theVoiceAround.music.utils.TypeConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Taliy4h
 * @date 2021/2/22 17:46
 * @description 歌曲Service实现类
 */
@Service
public class SongServiceImpl implements SongService {
    @Autowired
    private SongMapper songMapper;

    @Autowired
    private PlayHistorytService playHistorytService;

    @Autowired
    private DownloadHistoryMapper downloadHistoryMapper;

    @Override
    public Map addSong(Song song) {
        Map map = new HashMap<>();
        if(song != null && !song.getName().equals("")){
            //执行添加
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentTime = dateFormat.format(new Date());
            song.setCreateTime(currentTime);
            songMapper.insert(song);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "添加成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "添加失败, 歌曲名不能为空");
        }
        return map;
    }

    @Override
    public Map selectSingerSongPage(int pageSize, int pageNum, String songName, int singerId) {
        QueryWrapper<Song> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("singer_id", singerId);
        if(songName != null && !songName.equals("")){
            queryWrapper.like("name", songName);
        }
        Map map = new HashMap<>();
        IPage<Song> iPage = new Page<>(pageNum, pageSize);
        IPage<Song> songIPage = songMapper.selectPage(iPage, queryWrapper);
        long total = songIPage.getTotal();
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", songIPage);
        map.put("total", total);
        return map;
    }

    @Override
    public Map selectAllSongBySingerId(Integer singerId) {
        Map map = new HashMap();
        QueryWrapper<Song> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("singer_id", singerId);
        map.put("data", songMapper.selectList(queryWrapper));
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        return map;
    }

    @Override
    public Map updateSong(Song song) {
        //基于主键修改
        Map map = new HashMap<>();
        if(song != null){
            //执行更新
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentTime = dateFormat.format(new Date());
            song.setUpdateTime(currentTime);
            songMapper.updateById(song);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "修改成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "修改失败, 歌曲为空");
        }
        return map;
    }

    @Override
    public Map deleteSong(Integer id) {
        Map map = new HashMap<>();
        //查询歌曲文件和图片路径
        Song song1 = this.selectSongById(id);
        String fileUrl = song1.getUrl();
        String imgUrl = song1.getPic();
        if(id != null && id != 0){
            songMapper.deleteById(id);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "删除成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "删除失败, 歌手ID错误");
            return map;
        }
        //删除歌曲文件
        if(song1 != null){
            File songFile = new File(Consts.FILE_PATH + fileUrl);
            songFile.delete();
        }
        //删除歌曲图片
        if(song1 != null && !imgUrl.equals(Consts.DEFAULT_SONG_PIC_PATH)){
            File imgFile = new File(Consts.FILE_PATH + imgUrl);
            imgFile.delete();
        }
        return map;
    }

    @Override
    public Song selectSongById(Integer id) { return songMapper.selectById(id); }


    /**
     * 根据歌手id删除该歌手的所有歌曲，用于当删除歌手时删除其歌曲
     */
    @Override
    public List deleteSongBySingerId(Integer id) {
        //查询出一位歌手所有的歌曲，获取每一个歌曲id
        List songIdList = new ArrayList<>();
        Map songMap = this.selectAllSongBySingerId(id);
        List<Song> dataList = (List<Song>) songMap.get("data"); //数据库查询出的所有歌曲对象
        if(!dataList.isEmpty()){
            for(int i=0; i<dataList.size(); i++){
                Map map = TypeConverter.beanToMap(dataList.get(i)); //将bean转换成Map
                songIdList.add(map.get("id")); //从Map中获取对应的值并添加到歌曲id集合中
            }
        }
        //得到歌曲id后删除歌曲
        for(int i=0; i<songIdList.size(); i++){
            this.deleteSong((Integer) songIdList.get(i));
        }
        return songIdList;
    }

    @Override
    public Map selectAllSong() {
        Map map = new HashMap();
        List<Song> resultList = songMapper.selectList(null);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", resultList);
        map.put("total", resultList.size());
        return map;
    }

    @Override
    public Map getAllSongByKeywords(String keywords) {
        Map map = new HashMap();
        List resultList = songMapper.getAllSongByKeywords(keywords);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", resultList);
        map.put("total", resultList.size());
        return map;
    }

    @Override
    public Map selectAllSongBySingerIdAlias(Integer singerId) {
        Map map = new HashMap();
        List<Song> resultList = songMapper.selectAllSongBySingerIdAlias(singerId);
        map.put("data", resultList);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        return map;
    }

    @Override
    public Map getASongBySongIdAlias(Integer songId) {
        Map map = new HashMap();
        List resultList = songMapper.getASongBySongIdAlias(songId);
        map.put("data", resultList);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        return map;
    }

    @Override
    public Map getRankList() {
        Map map = new HashMap();
        List resultList = songMapper.getRankList();
        map.put("data", resultList);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        return map;
    }

    @Override
    public Map increasePlayCount(Integer songId) {
        Map map = new HashMap();
        songMapper.increasePlayCount(songId);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "播放量+1");
        return map;
    }


    /**
     * 歌曲推荐
     * @param userId
     * @return
     */
    @Override
    public Map getRecommendSong(Integer userId) {
        List historyList = new ArrayList();
        List styleList = new ArrayList();
        Map map = new HashMap();
        //如果存在播放记录，取出播放记录并分析歌曲风格
        if(playHistorytService.getHistoryByUserId(userId).get("data") != null){
            historyList = (List) playHistorytService.getHistoryByUserId(userId).get("data");
            for(int i=0; i<historyList.size(); i++) {
                HashMap hashMap = (HashMap) historyList.get(i);
                styleList.add(hashMap.get("songStyle"));
            }
        }
        StringBuffer styleStringBuffer = new StringBuffer();
        for(int i=0; i<styleList.size(); i++){
            styleStringBuffer.append(styleList.get(i));
        }
        //去除字符中的逗号
        String styleString = styleStringBuffer.toString().replaceAll(",","");
        //获取每种风格的数量并加入到数组中进行排序（冒泡）
        int yueyu = this.getStrCount(styleString, "粤语");
        int huayu = this.getStrCount(styleString, "华语");
        int oumei = this.getStrCount(styleString, "欧美");
        int rihan = this.getStrCount(styleString, "日韩");
        int yaogun = this.getStrCount(styleString, "摇滚");
        int minyao = this.getStrCount(styleString, "民谣");
        int liuxing = this.getStrCount(styleString, "流行");
        int qita = this.getStrCount(styleString, "其他");
        int totalCount = yueyu + huayu + oumei + rihan + yaogun + minyao + liuxing + qita;  //所有类型数量和

        //查询出的不同风格的数据
        List yueyu1 = new ArrayList();
        List huayu1 = new ArrayList();
        List oumei1 = new ArrayList();
        List rihan1 = new ArrayList();
        List yaogun1 = new ArrayList();
        List minyao1 = new ArrayList();
        List liuxing1 = new ArrayList();
        List qita1 = new ArrayList();
//        int[] stylesCount = {yueyu, huayu, oumei, rihan, yaogun, minyao, liuxing, qita};
//        this.bubbleSort(stylesCount);
        //粤语
        if(yueyu > totalCount/5 && yueyu <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            yueyu1 = this.selectSongByStyle("粤语", 2);
        }else if(yueyu > totalCount*3/5 && yueyu <= totalCount){ //大于3/5且小于等于5/5，推荐3个对应歌曲
            yueyu1 = this.selectSongByStyle("粤语", 3);
        }else if(yueyu > 0 && yueyu <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            yueyu1 = this.selectSongByStyle("粤语", 1);
        }else{ //为0不推荐
            yueyu1 = this.selectSongByStyle("粤语", 0);
        }
        //华语
        if(huayu > totalCount/5 && huayu <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            huayu1 = this.selectSongByStyle("华语", 2);
        }else if(huayu > totalCount*3/5 && huayu <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌曲
            huayu1 = this.selectSongByStyle("华语", 3);
        }else if(huayu > 0 && huayu <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            huayu1 = this.selectSongByStyle("华语", 1);
        }else{ //为0不推荐
            huayu1 = this.selectSongByStyle("华语", 0);
        }
        //欧美
        if(oumei > totalCount/5 && oumei <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            oumei1 = this.selectSongByStyle("欧美", 2);
        }else if(oumei > totalCount*3/5 && oumei <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌曲
            oumei1 = this.selectSongByStyle("欧美", 3);
        }else if(oumei > 0 && oumei <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            oumei1 = this.selectSongByStyle("欧美", 1);
        }else{ //为0不推荐
            oumei1 = this.selectSongByStyle("欧美", 0);
        }
        //日韩
        if(rihan > totalCount/5 && rihan <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            rihan1 = this.selectSongByStyle("日韩", 2);
        }else if(rihan > totalCount*3/5 && rihan <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌曲
            rihan1 = this.selectSongByStyle("日韩", 3);
        }else if(rihan > 0 && rihan <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            rihan1 = this.selectSongByStyle("日韩", 1);
        }else{ //为0不推荐
            rihan1 = this.selectSongByStyle("日韩", 0);
        }
        //摇滚
        if(yaogun > totalCount/5 && yaogun <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            yaogun1 = this.selectSongByStyle("摇滚", 2);
        }else if(yaogun > totalCount*3/5 && yaogun <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌曲
            yaogun1 = this.selectSongByStyle("摇滚", 3);
        }else if(yaogun > 0 && yaogun <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            yaogun1 = this.selectSongByStyle("摇滚", 1);
        }else{ //为0不推荐
            yaogun1 = this.selectSongByStyle("摇滚", 0);
        }
        //民谣
        if(minyao > totalCount/5 && minyao <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            minyao1 = this.selectSongByStyle("民谣", 2);
        }else if(minyao > totalCount*3/5 && minyao <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌曲
            minyao1 = this.selectSongByStyle("民谣", 3);
        }else if(minyao > 0 && minyao <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            minyao1 = this.selectSongByStyle("民谣", 1);
        }else{ //为0不推荐
            minyao1 = this.selectSongByStyle("民谣", 0);
        }
        //流行
        if(liuxing > totalCount/5 && liuxing <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            liuxing1 = this.selectSongByStyle("流行", 2);
        }else if(liuxing > totalCount*3/5 && liuxing <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌曲
            liuxing1 = this.selectSongByStyle("流行", 3);
        }else if(liuxing > 0 && liuxing <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            liuxing1 = this.selectSongByStyle("流行", 1);
        }else{ //为0不推荐
            liuxing1 = this.selectSongByStyle("流行", 0);
        }
        //其他
        if(qita > totalCount/5 && qita <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌曲
            qita1 = this.selectSongByStyle("其他", 2);
        }else if(qita > totalCount*3/5 && qita <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌曲
            qita1 = this.selectSongByStyle("其他", 3);
        }else if(qita > 0 && qita <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌曲
            qita1 = this.selectSongByStyle("其他", 1);
        }else{ //为0不推荐
            qita1 = this.selectSongByStyle("其他", 0);
        }
        //1.先解决歌单交叉重复问题: 合并所有数组，然后去重
        List list1 = TypeConverter.combineListAndRemoveSame(yueyu1, huayu1); //粤语和华语合并并去重
        List list2 = TypeConverter.combineListAndRemoveSame(list1, oumei1); //去重后的新数组和其他类型去重，下同
        List list3 = TypeConverter.combineListAndRemoveSame(list2, rihan1);
        List list4 = TypeConverter.combineListAndRemoveSame(list3, yaogun1);
        List list5 = TypeConverter.combineListAndRemoveSame(list4, minyao1);
        List list6 = TypeConverter.combineListAndRemoveSame(list5, liuxing1);
        List list7 = TypeConverter.combineListAndRemoveSame(list6, qita1); //所有类型数组合并后的数组
        //2.在1的基础上解决所有类型推荐数和超过10和低于10，超过10则随机去除多余项，低于10，则随机补充
        Random r = new Random();
        if(list7.size() > 10){
            for(int i=0; i<list7.size() - 10; i++){
                list7.remove(r.nextInt(list7.size()));
            }
        }else {
            //查询出所有歌单的id
            List allList = (List) this.selectAllSong().get("data");
            //遍历取得所有id
            List idList = new ArrayList();
            for(int i=0; i<allList.size(); i++){
                Song song = (Song) allList.get(i);
                idList.add(song.getId());
            }
            int index1 = 0;
            while(list7.size() < 10){ //不足10条，随机根据id补充
                //随机id查询数据
                Random r1 = new Random();
                int index = r1.nextInt(idList.size());
                while(index1 != index){
                    List list8 = new ArrayList();
                    Song song = songMapper.selectById((Serializable) idList.get(index));
                    String singerName = songMapper.getSingerNameBySongId(song.getId());
                    song.setSingerName(singerName);
                    list8.add(song);
                    list7 = TypeConverter.combineListAndRemoveSame(list7, list8);
                    break;
                }
                index1 = index;
            }
        }
        map.put("data", list7);
        return map;
    }

    @Override
    public Map getRecommendSongWithNoId() {
        Map map = new HashMap();
        List list = new ArrayList();
        //查询出所有歌单的id
        List allList = (List) this.selectAllSong().get("data");
        //遍历取得所有id
        List idList = new ArrayList();
        for(int i=0; i<allList.size(); i++){
            Song song = (Song) allList.get(i);
            idList.add(song.getId());
        }
        int index1 = 0;
        while(list.size() < 10){ //不足10条，随机根据id补充
            //随机id查询数据
            Random r1 = new Random();
            int index = r1.nextInt(idList.size());
            while(index1 != index){
                List list8 = new ArrayList();
                Song song = songMapper.selectById((Serializable) idList.get(index));
                String singerName = songMapper.getSingerNameBySongId(song.getId());
                song.setSingerName(singerName);
                list8.add(song);
                list = TypeConverter.combineListAndRemoveSame(list, list8);
//                list.add(songMapper.selectById((Serializable) idList.get(index)));
                break;
            }
            index1 = index;
        }
        map.put("data", list);
        return map;
    }

    @Override
    public Map createDownloadHistory(Integer userId, Integer songId) {
        Map map = new HashMap();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String currentTime = dateFormat.format(new Date());

        DownloadHistory downloadHistory = new DownloadHistory();
        if (userId != null && !userId.equals("")){
            downloadHistory.setUserId(userId);
        }else{
            downloadHistory.setUserId(-1);
        }
        downloadHistory.setSongId(songId);
        downloadHistory.setDownloadTime(currentTime);

        downloadHistoryMapper.insert(downloadHistory);
        return map;
    }

    @Override
    public Map getHistoryByUserId(Integer userId) {
        Map map = new HashMap();
        if(userId != null){
            List resultList = downloadHistoryMapper.getHistoryByUserId(userId);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "查询成功");
            map.put("data", resultList);
        }else {
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "未登录");
        }
        return map;
    }


    //根据歌曲风格查找对应歌曲数
    public List selectSongByStyle(String style, Integer listNum){
        QueryWrapper<Song> queryWrapper = new QueryWrapper<>();
        List dataList = songMapper.selectList(queryWrapper.like("style",style)); //所有含有对应风格的歌曲列表
        List resultList = new ArrayList(); //需要的listNum条数据列表
        //随机的获取listNum条数据
        //Collections.shuffle(resultList); //使用shuffle打乱集合的方式
        Random r = new Random();//使用随机数方式
        int randomTmp = 0;  //上次产生的随机数
        while(resultList.size() < listNum){
            int random =  r.nextInt(dataList.size());
            while(random != randomTmp){ //新一次随机数不等于上次随机数
                resultList.add(dataList.get(random));
                break;
            }
            randomTmp = random;
        }

        return resultList;
    }

    private int getStrCount(String mainStr, String subStr) {
        // 声明一个要返回的变量
        int count = 0;
        // 声明一个初始的下标，从初始位置开始查找
        int index = 0;
        // 获取主数据的长度
        int mainStrLength = mainStr.length();
        // 获取要查找的数据长度
        int subStrLength = subStr.length();
        // 如果要查找的数据长度大于主数据的长度则返回0
        if (subStrLength > mainStrLength) {
            return 0;
        }
        // 循环使用indexOf查找出现的下标，如果出现一次则count++
        while ((index = mainStr.indexOf(subStr, index)) != -1) {
            count++;
            // 从找到的位置下标加上要查找的字符串长度，让指针往后移动继续查找
            index += subStrLength;
        }
        return count;
    }

}