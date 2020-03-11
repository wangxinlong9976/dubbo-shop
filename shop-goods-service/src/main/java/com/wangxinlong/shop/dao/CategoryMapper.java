package com.wangxinlong.shop.dao;

import java.util.List;

import com.wangxinlong.shop.pojo.Category;

public interface CategoryMapper {

	List<Category> treeData();

	int addCategory(Category category);

	int updateCategory(Category category);

	int deleteCategory(Integer id);

}
