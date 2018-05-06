package com.course.data.dao;

import org.springframework.stereotype.Repository;

import com.course.entity.Data;

import framework.BaseDao;
import framework.Page;

@Repository
public class DataDaoImpl extends BaseDao<Data,Integer> {

	/**
	 * @Description 		增加数据
	 */
	public void saveData(Data e) {
		try {
			this.save(e);
		} catch (Exception ee) {
			ee.printStackTrace();
		}		
	}

	/**
	 * @Description 		按页查询
	 */
	public Page<Data> findData(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 1) {
			// 这一行没意义
			hql = "from Data e where e.usertag like ? and e.query like ?";
			params[0] = "%" + params[0] + "%";
			params[1] = "%" + params[1] + "%";
		}else if (params != null && params.length > 0) {
			hql = "from Data e where e.usertag like ?";
			params[0] = "%" + params[0] + "%";
		} else {
			hql = "from Data";
		}
		try {
			Page<Data> page = new Page<Data>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
		return null;
		}
	}

	/**
	 * @Description 		根据ID查询
	 */
	public Data getData(String item_id) {
		try {
			Data e = this.get(item_id);
			return e;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}
	
	public Data findByName(String query){
		String hql;
		Object[] params = {query};
		hql="from Data e where e.query like ?";
		try {
			return this.findOne(hql, params);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @Description 		按日期查询
	 */
	public Page<Data> findDataByTimeAndType(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 1) {
			hql = "from Data e where e.ds=? and e.query like ?";
			params[0] = params[0];
			params[1] = "%" + params[1] + "%";
		} else if (params != null && params.length > 0) {
			hql = "from Data e where e.query like ?";
			params[0] = "%" + params[0] + "%";
		}else {
			hql = "from Data";
		}
		try {
			Page<Data> page = new Page<Data>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}

	/**
	 * @Description 		按日期查询
	 */
	public Page<Data> findDataByTime(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 0) {
			hql = "from Data e where e.ds=?";
			params[0] = params[0];
		}else {
			hql = "from Data";
		}
		try {
			Page<Data> page = new Page<Data>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}
	
	/**
	 * @Description 		按点击数查询
	 */
	public Page<Data> findDataByType(int pageNum, int pageSize, Object[] params) {
		String hql;
		if (params != null && params.length > 0) {
			System.out.println("query"+params[0]);
			hql = "from Data e where e.query like ?";
			params[0] = "%" + params[0] + "%";
		} else {
			hql = "from Data";
		}
		try {
			Page<Data> page = new Page<Data>();
			page.setCurrentPageNum(pageNum);
			page.setPageSize(pageSize);
			page = this.findByPage(pageNum, pageSize, hql, params);
			return page;
		} catch (Exception ee) {
			ee.printStackTrace();
			return null;
		}
	}

	/**
	 * @Description 		编辑数据
	 */
	public void updateData(Data e) {
		try {
			this.update(e);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}

	/**
	 * @Description 		删除数据
	 */
	public void deleteData(String item_id) {
		try {
			this.delete(item_id);
		} catch (Exception ee) {
			ee.printStackTrace();
		}
	}
		
	/**
	 * @Description 		根据usertag统计总数
	 */
	public Long countByLikeUserTag(Object[] params) {
		try {
			
			String hql;
			if (params != null && params.length > 0) {
				hql = "from Data e where e.usertag like ?";
				params[0] = "%" + params[0] + "%";
			} else {
				return 0L;
			}
			return findCountByPage("select count(*) " + hql, params);
			
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		return 0L;
	}
	
	/**
	 * @Description 		根据query统计总数
	 */
	public Long countByLikeUserQuery(Object[] params) {
		try {
			
			String hql;
			if (params != null && params.length > 0) {
				hql = "from Data e where e.query like ?";
				params[0] = "%" + params[0] + "%";
			} else {
				return 0L;
			}
			return findCountByPage("select count(*) " + hql, params);
			
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		return 0L;
	}
	
	/**
	 * @Description 		根据query统计总数
	 */
	public Long countByLikeDs(Object[] params) {
		try {
			
			String hql;
			if (params != null && params.length > 0) {
				hql = "from Data e where e.ds = ?";
				
			} else {
				return 0L;
			}
			return findCountByPage("select count(*) " + hql, params);
			
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		return 0L;
	}
	
	
	
	/**
	 * @Description 		根据jpy统计总数
	 */
	public Long countByLikeUserJpy(Object[] params) {
		try {
			
			String hql;
			if (params != null && params.length > 0) {
				hql = "from Data e where e.jpy = ?";
			} else {
				return 0L;
			}
			return findCountByPage("select count(*) " + hql, params);
			
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		return 0L;
	}
	
	
		
	
	
}
