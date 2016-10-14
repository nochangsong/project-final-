package mybatis;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import model.BoardCommand;
import mybatis.BoardDAO;

@Repository("boardDAOImpl")
public class BoardDAOImpl extends SqlSessionDaoSupport implements BoardDAO {
	//게시판
	// 글목록
	@Override
	public List<BoardCommand> list(Map<String, Object> map) {
		List<BoardCommand> list = getSqlSession().selectList("BoardDAO.selectList", map);
		return list;
	}

	// 글개수
	@Override
	public int getRowCount(Map<String, Object> map) {
		return (Integer) getSqlSession().selectOne("BoardDAO.selectCount", map);
	}

	// 글쓰기
	@Override
	public void insert(BoardCommand board) {
		System.out.println("board::" + board);
		getSqlSession().insert("BoardDAO.insertBoard", board);
	}

	// 글상세
	@Override
	public BoardCommand selectBoard(BoardCommand board) {
		BoardCommand command = (BoardCommand) getSqlSession().selectOne("BoardDAO.selectBoard", board);

		System.out.println("command::" + command.getBNO());
		System.out.println("command::" + command.getWRITER());
		System.out.println("command::" + command.getSUBJECT());
		System.out.println("command::" + command.getREG_DATE());
		System.out.println("command::" + command.getB_CONTENT());

		return command;
	}

	// 글수정
	@Override
	public void update(BoardCommand board) {
		getSqlSession().update("BoardDAO.updateBoard", board);

	}

	// 글삭제
	@Override
	public void delete(BoardCommand board) {
		getSqlSession().delete("BoardDAO.deleteBoard", board);

	}
	//댓글
	@Override
	public void deleteComment(BoardCommand board) {
		getSqlSession().delete("BoardDAO.deleteBoardComment", board);

	}

	@Override
	public List<BoardCommand> listComment(BoardCommand board) {
		List<BoardCommand> list = getSqlSession().selectList("BoardDAO.selectListComment", board);
		System.out.println("LIST::"+list);
		return list;
	}

	@Override
	public void insertComment(BoardCommand board) {
		getSqlSession().insert("BoardDAO.insertBoardComment", board);
	}

	// 댓글개수
	@Override
	public int getCommentCount(BoardCommand board) {
		return (Integer) getSqlSession().selectOne("BoardDAO.CommentCount", board);
	}
	
	//공지사항
	// 글목록
		@Override
		public List<BoardCommand> listNotify(Map<String, Object> map) {
			List<BoardCommand> list = getSqlSession().selectList("BoardDAO.selectNotifyList", map);
			return list;
		}

		// 글개수
		@Override
		public int getNotifyCount(Map<String, Object> map) {
			return (Integer) getSqlSession().selectOne("BoardDAO.selectNotifyCount", map);
		}

		// 글쓰기
		@Override
		public void insertNotify(BoardCommand board) {
			System.out.println("board::" + board);
			getSqlSession().insert("BoardDAO.insertNotify", board);
		}

		// 글상세
		@Override
		public BoardCommand selectNotify(BoardCommand board) {
			BoardCommand command = (BoardCommand) getSqlSession().selectOne("BoardDAO.selectNotify", board);

			System.out.println("command::" + command.getBNO());
			System.out.println("command::" + command.getWRITER());
			System.out.println("command::" + command.getSUBJECT());
			System.out.println("command::" + command.getREG_DATE());
			System.out.println("command::" + command.getB_CONTENT());

			return command;
		}

		// 글수정
		@Override
		public void updateNotify(BoardCommand board) {
			getSqlSession().update("BoardDAO.updateNotify", board);

		}

		// 글삭제
		@Override
		public void deleteNotify(BoardCommand board) {
			getSqlSession().delete("BoardDAO.deleteNotify", board);

		}
}
