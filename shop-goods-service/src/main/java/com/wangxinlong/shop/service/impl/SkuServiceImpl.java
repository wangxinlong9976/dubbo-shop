package com.wangxinlong.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.dubbo.config.annotation.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.dao.SkuMapper;
import com.wangxinlong.shop.pojo.Sku;
import com.wangxinlong.shop.service.SkuService;
import com.wangxinlong.shop.vo.SkuVo;

@Service
public class SkuServiceImpl implements SkuService{
	
	@Resource
	private SkuMapper skuMapper;

	@Override
	public PageInfo<Sku> listSku(Integer pageNum, SkuVo skuVo) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum, 5);
		List<Sku> listSku = skuMapper.listSku(skuVo);
		return new PageInfo<Sku>(listSku);
	}

	@Override
	public Sku detailSku(Integer id) {
		// TODO Auto-generated method stub
		return skuMapper.selectSkuById(id);
	}

	@Override
	public boolean addSku(Sku sku) {
		// TODO Auto-generated method stub
		int i = skuMapper.addSku(sku);
		if(i>0) {
			i = skuMapper.addSkuSpec(sku.getId(),sku.getSpecs());
		}
		return i>0;
	}
}
