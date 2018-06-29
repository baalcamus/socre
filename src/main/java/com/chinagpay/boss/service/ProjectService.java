package com.chinagpay.boss.service;

import com.chinagpay.boss.model.score.Picture;
import com.chinagpay.boss.model.score.Project;

import java.util.List;

public interface ProjectService {




    /**
     *  //根据ID查找项目信息
     * @param id
     * @return
     */
    Project findByID(String id);

    //根据ID查找项目相关图片信息

    /**
     *
     * @param id   项目ID
     * @param type   图片类型  可以为空，
     * @return
     */
    List<Picture> findPictureList(String id, String type);

    //添加项目信息

    //添加项目图片信息

    //修改项目信息

    //修改项目图片信息


    //


}
