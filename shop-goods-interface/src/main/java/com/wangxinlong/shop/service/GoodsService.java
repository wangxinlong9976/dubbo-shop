package com.wangxinlong.shop.service;

import java.util.List;

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
	 * @param ids
	 * @return
	 */
	public boolean deleteBrand(String ids);
	
	/**
	 * 	查询品牌
	 * @param firstChar
	 * @param pageNum
	 * @return
	 */
	public PageInfo<Brand> listBrand(String firstChar,Integer pageNum);

	/**
	 * 	通过id查询品牌
	 * @param id
	 * @return
	 */
	public Brand toUpdateBrand(Integer id);

}
