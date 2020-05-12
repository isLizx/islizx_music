package cn.islizx.music.util;

import com.aliyun.oss.OSSClient;
import com.aliyun.oss.model.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.io.*;
/**
 * @author lizx
 * @date 2020-03-11 - 22:13
 */
@Component
public class OssUtil {

    @Value("${spring.aliyun.endpoint}")
    private String ENDPOINT;
    @Value("${spring.aliyun.accessKeyId}")
    private String ACCESSKEYID;
    @Value("${spring.aliyun.accessKeySecret}")
    private String ACCESSKEYSECRET;
    @Value("${spring.aliyun.bucketName}")
    private String BUCKETNAME;
    @Value("${spring.aliyun.urlPrefix}")
    public String URLPREFIX;
    private OSSClient client  = null;
    private ObjectMetadata meta = null;



    public Boolean upload(String key,
                          InputStream input){
        // 初始化一个OSSClient
        client = new OSSClient(ENDPOINT,ACCESSKEYID, ACCESSKEYSECRET);
        meta = new ObjectMetadata();
        boolean flag = false;
        try {
            client.putObject(BUCKETNAME, key, input);
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            client.shutdown();
            return flag;
        }
    }
}
