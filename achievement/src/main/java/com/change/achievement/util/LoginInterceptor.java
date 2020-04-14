package com.change.achievement.util;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor {
	 
    /**
     * 不拦截的后缀
     */
    private List<String> excludeMappingUrl;//不拦截的后缀通过Spring-mvc.xml配置文件中配置
    /*
     * (non-Javadoc)
     * Handler执行完之后的操作
     */
    @Override  
    public void afterCompletion(HttpServletRequest resquest, HttpServletResponse response, Object object, Exception exception)
            throws Exception {
        System.out.println("afterCompletion：请求之后被执行");
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView mv)
            throws Exception {

        System.out.println("postHandle:请求之前被执行。");
    }

    /*
     * Handler执行前执行的方法,请求前进行执行校验
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object object) throws Exception {
        String url = request.getRequestURI();//获取请求的URL
//      System.out.println(url);
        String postFix = null;       //前缀
        // 查看是否是静态文件，如果是静态文件，放行
        if(StringUtils.isNotEmpty(url)){
            int index = url.lastIndexOf(".");//获取.操作最后出现的位置的下标
            if(index > -1){//说明索引的位置可以以“.”开头
                postFix = url.substring(index);//拿到该URL的后缀
                if(StringUtils.isNotEmpty(postFix)&&excludeMappingUrl.contains(postFix)){
                    //静态文件，默认处理
                    return true;
                }
            }else if(!url.contains("/vaild")&&!url.contains("/toLogin")){
                //判断session是否存在
                HttpSession session = request.getSession();
                if(session.getAttribute("USER_INFO")==null){
                    //说明session中不存在用户的登录信息
                    //可在这里写关于转发的操作.不存在的情况就转发到登录页面中去
//                  String basePath = request.getContextPath();//解决相对路径问题，相当于站点的根路径，
//                  PrintWriter out = response.getWriter();//通过PrintWrite，以流方式输出html，返回给客户端，反馈在页面上
//                  out.println("<html>");
//                  out.println("<script>");
//                  out.println("window.open('"+basePath+"/toLogin')");  
//                  out.println("</script>");  
//                  out.println("</html>");
//                  out.flush();
                     request.getRequestDispatcher("/views/login.jsp").forward(request, response); 
                    return false;
                }
                return true;//包含以上两个URL是开始就进入的页面操作
            }
        }
        return true;

        //不是登录请求，不是静态文件，判断session是否存在
        //符合条件的准许登录，否则跳转到登录界面
    }

    public List<String> getExcludeMappingUrl() {
        return excludeMappingUrl;
    }

    public void setExcludeMappingUrl(List<String> excludeMappingUrl) {
        this.excludeMappingUrl = excludeMappingUrl;
    }

}
