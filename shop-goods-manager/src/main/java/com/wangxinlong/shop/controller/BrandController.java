package com.wangxinlong.shop.controller;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.service.GoodsService;

@RequestMapping("/brand")
@Controller
public class BrandController {

	@Reference
	private GoodsService goodsService;
	
	@RequestMapping("list")
	public String list(Model model,@RequestParam(defaultValue="")String firstChar,@RequestParam(defaultValue="1")Integer pageNum) {
		PageInfo<Brand> pageInfo = goodsService.listBrand(firstChar, pageNum);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("firstChar", firstChar);
		model.addAttribute("pageNum", pageNum);
		return "brand/list";
	}
	
	@ResponseBody
	@RequestMapping("addBrand")
	public Object addBrand(Brand brand) {
		
		return goodsService.addBrand(brand);
	}
	
	@ResponseBody
	@RequestMapping("deleteBrand")
	public Object deleteBrand(String ids) {
		System.out.println("**************:"+ids);
		return goodsService.deleteBrand(ids);
	}
	
	@ResponseBody
	@RequestMapping("toUpdateBrand")
	public Object toUpdateBrand(Integer id) {
		Brand brand = goodsService.toUpdateBrand(id);
		return brand;
	}
	
	@ResponseBody
	@RequestMapping("updateBrand")
	public Object updateBrand(Brand brand) {
		
		return goodsService.updateBrand(brand);
	}
}
