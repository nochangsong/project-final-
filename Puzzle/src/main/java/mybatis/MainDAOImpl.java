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
   // ��������
   @Override
   public BoardCommand session(String email) {
      BoardCommand command = (BoardCommand) getSqlSession().selectOne("MainDAO.session", email);
      return command;
   }

   // �Խ���
   // �۸��(�μ�1)
   @Override
   public List<BoardCommand> list(Map<String, Object> map) {
      List<BoardCommand> list = getSqlSession().selectList("MainDAO.selectList", map);
      return list;
   }

   // �۰���(�μ�1)
   @Override
   public int getRowCount(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectCount", map);
   }

   // �۸��(�μ�2)
   @Override
   public List<BoardCommand> list2(Map<String, Object> map) {
      List<BoardCommand> list2 = getSqlSession().selectList("MainDAO.selectList2", map);
      return list2;
   }

   // �۰���(�μ�2)
   @Override
   public int getRowCount2(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectCount2", map);
   }

   // �۸��(�μ�3)
   @Override
   public List<BoardCommand> list3(Map<String, Object> map) {
      List<BoardCommand> list3 = getSqlSession().selectList("MainDAO.selectList3", map);
      return list3;
   }

   // �۰���(�μ�3)
   @Override
   public int getRowCount3(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectCount3", map);
   }

   // ��������
   // �۸��
   @Override
   public List<BoardCommand> listNotify(Map<String, Object> map) {
      List<BoardCommand> list = getSqlSession().selectList("MainDAO.selectNotifyList", map);
      return list;
   }

   // �۰���
   @Override
   public int getNotifyCount(Map<String, Object> map) {
      return (Integer) getSqlSession().selectOne("MainDAO.selectNotifyCount", map);
   }
}