package com.wangxinlong.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.dubbo.config.annotation.Reference;
import org.apache.dubbo.config.annotation.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.dao.SpuMapper;
import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.pojo.Spec;
import com.wangxinlong.shop.pojo.SpecOption;
import com.wangxinlong.shop.pojo.Spu;
import com.wangxinlong.shop.service.SpuService;
import com.wangxinlong.shop.vo.SpuVo;

@Service
public class SpuServiceImpl implements SpuService{

	@Resource
	private SpuMapper spuMapper;
	
	@Override
	public PageInfo<Spu> spuList(Integer pageNum, SpuVo spuVo) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum,5);
		List<Spu> list = spuMapper.spuList(spuVo);
		return new PageInfo<>(list);
	}

	@Override
	public List<Brand> getAllBrand() {
		// TODO Auto-generated method stub
		return spuMapper.getAllBrand();
	}

	@Override
	public boolean addBrand(Spu spu) {
		// TODO Auto-generated method stub
		return spuMapper.addBrand(spu)>0;
	}

	@Override
	public Spu querySpuById(Integer id) {
		// TODO Auto-generated method stub
		return spuMapper.querySpuById(id);
	}

	@Override
	public List<Spec> queryAllSpec() {
		// TODO Auto-generated method stub
		return spuMapper.queryAllSpec();
	}

	@Override
	public List<SpecOption> spuServiceById(Integer id) {
		// TODO Auto-generated method stub
		return spuMapper.spuServiceById(id);
	}

}
