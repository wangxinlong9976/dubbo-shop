package com.wangxinlong.shop.controller;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.pojo.Sku;
import com.wangxinlong.shop.service.SkuService;
import com.wangxinlong.shop.vo.SkuVo;

@RequestMapping("sku")
@Controller
public class SkuController {
	
	@Reference
	private SkuService skuService;
	
	@RequestMapping("list")
	public String listSku(Model model,@RequestParam(defaultValue="1")Integer pageNum,SkuVo skuVo) {
		PageInfo<Sku> listSku = skuService.listSku(pageNum, skuVo);
		model.addAttribute("pageInfo", listSku);
		return "sku/list";
	}
	
	@RequestMapping("deatil")
	public String skuDeatil(Model model,Integer id) { 
		Sku sku = skuService.detailSku(id);
		System.err.println("sku*************:"+sku);
		model.addAttribute("sku", sku);
		return "sku/detail";
	}
	
	
	@ResponseBody
	@RequestMapping("addSku")
	public Object addSku(Sku sku) {
		System.err.println("***************************");
		System.err.println("*                          ");
		System.err.println("*                          ");
		System.err.println("sku:"+sku);
		System.err.println("spu:"+sku.getSpu());
		System.err.println("options:"+sku.getSpecs());
		System.err.println("*                          ");
		System.err.println("*                          ");
		System.err.println("***************************");
		
		return null;
	}
	
	

}
