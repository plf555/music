package com.theVoiceAround.music.config;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import org.springframework.validation.BindException;

@RestControllerAdvice
public class ValidExceptionHandler {
    @ExceptionHandler(BindException.class)
    public String validExceptionHandler(BindException exception){
        return exception.getAllErrors().get(0).getDefaultMessage();
    }

}
