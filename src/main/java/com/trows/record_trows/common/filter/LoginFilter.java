package com.trows.record_trows.common.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登入拦截器极其token的添加
 */

@WebFilter(filterName = "loginFilter", urlPatterns = {"*.jsp", "*.do", "*.htm"},
        dispatcherTypes = {
                DispatcherType.FORWARD,
                DispatcherType.INCLUDE,
                DispatcherType.REQUEST,
                DispatcherType.ERROR, DispatcherType.ASYNC
        }
)
public class LoginFilter implements Filter {

    public void init(FilterConfig filterConfig) throws ServletException {
    }

    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain)
            throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        servletRequest.setCharacterEncoding("UTF-8");

        filterChain.doFilter(servletRequest, servletResponse);   //放行

    }

    public void destroy() {

    }
}
