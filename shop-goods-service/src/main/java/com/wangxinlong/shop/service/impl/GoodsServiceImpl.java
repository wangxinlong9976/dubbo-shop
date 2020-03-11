package com.wangxinlong.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.dubbo.config.annotation.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.dao.GoodsMapper;
import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.pojo.Category;
import com.wangxinlong.shop.service.GoodsService;

@Service
public class GoodsServiceImpl implements GoodsService{

	@Resource
	private GoodsMapper goodsMapper;
	
	@Override
	public boolean addBrand(Brand brand) {
		// TODO Auto-generated method stub
		return goodsMapper.addBrand(brand)>0;
	}

	@Override
	public boolean updateBrand(Brand brand) {
		// TODO Auto-generated method stub
		return goodsMapper.updateBrand(brand)>0;
	}

	@Override
	public boolean deleteBrand(String ids) {
		// TODO Auto-generated method stub
		return goodsMapper.deleteBrand(ids)>0;
	}

	@Override
	public PageInfo<Brand> listBrand(String firstChar, Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<Brand> list = goodsMapper.listBrand(firstChar);
		return new PageInfo<Brand>(list);
	}

	@Override
	public Brand toUpdateBrand(Integer id) {
		// TODO Auto-generated method stub
		return goodsMapper.toUpdateBrand(id);
	}

	
}
