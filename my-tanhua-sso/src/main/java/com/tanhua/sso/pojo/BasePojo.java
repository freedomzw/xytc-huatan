package com.tanhua.sso.pojo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;

import java.util.Date;

/**
 * @ClassName BasePojo
 * @Description TODO
 * @Author 2023/8/31 00:48
 * @Version 1.0
 */

@Data
public abstract class BasePojo {

    //@TableField(fill = FieldFill.INSERT) //MP自动填充
    //// private Date created;
    //@TableField(fill = FieldFill.INSERT_UPDATE)
    //private Date updated;
}
