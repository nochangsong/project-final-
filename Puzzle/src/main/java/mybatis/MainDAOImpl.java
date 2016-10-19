package mybatis;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import model.BoardCommand;
import mybatis.MainDAO;

@Repository("MainDAOImpl")
public class MainDAOImpl extends SqlSessionDaoSupport implements MainDAO {
   // 세션정보
   @Override
   public BoardCommand session(String email) {
      BoardCommand command = (BoardCommand) getSqlSession().selectOne("MainDAO.session", email);
      return command;
   }

   // 게시판
   // 글목록(부서1)
   @Override
   public List<BoardCommand> list(Map<String, Object> map) {
      List<BoardCommand> list = getSqlSession().selectList("MainDAO.selectList", map);
      return list;
   }

   // 글개수(부서1)
   @Override
   public int getRowCount(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectCount", map);
   }

   // 글목록(부서2)
   @Override
   public List<BoardCommand> list2(Map<String, Object> map) {
      List<BoardCommand> list2 = getSqlSession().selectList("MainDAO.selectList2", map);
      return list2;
   }

   // 글개수(부서2)
   @Override
   public int getRowCount2(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectCount2", map);
   }

   // 글목록(부서3)
   @Override
   public List<BoardCommand> list3(Map<String, Object> map) {
      List<BoardCommand> list3 = getSqlSession().selectList("MainDAO.selectList3", map);
      return list3;
   }

   // 글개수(부서3)
   @Override
   public int getRowCount3(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectCount3", map);
   }

   // 공지사항
   // 글목록
   @Override
   public List<BoardCommand> listNotify(Map<String, Object> map) {
      List<BoardCommand> list = getSqlSession().selectList("MainDAO.selectNotifyList", map);
      return list;
   }

   // 글개수
   @Override
   public int getNotifyCount(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectNotifyCount", map);
   }
}