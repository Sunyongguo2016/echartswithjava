package com.course.data.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.course.data.dao.DataDaoImpl;
import com.course.entity.Data;
import framework.Page;

@Service
@Transactional(readOnly = false)
public class DataServiceImpl {
	@Resource
	private DataDaoImpl dataDaoImpl;
	
	/** 
	 * @Description 		增加数据
	 */
	public void addData(Data e){
		this.dataDaoImpl.saveData(e);
	}
	
	/**
	 * @Description 		根据页面查询
	 */
	@Transactional(readOnly = true)
	public Page<Data>listData(int pageNum, int pageSize, Object[]params){
		return this.dataDaoImpl.findData(pageNum, pageSize, params);
	}
	
	/**
	 * @Description 		根据日期查询
	 */
	@Transactional(readOnly = true)
	public Page<Data>listDataByTimeAndType(int pageNum, int pageSize, Object[]params){
		return this.dataDaoImpl.findDataByTimeAndType(pageNum, pageSize, params);
	}

	@Transactional(readOnly = true)
	public Page<Data>listDataByTime(int pageNum, int pageSize, Object[]params){
		return this.dataDaoImpl.findDataByTime(pageNum, pageSize, params);
	}
	
	/**
	 * @Description 		根据点击数查询
	 */
	@Transactional(readOnly = true)
	public Page<Data>listDataByType(int pageNum, int pageSize, Object[]params){
		return this.dataDaoImpl.findDataByType(pageNum, pageSize, params);
	}
	
	/**
	 * @Description 		根据Id查询
	 */
	@Transactional(readOnly = true)
	public Data getData(String item_id){
		return this.dataDaoImpl.getData(item_id);
	}
	
	@Transactional(readOnly=true)
	public Data findByName(String query){
		return this.dataDaoImpl.findByName(query);
	}
	
	/**
	 * @Description 		编辑数据
	 */
	public void editData(Data e) throws Exception{
		Data data = this.dataDaoImpl.getData(e.getItem_id());
		data.setUsertag(e.getUsertag());
		data.setQuery(e.getQuery());
		data.setJpy(e.getJpy());
		data.setDs(e.getDs());

		this.dataDaoImpl.updateData(data);
	}
	
	/**
	 * 
	 * @Description 		删除数据
	 */
	public void dropData(String item_id){
		this.dataDaoImpl.deleteData(item_id);
	}
	
	
	/**
	 * 
	 * @Description 		根据用户标签统计总数
	 */
	public Long countByLikeUserTag(Object[] params){
		return this.dataDaoImpl.countByLikeUserTag(params);
	}
	
	/**
	 * 
	 * @Description 		根据用户查询词统计总数
	 */
	public Long countByLikeUserQuery(Object[] params){
		return this.dataDaoImpl.countByLikeUserQuery(params);
	}
	
	/**
	 * 
	 * @Description 		根据天数统计总数
	 */
	public Long countByLikeDs(Object[] params){
		return this.dataDaoImpl.countByLikeDs(params);
	}
	
	
	
	/**
	 * 
	 * @Description 		根据用户点击数统计总数
	 */
	public Long countByLikeUserJpy(Object[] params){
		return this.dataDaoImpl.countByLikeUserJpy(params);
	}

}
