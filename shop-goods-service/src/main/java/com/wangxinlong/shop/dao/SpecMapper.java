package com.wangxinlong.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wangxinlong.shop.pojo.Spec;
import com.wangxinlong.shop.pojo.SpecOption;

public interface SpecMapper {

	List<Spec> list(String keyWord);

	int addSpec(Spec spec);

	int addSpecOption(@Param("options")List<SpecOption> options,@Param("id")Integer id);

	int deleteSpec(String ids);

	int deleteSpecOptions(String ids);

	Spec querySpecById(Integer id);

	int updateSpec(Spec spec);

	int deleteSpecOptionsBySpecId(Integer id);
	
	/*List<SpecOption> querySpecOptions(Integer id);*/

}
