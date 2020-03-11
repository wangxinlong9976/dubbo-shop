package com.wangxinlong.shop.dao;

import java.util.List;

import com.wangxinlong.shop.pojo.Sku;
import com.wangxinlong.shop.pojo.SpecOption;
import com.wangxinlong.shop.vo.SkuVo;

public interface SkuMapper {

	List<Sku> listSku(SkuVo skuVo);

	Sku selectSkuById(Integer id);

	int addSku(Sku sku);

	int addSkuSpec(Integer id, List<SpecOption> specs);

}
