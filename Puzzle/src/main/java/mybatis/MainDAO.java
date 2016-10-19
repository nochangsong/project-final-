package mybatis;

import java.util.List;
import java.util.Map;

import model.BoardCommand;

public interface MainDAO {
	/**
	 * ��������
	 * @param board
	 * @return
	 */
	public BoardCommand session(String email);
	
	//�Խ���
	/**
	 * ����Ʈ
	 * �μ�1
	 * @param map
	 * @return
	 */
	public List<BoardCommand> list(Map<String, Object> map);
	
	/**
	 * ��ü�ۼ�
	 * �μ�1
	 * @param map
	 * @return
	 */
	public int getRowCount(Map<String, Object> map);
	
	/**
	 * ����Ʈ
	 * �μ�2
	 * @param map
	 * @return
	 */
	public List<BoardCommand> list2(Map<String, Object> map);
	
	/**
	 * ��ü�ۼ�
	 * �μ�2
	 * @param map
	 * @return
	 */
	public int getRowCount2(Map<String, Object> map);
	/**
	 * ����Ʈ
	 * �μ�3
	 * @param map
	 * @return
	 */
	public List<BoardCommand> list3(Map<String, Object> map);
	
	/**
	 * ��ü�ۼ�
	 * �μ�3
	 * @param map
	 * @return
	 */
	public int getRowCount3(Map<String, Object> map);
	
	//��������
	/**
	 * ����Ʈ
	 * @param map
	 * @return
	 */
	public List<BoardCommand> listNotify(Map<String, Object> map);
	
	/**
	 * ��ü�ۼ�
	 * @param map
	 * @return
	 */
	public int getNotifyCount(Map<String, Object> map);
	
}