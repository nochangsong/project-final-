package mybatis;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import model.PositionCommand;

public class PositionDAO extends SqlSessionDaoSupport{

	public List<PositionCommand> getPositionList(){
		return getSqlSession().selectList("position.selectAllPositions");
	}
	public void insertPosition(PositionCommand position){
		getSqlSession().insert("position.insertPosition", position);
	}
	public void updatePosition(PositionCommand position){
		getSqlSession().update("position.updatePosition", position);
	}
	public void deletePosition(int position_num){
		getSqlSession().delete("position.deletePosition", position_num);
	}
	
}
