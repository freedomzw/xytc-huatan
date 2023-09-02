package com.tanhua.sso.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.io.Serializable;

/**
 * @ClassName User
 * @Description TODO
 * @Author 2023/8/31 00:53
 * @Version 1.0
 */

@Data
@Slf4j
@AllArgsConstructor
@NoArgsConstructor
public class User implements Serializable {

    private Long id;
    private String mobile;
    private String password;

    public static void main(String[] args) {
        log.info(new User().toString());
    }
}
