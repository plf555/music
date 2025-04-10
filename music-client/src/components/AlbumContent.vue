<template>
    <div class="content">
       <h1 class="title">
           <slot name="title"></slot>
           <hr/>
       </h1>
       <ul>
           <li>
               <div class="song-item">
                   <span class="item-index"></span>
                   <span class="item-title">歌曲名</span>
                   <span class="item-name">歌手</span>
                   <span class="item-album">专辑</span>
               </div>
           </li>
           <li v-for="(item,index) in songList" :key="index">
               <!-- <div class="song-item" @click="toplay(item.id,item.url,item.pic,index,item.name,item.lyric)"> -->
                <div class="song-item" @click="toplay(item.songId, item.songUrl, item.songPic, index, item.songName, item.singerName, item.songLyric)">
                   <span class="item-index">
                       {{index + 1}}
                    </span>
                    <span class="item-title">{{item.songName}}</span> <!-- 歌曲名 -->
                    <span class="item-name">{{item.singerName}}</span> <!-- 歌手名 -->
                   <span class="item-album">{{item.songAlbum}}</span> <!-- 专辑 -->
                </div>
           </li>
       </ul>
    </div>
</template>
<script>
import {mapGetters} from "vuex";
import {mixin} from "../mixins";
export default {
    name: 'album-content',
    mixins: [mixin],
    props:[
        'songList'
    ]
}

</script>

<style lang="scss" scoped>
@import '../assets/css/album-content.scss';
</style>