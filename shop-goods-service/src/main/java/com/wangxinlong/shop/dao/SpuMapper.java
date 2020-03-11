package com.wangxinlong.shop.dao;

import java.util.List;

import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.pojo.Spec;
import com.wangxinlong.shop.pojo.SpecOption;
import com.wangxinlong.shop.pojo.Spu;
import com.wangxinlong.shop.vo.SpuVo;

public interface SpuMapper {

	List<Spu> spuList(SpuVo spuVo);

	List<Brand> getAllBrand();

	int addBrand(Spu spu);

	Spu querySpuById(Integer id);

	List<Spec> queryAllSpec();

	List<SpecOption> spuServiceById(Integer id);

}
