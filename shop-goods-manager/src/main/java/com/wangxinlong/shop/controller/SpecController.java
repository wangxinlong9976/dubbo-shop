package com.wangxinlong.shop.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.pojo.Spec;
import com.wangxinlong.shop.service.SpecService;

@Controller
@RequestMapping("/spec")
public class SpecController {

	@Reference
	private SpecService specService;
	
	
	@RequestMapping("list")
	public String list(Model model,@RequestParam(defaultValue="")String keyWord,@RequestParam(defaultValue="1")Integer pageNum) {
		System.out.println("*****************************************");
		PageInfo<Spec> list = specService.list(keyWord, pageNum);
		System.out.println(list);
		model.addAttribute("pageInfo", list);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("pageNum", pageNum);
		return "spec/list";
	}
	
	@ResponseBody
	@RequestMapping("add")
	public Object add(HttpServletRequest request,Spec spec) {
		
		System.out.println("初始的spec:"+spec);
		
		spec.getOptions().removeIf(x -> {return x.getOptionName()==null;});
		
		System.out.println("处理后的spec:"+spec);
		
		Integer addSpec = specService.addSpec(spec);
		
		return addSpec>0;
	}
	
	@ResponseBody
	@RequestMapping("del")
	public Object del(String ids) {
		
		Integer i = specService.deleteSpec(ids);
		return i>0;
	}
	
	
	@ResponseBody
	@RequestMapping(value="toUpdate",produces="application/json;charset=utf-8")
	public Object toUpdate(Integer id) {
		Spec spec = specService.querySpecById(id);
		String json = JSON.toJSONString(spec);
		return json;
	}
	
	
	@ResponseBody
	@RequestMapping("update")
	public Object update(Spec spec) {
		
		System.out.println("初始的spec:"+spec);
		
		spec.getOptions().removeIf(x -> {return x.getOptionName()==null;});
		
		System.out.println("处理后的spec:"+spec);
		
		Integer updateSpec = specService.updateSpec(spec);
		return updateSpec>0;
	}
}
