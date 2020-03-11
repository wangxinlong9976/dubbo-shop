package com.wangxinlong.shop.controller;

import java.util.List;

import org.apache.dubbo.config.annotation.Reference;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.wangxinlong.shop.pojo.Category;
import com.wangxinlong.shop.service.CategoryService;
import com.wangxinlong.shop.service.GoodsService;
@RequestMapping("category")
@Controller
public class CategoryController {
	
	@Reference
	private CategoryService categoryService;
	
	@RequestMapping("list")
	public String list() {
		return "category/list";
	}
	
	@ResponseBody
	@RequestMapping("treeData")
	public List<Category> treeData() {
		
		return categoryService.treeData();
	}
	
	@ResponseBody
	@RequestMapping("addCategory")
	public Object addCategory(Category category){
		boolean addCategory = categoryService.addCategory(category);
		return addCategory;
	}
	
	@ResponseBody
	@RequestMapping("updateCategory")
	public Object updateCategory(Category category){
		boolean updateCategory = categoryService.updateCategory(category);
		return updateCategory;
	}
	
	@ResponseBody
	@RequestMapping("deleteCategory")
	public Object deleteCategory(Integer id){
		System.out.println("***************:"+id);
		boolean deleteCategory = categoryService.deleteCategory(id);
		return deleteCategory;
	}
}
