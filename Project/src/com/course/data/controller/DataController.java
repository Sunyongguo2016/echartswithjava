package com.course.data.controller;


import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.course.data.service.DataServiceImpl;
import com.course.entity.Data;
import com.course.entity.JsonResult;
import com.course.entity.PopBigData;

import framework.JsonUtils;
import framework.Page;


/**
 * @Description 		增删改查功能
 */

@Controller
@RequestMapping("data")
public class DataController {
	@Resource
	private DataServiceImpl dataServiceImpl;
	
	
	/**
	 * @Description				跳转到后台首页
	 */
	
	@RequestMapping(value="index")
	public String toAdd(@RequestParam("username") String username, HttpServletRequest request){
		if (username.equals("admin")) { 
			return "index";	
		} else {
			return "before_index";
		}
	}

	/**
	 * @Description				添加数据，获取main_info.jsp的参数，通过post方法实现添加data对象；
	 */
	@RequestMapping(value="add",method=RequestMethod.POST)
	public String add(@RequestParam("usertag") String usertag, @RequestParam("jpy") int jpy, 
			@RequestParam("item_id") String item_id, @RequestParam("ds") String ds, @RequestParam( "query") String query){


		Data e = new Data();
		e.setItem_id(item_id);
		e.setUsertag(usertag);
		e.setQuery(query);
		e.setJpy(jpy);
		e.setDs(ds);
		this.dataServiceImpl.addData(e);
		return "redirect:list";
	}
	
	/**
	 * 
	 * @Description				删除数据
	 */
	@RequestMapping(value="delete")
	public String delete(@RequestParam("itemId") String itemId, HttpServletRequest request){
		this.dataServiceImpl.dropData(itemId);
		return "redirect:list";
	}
	
	/**
	 * 
	 * @desc				查看，封装到page对象里  返回jsp页面
	 * 
	 */
	@RequestMapping("list")
	public String list(@RequestParam(name="pageNum", defaultValue="1") int pageNum,
			@RequestParam(name="searchParam",defaultValue="") String searchParam,HttpServletRequest request,
			Model model){
		Page<Data> page;
		if(searchParam == null || "".equals(searchParam)){
			page = this.dataServiceImpl.listData(pageNum, 50, null);	
		}else{
			try {
				 searchParam = new String(searchParam.getBytes("ISO8859_1"), "UTF-8");
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}
			page = this.dataServiceImpl.listData(pageNum, 50, new Object[]{searchParam});
		}
		System.out.println("page total count"+page.getTotalCount());
		request.setAttribute("page", page);
		request.setAttribute("searchParam", searchParam);
		return "main_list";
	}
	

	/**
	 * 
	 * @desc detail
	 * @param 搜索参数searchParem
	 * @return String
	 * 
	 */

	@RequestMapping("detail")
	public String billlist(
			@RequestParam(name = "itemId") String itemId,
		    HttpServletRequest request, Model model) {
		
		Data data = new Data();
		data = this.dataServiceImpl.getData(itemId);
		
		request.setAttribute("mydata", data);
		
		return "main_info";
	}
	
	
	
	// about 页面 echart图
	@RequestMapping(value="aboutjson")
    @ResponseBody
	public String aboutJson(HttpServletRequest request){
		JsonResult result = new JsonResult();
		List aData = new ArrayList();
		aData.add("7075");
		aData.add("1597");
		aData.add("1540");
		aData.add("34");
		aData.add("36");
		aData.add("1613");
		aData.add("1617");
		aData.add("6460");
		
		List xAxisData = new ArrayList();
		xAxisData.add("服装");
		xAxisData.add("童装玩具");
		xAxisData.add("数码");
		xAxisData.add("美妆洗护");
		xAxisData.add("运动户外");
		xAxisData.add("美食零食");
		xAxisData.add("家具家饰");
		xAxisData.add("办公用品");
		
		List sData = new ArrayList();
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(0)}));
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(1)}));
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(2)}));
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(3)}));
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(4)}));
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(5)}));
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(6)}));
		sData.add(dataServiceImpl.countByLikeUserTag(new Object[]{aData.get(7)}));
	
		
		result.setxAxisData(xAxisData);
		result.setSeriesData(sData);
		
		String str =JsonUtils.objectToJson(result);
//		System.out.println("str========aboutjson=================="+str);
		return str;
		
	}
	
	// about 页面 echart图
	@RequestMapping(value="newsjson")
    @ResponseBody
	public String newsJson(HttpServletRequest request){
		JsonResult result = new JsonResult();
		List aData = new ArrayList();
		aData.add("0");
		aData.add("1");
		aData.add("2");
		aData.add("3");
		aData.add("4");
		aData.add("5");
		aData.add("6");
		aData.add("7");
		aData.add("8");
		aData.add("9");
		
		List xAxisData = new ArrayList();
		xAxisData.add("天数0");
		xAxisData.add("天数1");
		xAxisData.add("天数2");
		xAxisData.add("天数3");
		xAxisData.add("天数4");
		xAxisData.add("天数5");
		xAxisData.add("天数6");
		xAxisData.add("天数7");
		xAxisData.add("天数8");
		xAxisData.add("天数9");
		
		List sData = new ArrayList();
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(0)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(1)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(2)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(3)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(4)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(5)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(6)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(7)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(8)}));
		sData.add(dataServiceImpl.countByLikeDs(new Object[]{aData.get(9)}));
		
		result.setxAxisData(xAxisData);
		result.setSeriesData(sData);
		
		String str =JsonUtils.objectToJson(result);
//		System.out.println("str=========================="+str);
		return str;
		
	}
	
	// about 页面 echart图
	@RequestMapping(value="newsjsonpie")
    @ResponseBody
	public String newsPieJson(HttpServletRequest request){
		JsonResult result = new JsonResult();
		List aData = new ArrayList();
		aData.add("0");
		aData.add("1");
		aData.add("2");
		aData.add("3");
		aData.add("4");
		aData.add("5");
		aData.add("6");
		aData.add("7");
		aData.add("8");
		aData.add("9");
		
		List xAxisData = new ArrayList();
		xAxisData.add("天数0");
		xAxisData.add("天数1");
		xAxisData.add("天数2");
		xAxisData.add("天数3");
		xAxisData.add("天数4");
		xAxisData.add("天数5");
		xAxisData.add("天数6");
		xAxisData.add("天数7");
		xAxisData.add("天数8");
		xAxisData.add("天数9");
		
		
		List sData = new ArrayList();
		
		for(int i = 0; i < 10; i++){
			PopBigData popBigData = new PopBigData();
			popBigData.setName(xAxisData.get(i).toString());
			popBigData.setValue(Integer.valueOf(dataServiceImpl.countByLikeDs(new Object[]{aData.get(i)}).toString()));
			
			sData.add(popBigData);
		}
		
		result.setxAxisData(xAxisData);
		result.setSeriesData(sData);
		
		String str =JsonUtils.objectToJson(result);
//		System.out.println("str=========================="+str);
		return str;
		
	}
		
	// about 页面 echart图
	@RequestMapping(value="productjson")
    @ResponseBody
	public String productJson(HttpServletRequest request){
		JsonResult result = new JsonResult();
		List aData = new ArrayList();
		aData.add("关键词1");
		aData.add("关键词2");
		aData.add("关键词3");
		
		List sData = new ArrayList();
		sData.add(463);
		sData.add(355);
		sData.add(182);
		
		result.setxAxisData(aData);
		result.setSeriesData(sData);
		
		String str =JsonUtils.objectToJson(result);
//		System.out.println("str=========================="+str);
		return str;
		
	}
	
	// about 页面 echart图
	@RequestMapping(value="jobjson")
    @ResponseBody
	public String jobJson(HttpServletRequest request){
		JsonResult result = new JsonResult();
		List aData = new ArrayList();
		aData.add("12922697");
		aData.add("12922698");
		aData.add("12922699");
		aData.add("12922696");
		aData.add("12922695");
		aData.add("12922694");
		
		List xAxisData = new ArrayList();
		xAxisData.add("查询词1");
		xAxisData.add("查询词2");
		xAxisData.add("查询词3");
		xAxisData.add("查询词4");
		xAxisData.add("查询词5");
		xAxisData.add("查询词6");

		
		List sData = new ArrayList();
		sData.add(dataServiceImpl.countByLikeUserQuery(new Object[]{aData.get(0)}));
		sData.add(dataServiceImpl.countByLikeUserQuery(new Object[]{aData.get(1)}));
		sData.add(dataServiceImpl.countByLikeUserQuery(new Object[]{aData.get(2)}));
		sData.add(dataServiceImpl.countByLikeUserQuery(new Object[]{aData.get(3)}));
		sData.add(dataServiceImpl.countByLikeUserQuery(new Object[]{aData.get(4)}));
		sData.add(dataServiceImpl.countByLikeUserQuery(new Object[]{aData.get(5)}));
		
	
		
		result.setxAxisData(xAxisData);
		result.setSeriesData(sData);
		
		String str =JsonUtils.objectToJson(result);
//		System.out.println("str========contantjson=================="+str);
		return str;
		
	}
	
	// about 页面 echart图
	@RequestMapping(value="contactjson")
    @ResponseBody
	public String contactJson(HttpServletRequest request){
		JsonResult result = new JsonResult();
		List aData = new ArrayList();
		aData.add(0);
		aData.add(1);
		aData.add(2);
		
		List xAxisData = new ArrayList();
		xAxisData.add("点击数0");
		xAxisData.add("点击数1");
		xAxisData.add("点击数2");

		
		List sData = new ArrayList();
		sData.add(dataServiceImpl.countByLikeUserJpy(new Object[]{aData.get(0)}));
		sData.add(dataServiceImpl.countByLikeUserJpy(new Object[]{aData.get(1)}));
		sData.add(dataServiceImpl.countByLikeUserJpy(new Object[]{aData.get(2)}));
	
		
		result.setxAxisData(xAxisData);
		result.setSeriesData(sData);
		
		String str =JsonUtils.objectToJson(result);
//		System.out.println("str========contantjson=================="+str);
		return str;
		
	}
	
	
}
