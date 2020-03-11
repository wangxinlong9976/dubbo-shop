package com.wangxinlong.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangxinlong.shop.pojo.Brand;

public interface GoodsMapper {

	List<Brand> listBrand(@Param("firstChar")String firstChar);

	int addBrand(Brand brand);

	int updateBrand(Brand brand);

	int deleteBrand(String ids);

	Brand toUpdateBrand(Integer id);

}
