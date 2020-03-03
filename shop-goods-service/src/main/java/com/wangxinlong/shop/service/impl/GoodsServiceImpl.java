package com.wangxinlong.shop.service.impl;

import org.apache.dubbo.config.annotation.Service;

import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.pojo.Category;
import com.wangxinlong.shop.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Override
	public boolean addBrand(Brand brand) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBrand(Brand brand) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteBrand(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PageInfo<Brand> listBrand(String firstChar, Integer pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean addCategory(Category Category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateCategory(Category Category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteCategory(Integer id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PageInfo<Brand> listCategory(String firstChar, Integer pageNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageInfo<Brand> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}
	
}
