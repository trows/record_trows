package com.trows.record_trows.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.trows.record_trows.entity.Account;
import com.trows.record_trows.service.AccountService;
import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Throws_exception on 2015/12/28.
 */
@Controller
public class AccountController {

    @RequestMapping("/loginOut.htm")
    public String loginOut(HttpServletRequest request){
        request.getSession(true).invalidate();
        return "redirect:./index/index.jsp";
    }
}
