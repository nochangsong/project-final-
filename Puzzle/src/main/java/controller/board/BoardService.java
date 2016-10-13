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

}
