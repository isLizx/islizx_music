package cn.islizx.music.controller;

import cn.islizx.music.domain.Consumer;
import cn.islizx.music.service.impl.ConsumerServiceImpl;
import cn.islizx.music.util.MD5;
import cn.islizx.music.util.OssUtil;
import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

@RestController
@Controller
@RequestMapping("/api")
public class ConsumerController {

    @Autowired
    private ConsumerServiceImpl consumerService;

    @Autowired
    private OssUtil ossUtil;

    @Value("${spring.aliyun.urlPrefix}")
    public String URLPREFIX;


    /*@Configuration
    public class MyPicConfig implements WebMvcConfigurer {
        @Override
        public void addResourceHandlers(ResourceHandlerRegistry registry) {
            registry.addResourceHandler("/avatorImages/**").addResourceLocations("file:F:\\musicfile\\avatorImages\\");
        }
    }*/

//    添加用户
    @ResponseBody
    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    public Object addUser(HttpServletRequest req){
        JSONObject jsonObject = new JSONObject();
        try {
            String username = req.getParameter("username").trim();
            String password = req.getParameter("password").trim();
            String sex = req.getParameter("sex").trim();
            String phone_num = req.getParameter("phone_num").trim();
            String email = req.getParameter("email").trim();
            String birth = req.getParameter("birth").trim();
            String introduction = req.getParameter("introduction").trim();
            String location = req.getParameter("location").trim();
            String avator = req.getParameter("avator").trim();

            if (username.equals("") || username == null){
                jsonObject.put("code", 0);
                jsonObject.put("msg", "用户名或密码错误");
                return jsonObject;
            }
            Consumer consumer = new Consumer();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date myBirth = new Date();
            try {
                myBirth = dateFormat.parse(birth);
            } catch (Exception e){
                e.printStackTrace();
            }
            consumer.setUsername(username);
            consumer.setPassword(MD5.code(password));
            consumer.setSex(new Byte(sex));
            if (phone_num == "") {
                consumer.setPhoneNum(null);
            } else{
                consumer.setPhoneNum(phone_num);
            }

            if (email == "") {
                consumer.setEmail(null);
            } else{
                consumer.setEmail(email);
            }
            consumer.setBirth(myBirth);
            consumer.setIntroduction(introduction);
            consumer.setLocation(location);
            consumer.setAvator(avator);
            consumer.setCreateTime(new Date());
            consumer.setUpdateTime(new Date());

            boolean res = consumerService.addUser(consumer);
            if (res) {
                jsonObject.put("code", 1);
                jsonObject.put("msg", "注册成功");
                return jsonObject;
            } else {
                jsonObject.put("code", 0);
                jsonObject.put("msg", "注册失败");
                return jsonObject;
            }
        } catch (Exception e) {
            e.printStackTrace();
            jsonObject.put("code", 0);
            jsonObject.put("msg", "用户名或邮箱已被注册");
            return jsonObject;
        }
    }

//    判断是否登录成功
    @ResponseBody
    @RequestMapping(value = "/user/login/status", method = RequestMethod.POST)
    public Object loginStatus(HttpServletRequest req, HttpSession session){

        JSONObject jsonObject = new JSONObject();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
//        System.out.println(username+"  "+password);
        boolean res = consumerService.veritypasswd(username, MD5.code(password));

        if (res){
            jsonObject.put("code", 1);
            jsonObject.put("msg", "登录成功");
            jsonObject.put("userMsg", consumerService.loginStatus(username));
            session.setAttribute("username", username);
            return jsonObject;
        }else {
            jsonObject.put("code", 0);
            jsonObject.put("msg", "用户名或密码错误");
            return jsonObject;
        }

    }

//    返回所有用户
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public Object allUser(){
        return consumerService.allUser();
    }

//    返回指定ID的用户
    @RequestMapping(value = "/user/detail", method = RequestMethod.GET)
    public Object userOfId(HttpServletRequest req){
        String id = req.getParameter("id");
        return consumerService.userOfId(Integer.parseInt(id));
    }

//    删除用户
    @RequestMapping(value = "/user/delete", method = RequestMethod.GET)
    public Object deleteUser(HttpServletRequest req){
        String id = req.getParameter("id");
        return consumerService.deleteUser(Integer.parseInt(id));
    }

//    更新用户信息
    @ResponseBody
    @RequestMapping(value = "/user/update", method = RequestMethod.POST)
    public Object updateUserMsg(HttpServletRequest req){
        JSONObject jsonObject = new JSONObject();
        String id = req.getParameter("id").trim();
        String username = req.getParameter("username").trim();
        String password = req.getParameter("password").trim();
        String sex = req.getParameter("sex").trim();
        String phone_num = req.getParameter("phone_num").trim();
        String email = req.getParameter("email").trim();
        String birth = req.getParameter("birth").trim();
        String introduction = req.getParameter("introduction").trim();
        String location = req.getParameter("location").trim();
//        String avator = req.getParameter("avator").trim();
//        System.out.println(username+"  "+password+"  "+sex+"   "+phone_num+"     "+email+"      "+birth+"       "+introduction+"      "+location);

        if (username.equals("") || username == null){
            jsonObject.put("code", 0);
            jsonObject.put("msg", "用户名或密码错误");
            return jsonObject;
        }
        Consumer consumer = new Consumer();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date myBirth = new Date();
        try {
            myBirth = dateFormat.parse(birth);
        }catch (Exception e){
            e.printStackTrace();
        }
        consumer.setId(Integer.parseInt(id));
        consumer.setUsername(username);
        consumer.setPassword(MD5.code(password));
        consumer.setSex(new Byte(sex));
        consumer.setPhoneNum(phone_num);
        consumer.setEmail(email);
        consumer.setBirth(myBirth);
        consumer.setIntroduction(introduction);
        consumer.setLocation(location);
        consumer.setAvator("https://islizx.oss-cn-hangzhou.aliyuncs.com/musicfile/avatorImages/user.jpg");
        consumer.setUpdateTime(new Date());

        boolean res = consumerService.updateUserMsg(consumer);
        if (res){
            jsonObject.put("code", 1);
            jsonObject.put("msg", "修改成功");
            return jsonObject;
        }else {
            jsonObject.put("code", 0);
            jsonObject.put("msg", "修改失败");
            return jsonObject;
        }
    }

//    更新用户头像
    @ResponseBody
    @RequestMapping(value = "/user/avatar/update", method = RequestMethod.POST)
    public Object updateUserPic(@RequestParam("file") MultipartFile avatorFile, @RequestParam("id")int id){
        JSONObject jsonObject = new JSONObject();

        if (avatorFile.isEmpty()) {
            jsonObject.put("code", 0);
            jsonObject.put("msg", "文件上传失败！");
            return jsonObject;
        }
        String fileName = System.currentTimeMillis()+avatorFile.getOriginalFilename();

        String storeAvatorPath = "musicfile/avatorImages/"+fileName;
        try {
            if(!ossUtil.upload(storeAvatorPath, new
                    ByteArrayInputStream(avatorFile.getBytes()))){
                jsonObject.put("code", 0);
                jsonObject.put("msg", "上传失败");
                return jsonObject;
            }
            Consumer consumer = new Consumer();
            consumer.setId(id);
            consumer.setAvator(URLPREFIX + "/" + storeAvatorPath);
            boolean res = consumerService.updateUserAvator(consumer);
            if (res){
                jsonObject.put("code", 1);
                jsonObject.put("avator", URLPREFIX + "/" + storeAvatorPath);
                jsonObject.put("msg", "上传成功");
                return jsonObject;
            }else {
                jsonObject.put("code", 0);
                jsonObject.put("msg", "上传失败");
                return jsonObject;
            }
        }catch (Exception e){
            jsonObject.put("code", 0);
            jsonObject.put("msg", "上传失败"+e.getMessage());
            return jsonObject;
        }finally {
            return jsonObject;
        }
    }
}
