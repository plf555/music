package com.theVoiceAround.music.service;

import com.theVoiceAround.music.entity.Evaluation;

import java.util.Map;

/**
 * @description 评价Service
 */
public interface EvaluationService {

    Map addEvaluation(Evaluation evaluation);

    double averageScore(Integer songListId);
}
