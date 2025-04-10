package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Swiper;

import java.util.Map;

public interface SwiperService {
    Map getSwiperInfo();

    Map selectAllSwiper(int pageSize, int pageNum);

    Map addSwiper(Swiper swiper);

    Map updateSwiper(Swiper swiper);

    Map deleteASwiper(Integer swiperId);
}
