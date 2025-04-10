<template>
    <div class="the-footer">
        <div>
            <ul style="display:inline">
                <li class="wechat">
                    <span>关于 | </span>
                    <div class="QR-code">
                        <p name="about" class="text">DESIGNED BY 彭立枫</p>
                    </div>
                </li>
            </ul>
            <!-- <p style="display:inline">关于 | </p> -->
            <ul style="display:inline">
                <li class="wechat">
                    <span>免责声明 | </span>
                    <div class="QR-code">
                        <p name="about" class="text">本网站刊载的所有内容，包括但不限于图片、音频均在网上搜集。访问者可将本网站提供的内容或服务用于个人学习、研究或欣赏，以及其他非商业性或非盈利性用途，同时应遵守著作权法及其他相关法律的规定，不得侵犯本网站及相关权利人的合法权利。本网站内容原作者如不愿意在本软件刊登内容，请及时通知本站，予以删除。电子邮箱：573618801@qq.com</p>
                    </div>
                </li>
            </ul>
            <!-- <p style="display:inline">条款 | </p> -->
            <ul style="display:inline">
                <li class="wechat">
                    <a href="http://127.0.0.1:9527" target="_blank" class="jump-link">
                    <span>管理员登录 | </span>
                    </a>
                </li>
            </ul>
            <ul style="display:inline">
                <li class="wechat">
                    <span>成为管理员 | </span>
                    <div class="QR-code">
                        <img src="../assets/img/qrcode.jpg" class="qrcode-img">
                        <h4 class="text">&nbsp;&nbsp;&nbsp;&nbsp;
                            WeChat Or Email Below</h4>
                    </div>
                </li>
            </ul>
            <ul style="display:inline">
                <li class="wechat">
                    <span>资源建议</span>
                    <div class="QR-code">
                        <p name="about" class="text">请将需要添加的歌曲名、歌手名或其他资源建议发送到底部邮箱。
                            您也可以在左侧“成为管理员”申请管理员账号加入管理团队以维护本站内容。</p>
                    </div>
                </li>
            </ul>
            <!-- <p style="display:inline">反馈</p> -->
        </div>
        <p>Copyright ©2025 Contact: 573618801@qq.com</p>
    </div>
    
</template>
<script>
export default {
    name: 'the-footer',
}
</script>
<style lang="scss" scoped>
@import '../assets/css/the-footer.scss';
.wechat{
    position: relative;
	 cursor: pointer;	// 鼠标移入有小手
	
	 &:hover .QR-code{	// hover，点到就显示
	     display: block;
	 }
    .QR-code{
        // width: 204px;
        // height: 204px;
        background-size: 100%;	// 和父div同长宽
        position: absolute;	// 绝对定位，需要父级或者祖先元素有一个`position: relative`;
        right: 50%;	// 移动你想要的位置
        bottom: 20px;
        display: none;  // 默认关掉

        .qrcode-img{
            width: 200px;
            height: 200px;
        }
        .text{
            width: 300px;
        }
    }
}
.jump-link{
    text-decoration: none;
    color: #000000
}
</style>