package org.service;

import java.util.List;

import org.model.Kcb;

public interface KcService {
	//插入课程信息
	public void save(Kcb kc);
	//根据课程号删除课程信息
	public void delete(String kch);
	//修改课程信息
	public void update(Kcb kc);
	//根据课程号查找课程信息
	public Kcb find(String kch);
	//分页显示课程信息
	public List<Kcb> findAll();
	//查询一共多少条课程记录
	public int findKcSize();
	public List<Kcb> findAllKc(String key);
	public List<Kcb> findByPage(final int offset,final int pageSize,String key);
}
