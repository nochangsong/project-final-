package controller.board;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import mybatis.BoardDAO;
import model.BoardCommand;

@Repository("boardService")
public class BoardService {

	@Resource(name="boardDAOImpl")
	BoardDAO boardDAO;
		//게시판
		public List<BoardCommand> list(Map<String, Object> map){
			return boardDAO.list(map);
		}

		public int getRowCount(Map<String, Object> map){
			return boardDAO.getRowCount(map);
		}

		public void insert(BoardCommand board){
			boardDAO.insert(board);
		}

	    public BoardCommand selectBoard(BoardCommand board) {
	    	return boardDAO.selectBoard(board);
	    }

	    
		public void update(BoardCommand board) {
			boardDAO.update(board);
			
		}
		
		public void delete(BoardCommand board) {
			boardDAO.delete(board);
			
		}
		
		//댓글
		public void deleteComment(BoardCommand board) {
			boardDAO.deleteComment(board);
			
		}
		
		public List<BoardCommand> listComment(BoardCommand board) {
			return boardDAO.listComment(board);
		}
		
		public void insertComment(BoardCommand board) {
			boardDAO.insertComment(board);
		}
		public int getCommentCount(BoardCommand board){
			return boardDAO.getCommentCount(board);
		}
		
		//공지사항
		public List<BoardCommand> listNotify(Map<String, Object> map){
			return boardDAO.listNotify(map);
		}

		public int getNotifyCount(Map<String, Object> map){
			return boardDAO.getNotifyCount(map);
		}

		public void insertNotify(BoardCommand board){
			boardDAO.insertNotify(board);
		}

	    public BoardCommand selectNotify(BoardCommand board) {
	    	return boardDAO.selectNotify(board);
	    }

	    
		public void updateNotify(BoardCommand board) {
			boardDAO.updateNotify(board);
			
		}
		
		public void deleteNotify(BoardCommand board) {
			boardDAO.deleteNotify(board);
			
		}
}
