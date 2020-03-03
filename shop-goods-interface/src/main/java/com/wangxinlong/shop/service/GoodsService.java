package com.wangxinlong.shop.service;

import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.pojo.Category;

public interface GoodsService {
	/**
	 * 	添加品牌
	 * @param brand
	 * @return
	 */
	public boolean addBrand(Brand brand);
	
	/**
	 * 	修改品牌
	 * @param brand
	 * @return
	 */
	public boolean updateBrand(Brand brand);
	
	/**
	 * 	删除品牌
	 * @param id
	 * @return
	 */
	public boolean deleteBrand(Integer id);
	
	/**
	 * 	查询品牌
	 * @param firstChar
	 * @param pageNum
	 * @return
	 */
	public PageInfo<Brand> listBrand(String firstChar,Integer pageNum);
	
	/**
	 * 	添加分类
	 * @param brand
	 * @return
	 */
	public boolean addCategory(Category Category);
	
	/**
	 * 	修改分类
	 * @param brand
	 * @return
	 */
	public boolean updateCategory(Category Category);
	
	/**
	 * 	删除分类
	 * @param id
	 * @return
	 */
	public boolean deleteCategory(Integer id);
	
	/**
	 * 	查询分类
	 * @param firstChar
	 * @param pageNum
	 * @return
	 */
	public PageInfo<Brand> listCategory(String firstChar,Integer pageNum);
	
	/**
	 * 	以树状形式查询分类
	 * @return
	 */
	public PageInfo<Brand> listCategory();
}
