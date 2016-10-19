package controller.main;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import mybatis.MainDAO;
import model.BoardCommand;

@Repository("MainService")
public class MainService {

	@Resource(name = "MainDAOImpl")
	MainDAO MainDAO;

	public BoardCommand session(String email) {
		return MainDAO.session(email);
	}

	// 게시판(부서1)
	public List<BoardCommand> list(Map<String, Object> map) {
		return MainDAO.list(map);
	}

	public int getRowCount(Map<String, Object> map) {
		return MainDAO.getRowCount(map);
	}
	// 게시판(부서2)
	public List<BoardCommand> list2(Map<String, Object> map) {
		return MainDAO.list2(map);
	}

	public int getRowCount2(Map<String, Object> map) {
		return MainDAO.getRowCount2(map);
	}
	// 게시판(부서3)
	public List<BoardCommand> list3(Map<String, Object> map) {
		return MainDAO.list3(map);
	}

	public int getRowCount3(Map<String, Object> map) {
		return MainDAO.getRowCount3(map);
	}
	//공지사항
	public List<BoardCommand> listNotify(Map<String, Object> map){
		return MainDAO.listNotify(map);
	}

	public int getNotifyCount(Map<String, Object> map){
		return MainDAO.getNotifyCount(map);
	}
}
