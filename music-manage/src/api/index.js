import {get,post} from "./http";

// 判断管理员是否登录成功
export const getLoginStatus = (params) => post(`admin/login`,params);


//============歌手相关================
//分页，模糊查询歌手
export const getAllSingerPage =(params) => get(`singer/allSingerPage`, params);
//不分页查询所有歌手
export const allSinger =() => get(`singer/allSinger`);
//添加歌手
export const setSinger = (singer) => post(`singer/add`,singer);
//编辑歌手
export const updateSinger = (singer) => post(`singer/updateSingerInfo`,singer);
//删除歌手
export const delSinger = (id) => get(`singer/deleteASinger?id=${id}`);
//根据歌手Id查询歌手
export const getSingerById = (singerId) => get(`singer/getSingerById?singerId=${singerId}`);

//============歌曲相关================
//根据歌手id查询歌曲
export const songOfSingerId =(params) => get(`song/singerSongPage`, params);
// //根据歌手id查询该歌手的全部歌曲
// export const songOfSingerId =(params) => get(`song/singerSongPage`, params);
//添加歌曲
export const addASong = (song) => post(`song/addASong`,song);
//编辑歌曲
export const updateSong = (song) => post(`song/updateSongInfo`,song);
//删除歌曲
export const delSong = (id) => get(`song/deleteASong?id=${id}`);
//根据歌曲id查询歌曲对象
export const songOfSongId =(id) => get(`song/getASongBySongId?songId=${id}`);
//根据歌曲id查询歌曲、歌手信息，带别名
export const songOfSongIdAlias =(songId) => get(`song/getASongBySongIdAlias?songId=${songId}`);
//根据歌曲名获取歌曲对象
export const songOfSongName =(songName) => get(`song/songOfSongName?songName=${songName}`);
//根据歌手id查询该歌手的所有歌曲
export const allSong =(singerId) => get(`song/allSong?singerId=${singerId}`);
//不带参数查询所有歌曲
export const alltAllSongNoParams =() => get(`song/getAllSong`);

//============歌单相关================
//查询歌单
export const getAllSongListPage =(params) => get(`songList/getAllSongListPage`,params);
//添加歌单
export const setSongList = (songList) => post(`songList/addSongList`,songList);
//编辑歌单
export const updateSongList = (params) => post(`songList/updateSongList`,params);
//删除歌单
export const delSongList = (id) => get(`songList/deleteASongList?id=${id}`);
//查询歌单
export const getAllSongList =() => get(`songList/getAllSongList`);

//============歌单的歌曲相关============
//根据歌单id查询歌曲列表
export const listSongDetail = (songListId) => get(`listSong/getListSong?songListId=${songListId}`);
//给歌单增加歌曲
export const listSongAdd = (listSong) => post(`listSong/addSongToSongList`,listSong);
//删除歌单的歌曲
export const delListSong = (songListId,songId) => get(`listSong/deleteASongFromSongList?songListId=${songListId}&songId=${songId}`);

//============用户相关================
//查询用户
export const getAllConsumer =(params) => get(`consumer/allConsumerPage`, params);
//不带参数查询所有用户
export const getAllConsumerNoParams =() => get(`consumer/getAllConsumer`);
//添加用户
export const setConsumer = (consumer) => post(`consumer/addConsumer`,consumer);
//编辑用户
export const updateConsumer = (consumer) => post(`consumer/updateConsumerInfo`,consumer);
//删除用户
export const delConsumer = (id) => get(`consumer/deleteAConsumer?id=${id}`);
//根据用户id查询该用户的详细信息
export const getUserOfId =(id) => get(`/consumer/selectInfoById?id=${id}`);

//===============收藏===================
//指定用户的收藏列表
export const getCollectOfUserId = (userId) => get(`/collect/getCollectByUserId?userId=${userId}`);
//删除用户收藏的歌曲
export const deleteCollection = (userId,songId) => get(`collect/deleteACollect?userId=${userId}&songId=${songId}`);

//===============评论===================
//指定歌单的评论列表
export const getCommentOfSongListId = (songListId) => get(`/comment/getCommentBySongListId?songListId=${songListId}`);
//删除评论
export const deleteComment = (commentId) => get(`comment/deleteAComment?commentId=${commentId}`);

//=============留言==================
//分页，模糊查询留言
export const getAllMessagePage =(params) => get(`message/allMessagePage`, params);
//删除留言
export const delMessage = (id) => get(`message/deleteAMessage?id=${id}`);

//==============轮播图==============
//分页，模糊查询轮播图
export const getAllSwiper =(params) => get(`swiper/getAllSwiper`, params);
//添加轮播图
export const setSwiper = (singer) => post(`swiper/addSwiper`,singer);
//删除轮播图
export const deleteASwiper = (swiperId) => get(`swiper/deleteASwiper?swiperId=${swiperId}`);
//编辑轮播图
export const updateSwiper = (swiper) => post(`swiper/updateSwiperInfo`,swiper);
