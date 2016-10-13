package mybatis;

import java.util.List;
import java.util.Map;

import model.BoardCommand;

public interface BoardDAO {
	//리스트
	/**
	 * 리스트
	 * @param map
	 * @return
	 */
	public List<BoardCommand> list(Map<String, Object> map);
	
	/**
	 * 전체글수
	 * @param map
	 * @return
	 */
	public int getRowCount(Map<String, Object> map);
	
	/**
	 * 글쓰기
	 * @param board
	 */
	public void insert(BoardCommand board);
	
	/**
	 * 글상세
	 * @param board
	 */
	public BoardCommand selectBoard(BoardCommand board);
	
	/**
	 * 글수정 
	 * @param board
	 */
	public void update(BoardCommand board);
	
	
	/**
	 * 글삭제
	 * @param board
	 */
	public void delete(BoardCommand board);
	
	/**
	 * 글삭제
	 * @param board
	 */
	public void deleteComment(BoardCommand board);
	
	/**
	 * 리스트
	 * @param map
	 * @return
	 */
	public List<BoardCommand> listComment(BoardCommand board);
	
	 /**
	 * 글쓰기
	 * @param board
	 */
	public void insertComment(BoardCommand board);
	
	/**
	 * 댓글전체글수
	 * @param map
	 * @return
	 */
	public int getCommentCount(BoardCommand board);
	
	
}