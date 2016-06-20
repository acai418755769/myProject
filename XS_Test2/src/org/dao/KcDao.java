package org.dao;
import java.util.List;
import org.model.Kcb;
public interface KcDao {
	//����γ���Ϣ
	public void save(Kcb kc);
	//���ݿγ̺�ɾ���γ���Ϣ
	public void delete(String kch);
	//�޸Ŀγ���Ϣ
	public void update(Kcb kc);
	//���ݿγ̺Ų��ҿγ���Ϣ
	public Kcb find(String kch);
	//��ҳ��ʾ�γ���Ϣ
	public List<Kcb> findAll();
	//��ѯһ���������γ̼�¼
	public int findKcSize();
	public List<Kcb> findAllKc(String key);
	public List<Kcb> findByPage(final int offset,final int pageSize,String key);
}