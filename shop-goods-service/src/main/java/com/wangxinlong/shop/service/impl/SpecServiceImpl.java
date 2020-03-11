package com.wangxinlong.shop.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.dubbo.config.annotation.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.dao.SpecMapper;
import com.wangxinlong.shop.pojo.Spec;
import com.wangxinlong.shop.service.SpecService;

@Service
public class SpecServiceImpl implements SpecService{

	@Resource
	private SpecMapper specMapper;
	
	@Override
	public PageInfo<Spec> list(String keyWord, Integer pageNum) {
		// TODO Auto-generated method stub
		PageHelper.startPage(pageNum,5);
		List<Spec> list = specMapper.list(keyWord);
		
		return new PageInfo<Spec>(list);
	}

	@Override
	public Integer addSpec(Spec spec) {
		// TODO Auto-generated method stub
		int i = specMapper.addSpec(spec);
		
		if(i>0) {
			i += specMapper.addSpecOption(spec.getOptions(),spec.getId());
		}
		
		return i;
	}

	@Override
	public Integer deleteSpec(String ids) {
		// TODO Auto-generated method stub
		int i = specMapper.deleteSpec(ids);
		if(i>0) {
			i += specMapper.deleteSpecOptions(ids);
		}
		
		return i;
	}

	@Override
	public Spec querySpecById(Integer id) {
		// TODO Auto-generated method stub
		return specMapper.querySpecById(id);
	}

	@Override
	public Integer updateSpec(Spec spec) {
		// TODO Auto-generated method stub
		int i = specMapper.updateSpec(spec);
		if(i>0) {
			i = specMapper.deleteSpecOptionsBySpecId(spec.getId());
			i = specMapper.addSpecOption(spec.getOptions(), spec.getId());
		}
		return i;
	}

}
