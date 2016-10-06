package controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import model.PositionCommand;
import mybatis.PositionDAO;

@Component
public class PositionService {

	@Autowired
	private PositionDAO dao;
	public void setDao(PositionDAO dao) {
		this.dao = dao;
	}
	
	public List<PositionCommand> getPositionList() {
		List<PositionCommand> list = null;
		try{
			list = dao.getPositionList();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	public void insertPosition(PositionCommand position) {
		try {
			dao.insertPosition(position);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public void updatePosition(PositionCommand position) {
		try {
			dao.updatePosition(position);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	public void deletePosition(int position_num) {
		try {
			dao.deletePosition(position_num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
}
