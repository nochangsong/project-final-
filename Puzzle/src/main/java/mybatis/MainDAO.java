package mybatis;

import java.util.List;
import java.util.Map;

import model.BoardCommand;

public interface MainDAO {
	/**
	 * 세션정보
	 * @param board
	 * @return
	 */
	public BoardCommand session(String email);
	
	//게시판
	/**
	 * 리스트
	 * 부서1
	 * @param map
	 * @return
	 */
	public List<BoardCommand> list(Map<String, Object> map);
	
	/**
	 * 전체글수
	 * 부서1
	 * @param map
	 * @return
	 */
	public int getRowCount(Map<String, Object> map);
	
	/**
	 * 리스트
	 * 부서2
	 * @param map
	 * @return
	 */
	public List<BoardCommand> list2(Map<String, Object> map);
	
	/**
	 * 전체글수
	 * 부서2
	 * @param map
	 * @return
	 */
	public int getRowCount2(Map<String, Object> map);
	/**
	 * 리스트
	 * 부서3
	 * @param map
	 * @return
	 */
	public List<BoardCommand> list3(Map<String, Object> map);
	
	/**
	 * 전체글수
	 * 부서3
	 * @param map
	 * @return
	 */
	public int getRowCount3(Map<String, Object> map);
	
	//공지사항
	/**
	 * 리스트
	 * @param map
	 * @return
	 */
	public List<BoardCommand> listNotify(Map<String, Object> map);
	
	/**
	 * 전체글수
	 * @param map
	 * @return
	 */
	public int getNotifyCount(Map<String, Object> map);
	
}