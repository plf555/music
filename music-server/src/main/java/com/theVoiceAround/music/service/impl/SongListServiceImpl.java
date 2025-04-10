package com.theVoiceAround.music.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.theVoiceAround.music.entity.Consumer;
import com.theVoiceAround.music.entity.Score;
import com.theVoiceAround.music.entity.SongList;
import com.theVoiceAround.music.mapper.*;
import com.theVoiceAround.music.service.PlayHistorytService;
import com.theVoiceAround.music.service.SongListService;
import com.theVoiceAround.music.utils.Consts;
import com.theVoiceAround.music.utils.TypeConverter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.sql.rowset.spi.SyncResolver;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

/**
 * @author Taliy4h
 * @date 2021/3/3 10:19
 * @description 歌单Service实现类
 */
@Service
public class SongListServiceImpl implements SongListService {

    @Autowired
    private SongListMapper songListMapper;

    @Autowired
    private ConsumerMapper consumerMapper;
    @Autowired
    private CollectMapper collectMapper;
    @Autowired
    private PlayHistoryMapper playHistoryMapper;
    @Autowired
    private EvaluationMapper evaluationMapper;

    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private PlayHistorytService playHistorytService;

    @Override
    public Map addSongList(SongList songList) {
        Map map = new HashMap<>();
        if(songList != null && !songList.getTitle().equals("")){
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentTime = dateFormat.format(new Date());
            songList.setCreateTime(currentTime);
            songListMapper.insert(songList);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "添加成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "添加失败, 歌单标题不能为空");
        }
        return map;
    }

    @Override
    public Map getAllSongListPage(int pageSize, int pageNum, String title) {
        QueryWrapper<SongList> queryWrapper = new QueryWrapper<>();
        if(title != null && !title.equals("")){
            queryWrapper.like("title", title);
        }
        Map map = new HashMap<>();
        IPage<SongList> iPage = new Page<>(pageNum, pageSize);
        IPage<SongList> songListIPage = songListMapper.selectPage(iPage, queryWrapper);
        long total = songListIPage.getTotal();
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", songListIPage);
        map.put("total", total);
        return map;
    }

    @Override
    public SongList selectSongListById(Integer id) {
        return songListMapper.selectById(id);
    }

    @Override
    public Map deleteSongList(Integer id) {
        Map map = new HashMap<>();
        if(id != null && id != 0){
            songListMapper.deleteById(id);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "删除成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "删除失败, 歌单ID错误");
        }
        return map;
    }

    @Override
    public Map updateSongList(SongList songList) {
        //基于主键修改
        Map map = new HashMap<>();
        if(songList != null){
            //执行更新
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String currentTime = dateFormat.format(new Date());
            songList.setUpdateTime(currentTime);
            songListMapper.updateById(songList);
            map.put(Consts.CODE, "1");
            map.put(Consts.MESSAGE, "修改成功");
        }else{
            map.put(Consts.CODE, "0");
            map.put(Consts.MESSAGE, "修改失败, 歌曲为空");
        }
        return map;
    }

    @Override
    public Map selectAllSongList() {
        Map map = new HashMap();
        List<SongList> resultList = songListMapper.selectList(null);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", resultList);
        map.put("total", resultList.size());
        return map;
    }

    @Override
    public Map getAllSongListByKeywords(String keywords) {
        Map map = new HashMap();
        List resultList = songListMapper.getAllSongListByKeywords(keywords);
        map.put(Consts.CODE, "1");
        map.put(Consts.MESSAGE, "查询成功");
        map.put("data", resultList);
        map.put("total", resultList.size());
        return map;
    }

    @Override
    public Map getRecommendSongList(Integer userId) {
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
            if(yueyu > totalCount/5 && yueyu <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                yueyu1 = this.selectSongListByStyle("粤语", 2);
            }else if(yueyu > totalCount*3/5 && yueyu <= totalCount){ //大于3/5且小于等于5/5，推荐3个对应歌单
                yueyu1 = this.selectSongListByStyle("粤语", 3);
            }else if(yueyu > 0 && yueyu <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                yueyu1 = this.selectSongListByStyle("粤语", 1);
            }else{ //为0不推荐
                yueyu1 = this.selectSongListByStyle("粤语", 0);
            }
            //华语
            if(huayu > totalCount/5 && huayu <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                huayu1 = this.selectSongListByStyle("华语", 2);
            }else if(huayu > totalCount*3/5 && huayu <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌单
                huayu1 = this.selectSongListByStyle("华语", 3);
            }else if(huayu > 0 && huayu <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                huayu1 = this.selectSongListByStyle("华语", 1);
            }else{ //为0不推荐
                huayu1 = this.selectSongListByStyle("华语", 0);
            }
            //欧美
            if(oumei > totalCount/5 && oumei <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                oumei1 = this.selectSongListByStyle("欧美", 2);
            }else if(oumei > totalCount*3/5 && oumei <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌单
                oumei1 = this.selectSongListByStyle("欧美", 3);
            }else if(oumei > 0 && oumei <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                oumei1 = this.selectSongListByStyle("欧美", 1);
            }else{ //为0不推荐
                oumei1 = this.selectSongListByStyle("欧美", 0);
            }
            //日韩
            if(rihan > totalCount/5 && rihan <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                rihan1 = this.selectSongListByStyle("日韩", 2);
            }else if(rihan > totalCount*3/5 && rihan <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌单
                rihan1 = this.selectSongListByStyle("日韩", 3);
            }else if(rihan > 0 && rihan <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                rihan1 = this.selectSongListByStyle("日韩", 1);
            }else{ //为0不推荐
                rihan1 = this.selectSongListByStyle("日韩", 0);
            }
            //摇滚
            if(yaogun > totalCount/5 && yaogun <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                yaogun1 = this.selectSongListByStyle("摇滚", 2);
            }else if(yaogun > totalCount*3/5 && yaogun <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌单
                yaogun1 = this.selectSongListByStyle("摇滚", 3);
            }else if(yaogun > 0 && yaogun <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                yaogun1 = this.selectSongListByStyle("摇滚", 1);
            }else{ //为0不推荐
                yaogun1 = this.selectSongListByStyle("摇滚", 0);
            }
            //民谣
            if(minyao > totalCount/5 && minyao <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                minyao1 = this.selectSongListByStyle("民谣", 2);
            }else if(minyao > totalCount*3/5 && minyao <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌单
                minyao1 = this.selectSongListByStyle("民谣", 3);
            }else if(minyao > 0 && minyao <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                minyao1 = this.selectSongListByStyle("民谣", 1);
            }else{ //为0不推荐
                minyao1 = this.selectSongListByStyle("民谣", 0);
            }
            //流行
            if(liuxing > totalCount/5 && liuxing <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                liuxing1 = this.selectSongListByStyle("流行", 2);
            }else if(liuxing > totalCount*3/5 && liuxing <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌单
                liuxing1 = this.selectSongListByStyle("流行", 3);
            }else if(liuxing > 0 && liuxing <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                liuxing1 = this.selectSongListByStyle("流行", 1);
            }else{ //为0不推荐
                liuxing1 = this.selectSongListByStyle("流行", 0);
            }
            //其他
            if(qita > totalCount/5 && qita <= totalCount*3/5){ //大于1/5且小于3/5，推荐2个对应歌单
                qita1 = this.selectSongListByStyle("其他", 2);
            }else if(qita > totalCount*3/5 && qita <= totalCount){ //大于3/5且小于5/5，推荐3个对应歌单
                qita1 = this.selectSongListByStyle("其他", 3);
            }else if(qita > 0 && qita <= totalCount/5){ //大于0且小于等于1/5，推荐1个对应歌单
                qita1 = this.selectSongListByStyle("其他", 1);
            }else{ //为0不推荐
                qita1 = this.selectSongListByStyle("其他", 0);
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
                List allList = (List) this.selectAllSongList().get("data");
                //遍历取得所有id
                List idList = new ArrayList();
                for(int i=0; i<allList.size(); i++){
                    SongList songList = (SongList) allList.get(i);
                    idList.add(songList.getId());
                }
                int index1 = 0;
                while(list7.size() < 10){ //不足10条，随机根据id补充
                    //随机id查询数据
                    Random r1 = new Random();
                    int index = r1.nextInt(idList.size());
                    while(index1 != index){
                        List list8 = new ArrayList();
                        SongList songList = songListMapper.selectById((Serializable) idList.get(index));
                        list8.add(songList);
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
    public Map getRecommendSongListWithNoId() {
        Map map = new HashMap();
        List list = new ArrayList();
        //查询出所有歌单的id
        List allList = (List) this.selectAllSongList().get("data");
        //遍历取得所有id
        List idList = new ArrayList();
        for(int i=0; i<allList.size(); i++){
            SongList songList = (SongList) allList.get(i);
            idList.add(songList.getId());
        }
        int index1 = 0;
        while(list.size() < 10){ //不足10条，随机根据id补充
            //随机id查询数据
            Random r1 = new Random();
            int index = r1.nextInt(idList.size());
            while(index1 != index){
                List list8 = new ArrayList();
                SongList songList = songListMapper.selectById((Serializable) idList.get(index));
                list8.add(songList);
                list = TypeConverter.combineListAndRemoveSame(list, list8);
//                list.add(songListMapper.selectById((Serializable) idList.get(index)));
                break;
            }
            index1 = index;
        }
        map.put("data", list);
        return map;
    }




    //根据歌单风格查找对应歌单数
    public List selectSongListByStyle(String style, Integer listNum){
        QueryWrapper<SongList> queryWrapper = new QueryWrapper<>();
        List dataList = songListMapper.selectList(queryWrapper.like("style",style)); //所有含有对应风格的歌单列表
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

    //基于物品的协同过滤推荐算法
    private static Map<Integer, Integer> userMap = new TreeMap<>();
    private static Map<Integer, Integer> slMap = new TreeMap<>();
    private static Map<Integer, Map<Integer, Double>> USMap = new HashMap<>();

    private static final int  K = 10; // 取最相似个数
    private static final int  N = 10; // 歌单推荐个数

    private static List<Integer> userList;
    private static List<Integer> slList;


    private final static double W_A = 0.05;
    private final static double W_B = 0.1;
    private final static double W_C = 0.01;
    private final static double W_D = 0.01;



    @Override
    public Map getRecommendList(Integer userId){
        double[][] initEvaluate = makeInitEvaluate(); // 建立评分矩阵
        double[][] hearAndNoScore = makeHearAndNoScore(); // 建立听了但没评分的矩阵
        double[][] collectEvaluate = makeCollect(); // 建立歌单中收藏过歌曲的矩阵
        double[][] conmmentEvaluate = makeComment(); // 建立歌单中评论过歌曲的矩阵
        double[][] finalEvaluate = makeFinalEvaluate(initEvaluate, hearAndNoScore, collectEvaluate, conmmentEvaluate); // 建立最终评价矩阵
        double[][] similar = makeSimilar(finalEvaluate); // 计算歌曲相似度矩阵
        double[][] predictEvaluate = makePredictEvaluate(finalEvaluate, similar); // 预测评分矩阵

        // 获取用户索引,得到用户的预测评分
        int u_index = userMap.get(userId);
        // 获取评分最高的10个歌单Id集合
        Set<Integer> recommendSLIdSet = getRecommendDishIdSet(N, predictEvaluate[u_index]);
        // 根据歌单Id批量查询歌单信息
        QueryWrapper queryWrapper = new QueryWrapper();

        List<SongList> recommendList = songListMapper.selectBatchIds(recommendSLIdSet);
        Map<String, List> map = new HashMap<>();
        map.put("data", recommendList);
        return map;
    }

    /**
     * 获取预测评分最高的N个歌单集合
     * @param N
     * @param userPredict
     * @return
     */
    private Set<Integer> getRecommendDishIdSet(int N, double[] userPredict) {
        List<Integer> dishIds = new ArrayList<>(slList);
        userPredict =Arrays.copyOf(userPredict, userPredict.length);
        for (int i = userPredict.length-1; i >= 1; i--) {
            for (int j = i-1; j >= 0; j--) {
                if (userPredict[i] > userPredict[j]) {
                    double s = userPredict[i];
                    userPredict[i] = userPredict[j];
                    userPredict[j] = s;
                    Integer id = dishIds.get(i);
                    dishIds.set(i,dishIds.get(j));
                    dishIds.set(j, id);
                }
            }
        }
        return dishIds.stream().limit(N).collect(Collectors.toSet());
    }


    /**
     * 建立评分矩阵
     * @return
     */
    private double[][] makeInitEvaluate() {
        slList = songListMapper.selectList(null).stream().map(SongList::getId).collect(Collectors.toList());
        List<Consumer> consumers = consumerMapper.selectList(null);
        userList = consumers.stream().map(Consumer::getId).collect(Collectors.toList());

        int index = 0;
        for (Integer userId : userList) {
            userMap.put(userId, index);
            index++;
        }
        index = 0;
        for (Integer sl : slList) {
            slMap.put(sl, index);
            index++;
        }
        // 初始化A
        double[][] A = initArray(userList.size(), slList.size());

        // 查询所有评分，填充评分到A
        List<Score> evaluations = evaluationMapper.selectAllEvaluation();
        evaluations.forEach(e -> {
            if (userMap.containsKey(e.getConsumerId()) && slMap.containsKey(e.getSongListId())){
                A[userMap.get(e.getConsumerId())][slMap.get(e.getSongListId())] = e.getScore();
            }
        });

        return A;
    }

    /**
     * 建立听了但没评分的矩阵,值为听过的次数
     * @return
     */
    private double[][] makeHearAndNoScore() {
        List<Score> hearNoScore = evaluationMapper.selectHearNoScore();
        double[][] B = initArray(userList.size(), slList.size());
        hearNoScore.forEach(e -> {
            if (userMap.containsKey(e.getConsumerId()) && slMap.containsKey(e.getSongListId())) {
                B[userMap.get(e.getConsumerId())][slMap.get(e.getSongListId())] = e.getScore();
            }
        });
        return B;
    }

    /**
     * 建立歌单中收藏过歌曲的矩阵,值为歌单中收藏歌曲的个数
     * @return
     */
    private double[][] makeCollect() {
        List<Score> collectEvaluations = collectMapper.selectCollect();
        double[][] C = initArray(userList.size(), slList.size());
        collectEvaluations.forEach(e -> {
            if (userMap.containsKey(e.getConsumerId()) && slMap.containsKey(e.getSongListId())){
                C[userMap.get(e.getConsumerId())][slMap.get(e.getSongListId())] = e.getScore();
            }
        });
        return C;
    }


    /**
     * 建立歌单中评论过歌曲的矩阵,值为歌单中评论歌曲的个数
     * @return
     */
    private double[][] makeComment() {
        List<Score> commentEvaluations = commentMapper.selectComment();
        double[][] C = initArray(userList.size(), slList.size());
        commentEvaluations.forEach(e -> {
            if (userMap.containsKey(e.getConsumerId()) && slMap.containsKey(e.getSongListId())){
                C[userMap.get(e.getConsumerId())][slMap.get(e.getSongListId())] = e.getScore();
            }
        });
        return C;
    }

    /**
     * 建立最终评价矩阵
     * @param initEvaluate
     * @param hearAndNoScore
     * @param collectEvaluate
     * @param conmmentEvaluate
     * @return
     */
    private double[][] makeFinalEvaluate(double[][] initEvaluate, double[][] hearAndNoScore, double[][] collectEvaluate, double[][] conmmentEvaluate) {
        double[][] R = initArray(userList.size(), slList.size());
        for (int i = 0; i < R.length; i++) {
            for (int j = 0; j < R[0].length; j++) {
                R[i][j] = initEvaluate[i][j] * W_A + hearAndNoScore[i][j] * W_B + collectEvaluate[i][j] * W_C + conmmentEvaluate[i][j] * W_D;
            }
        }
        return R;
    }

    /**
     * 计算歌曲相似度矩阵
     * @param finalEvaluate
     * @return
     */
    private double[][] makeSimilar(double[][] finalEvaluate) {
        double[][] S = initArray(slList.size(), slList.size());
        for (int i = 0; i < S.length; i++) {
            for (int j = 0; j < S[0].length; j++) {
                // 计算歌曲i和歌曲j的相似度
                S[i][j] = similar(i, j, finalEvaluate);
            }
        }
        return S;
    }


    /**
     * 计算歌曲i和歌曲j的相似度
     * @param i
     * @param j
     * @param finalEvaluate
     * @return
     */
    private double similar(int i, int j, double[][] finalEvaluate) {
        double MA, MB, sum_M = 0.0;
        List<Score> usersAvgScore = evaluationMapper.selectAvgScore();
        Map<Integer, Double> userAvgMap = usersAvgScore.stream().
                collect(Collectors.toMap(Score::getConsumerId, Score::getScore,(item1,item2)->item1));

        // 计算分子
        for (int k = 0; k < userMap.size(); k++) {
            Double avgScore_u = userAvgMap.get(userList.get(k)); // 获取用户所有打分平均分
            if (avgScore_u == null) {
                avgScore_u = 0.0;
            }
            MA = finalEvaluate[k][i] - avgScore_u;
            MB = finalEvaluate[k][j] - avgScore_u;
            sum_M += MA * MB;
        }

        // 计算分母
        double NA, sum_NA = 0.0;
        for (int k = 0; k < userMap.size(); k++) {
            Double avgScore_u = userAvgMap.get(userList.get(k)); // 获取用户所有打分平均分
            if (avgScore_u == null) {
                avgScore_u = 0.0;
            }
            NA = finalEvaluate[k][i] - avgScore_u;
            sum_NA += Math.pow((NA - avgScore_u), 2);
        }

        double NB, sum_NB = 0.0;
        for (int k = 0; k < userMap.size(); k++) {
            Double avgScore_u = userAvgMap.get(userList.get(k)); // 获取用户所有打分平均分
            if (avgScore_u == null) {
                avgScore_u = 0.0;
            }
            NB = finalEvaluate[k][j] - avgScore_u;
            sum_NB += Math.pow((NB - avgScore_u), 2);
        }
        return sum_M / (Math.sqrt(sum_NA) * Math.sqrt(sum_NB));
    }

    /**
     * 预测评分矩阵
     * @param finalEvaluate
     * @param similar
     * @return
     */
    private double[][] makePredictEvaluate(double[][] finalEvaluate, double[][] similar) {
        double[][] P = initArray(userList.size(), slList.size());
        for (int u = 0; u < userMap.size(); u++) {
            for (int i = 0; i < slMap.size(); i++) {
                P[u][i] = predictEvaluate(u,i,finalEvaluate,similar);
            }
        }
        return P;
    }

    private double predictEvaluate(int u, int i, double[][] finalEvaluate, double[][] similar) {
        // 用户u听过的歌单Id集合
        List<Integer> hearSet = playHistoryMapper.selectHear(userList.get(u));
        // 与歌单i最相似的K个歌单集合
        Set<Integer> dishSet = maxSimilar(i, K, similar);
        // 取buySet和dishSet的交集(dishId..)
        Set<Integer> JSet = new HashSet<>(hearSet);
        JSet.removeAll(dishSet);
        double sum_M = 0.0, sum_N = 0.0, p_ui;
        for (Integer slId : JSet) {
            if (slMap.containsKey(slId)) {
                int j = slMap.get(slId);
                sum_M += similar[i][j] * finalEvaluate[u][i];
                sum_N += similar[i][j];
            }
        }
        p_ui = sum_M/sum_N;

        return p_ui;
    }

    /**
     * 获取与歌曲i最相似的k个歌曲集合
     * @param i
     * @param k
     * @param similar
     * @return
     */
    private Set<Integer> maxSimilar(int i, int k, double[][] similar) {
        double[] sim_ij = similar[i];
        List<Integer> dishIds = new ArrayList<>(slList);
        for (int j = sim_ij.length-1; j >= 1; j--) {
            for (int l = j-1; l >= 0; l--) {
                if (sim_ij[j] > sim_ij[l]) {
                    double s = sim_ij[j];
                    sim_ij[j] = sim_ij[l];
                    sim_ij[l] = s;
                    Integer id = dishIds.get(j);
                    dishIds.set(j,dishIds.get(l));
                    dishIds.set(l, id);
                }
            }
        }

        return dishIds.stream().limit(k).collect(Collectors.toSet());
    }

    private double getScore(Integer userId, Integer slId){
        return USMap.get(userId).get(slId);
    }


    private double[][] initArray(int W,int H) {
        double[][] arr = new double[W][H];
        for (int i = 0; i < arr.length; i++) {
            for (int j = 0; j < arr[0].length; j++) {
                arr[i][j] = 0.0;
            }
        }
        return arr;
    }

}
