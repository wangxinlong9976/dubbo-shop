package com.wangxinlong.shop.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.wangxinlong.shop.pojo.Brand;
import com.wangxinlong.shop.pojo.Spec;
import com.wangxinlong.shop.pojo.SpecOption;
import com.wangxinlong.shop.pojo.Spu;
import com.wangxinlong.shop.service.GoodsService;
import com.wangxinlong.shop.service.SpuService;
import com.wangxinlong.shop.vo.SpuVo;

@Controller
@RequestMapping("spu")
public class SpuController {
	
	@Reference
	private SpuService spuService;
	
	
	
	@RequestMapping("list")
	public String listSpu(Model model,@RequestParam(defaultValue="1")Integer pageNum,SpuVo spuVo) {
		PageInfo<Spu> pageInfo = spuService.spuList(pageNum, spuVo);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("spuVo", spuVo);
		return "spu/list";
	}
	
	@RequestMapping("toAddSpu")
	public String toAddSpu(Model model) {
		List<Brand> allBrand = spuService.getAllBrand();
		model.addAttribute("brands", allBrand);
		return "spu/add";
	}
	
	@ResponseBody
	@RequestMapping("addSpu")
	public Object addSpu(Spu spu,@RequestParam("file")MultipartFile file) throws IllegalStateException, IOException {
		System.out.println("file******************:"+file);
		String root="d:\\pic";
		if(file!=null) {
			String fileName = UUID.randomUUID().toString()+file.getOriginalFilename().substring(file.getOriginalFilename().indexOf("."));
			file.transferTo(new File(root+"\\"+fileName));
			System.out.println("保存图片成功! path:"+fileName);
			spu.setSmallPic(fileName);
			spu.setIsMarketable("0");
		}
		boolean bool = spuService.addBrand(spu);
		return bool;
	}
	
	
	
	@RequestMapping("toAddSku")
	public String toAddSku(Model model,Integer id) {
		Spu spu = spuService.querySpuById(id);
		List<Spec> list = spuService.queryAllSpec();
		model.addAttribute("spu", spu);
		model.addAttribute("specs", list);
		return "sku/add";
	}
	
	@ResponseBody
	@RequestMapping("getOptions")
	public Object getOptions(Integer id) {
		List<SpecOption> list = spuService.spuServiceById(id);
		
		return list;
	}
}
