package com.trows.record_trows.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Throws_exception on 2017/2/26.
 */
@Controller
public class IndexController {
    @RequestMapping("/index.htm")
    public String loginOut(){
        return "record/index";
    }

    @RequestMapping("/index2.htm")
    public String toIndex2(){
        return "record/index2";
    }
}
