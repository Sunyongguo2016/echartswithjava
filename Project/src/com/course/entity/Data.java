package com.course.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "useranalysissystem")
public class Data {

	private String item_id; 	//商品ID
	private String usertag;		//买家用户标签
	private String query;		//查询词
	private Integer jpy;		//点击数
	private String ds;			//日期
	
	@Id
	public String getItem_id() {
		return item_id;
	}
	public void setItem_id(String item_id) {
		this.item_id = item_id;
	}
	
	public String getUsertag() {
		return usertag;
	}
	public void setUsertag(String usertag) {
		this.usertag = usertag;
	}
	
	public String getQuery() {
		return query;
	}
	public void setQuery(String query) {
		this.query = query;
	}
	
	public Integer getJpy() {
		return jpy;
	}
	public void setJpy(Integer jpy) {
		this.jpy = jpy;
	}
	
	public String getDs() {
		return ds;
	}
	public void setDs(String ds) {
		this.ds = ds;
	}
	
}
