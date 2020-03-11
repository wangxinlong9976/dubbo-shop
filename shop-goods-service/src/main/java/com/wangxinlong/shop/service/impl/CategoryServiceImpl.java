package com.wangxinlong.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.dubbo.config.annotation.Service;

import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.dao.CategoryMapper;
import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.pojo.Category;
import com.wangxinlong.shop.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService{

	@Resource
	private CategoryMapper categoryMapper;
	
	@Override
	public boolean addCategory(Category Category) {
		// TODO Auto-generated method stub
		return categoryMapper.addCategory(Category)>0;
	}

	@Override
	public boolean updateCategory(Category Category) {
		// TODO Auto-generated method stub
		return categoryMapper.updateCategory(Category)>0;
	}

	@Override
	public boolean deleteCategory(Integer id) {
		// TODO Auto-generated method stub
		return categoryMapper.deleteCategory(id)>0;
	}

	@Override
	public PageInfo<Brand> listCategory(String firstChar, Integer pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Category> treeData() {
		// TODO Auto-generated method stub
		return categoryMapper.treeData();
	}

}
