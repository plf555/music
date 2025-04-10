package com.theVoiceAround.music.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

/**
 * @description 解决跨域问题
 */

/**
 * 解决跨域问题
 */
@Configuration
public class WebMvcConfig extends WebMvcConfigurerAdapter{
    @Override
    public void addCorsMappings(CorsRegistry registry) {
        //允许所有路径（"/**"）的跨域请求
        registry.addMapping("/**")
                //允许所有来源
                .allowedOriginPatterns("*")
                //允许所有HTTP方法
                .allowedMethods("*")
                //允许携带凭证信息如Cookie
                .allowCredentials(true);
    }
}
