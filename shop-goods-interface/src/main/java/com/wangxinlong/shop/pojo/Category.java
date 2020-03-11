package com.wangxinlong.shop.pojo;

import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Category implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Integer id;			//id;
	private Integer parentId;	//父分类的id
	@JsonProperty("text")
	private String name;		//分类的名称
	private String path;		//分类的路径
	
	@JsonProperty("nodes")
	private List<Category> children;
	
	public List<Category> getChildren() {
		return children;
	}
	public void setChildren(List<Category> children) {
		this.children = children;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Category(Integer id, Integer parentId, String name, String path) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.path = path;
	}
	public Category(Integer id, Integer parentId, String name, String path, List<Category> children) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.name = name;
		this.path = path;
		this.children = children;
	}
	@Override
	public String toString() {
		return "Category [id=" + id + ", parentId=" + parentId + ", name=" + name + ", path=" + path + ", children="
				+ children + "]";
	}
	public Category() {
		super();
	}
	
	
	

}
