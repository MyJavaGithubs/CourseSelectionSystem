package com.fidofi.VO;

import com.fidofi.entity.Category;

/**
 * Created by fido on 2017/12/29.
 * 类别及其下课程的数量，用于图表展示
 */
public class CategoryVO {

    private Category category;//类别
    private Integer courseNum;//课程数量

    public CategoryVO() {
    }

    public CategoryVO(Category category, Integer courseNum) {
        this.category = category;
        this.courseNum = courseNum;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Integer getCourseNum() {
        return courseNum;
    }

    public void setCourseNum(Integer courseNum) {
        this.courseNum = courseNum;
    }

    @Override
    public String toString() {
        return "CategoryVO{" +
                "category=" + category +
                ", courseNum=" + courseNum +
                '}';
    }
}
