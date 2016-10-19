package mybatis;
 
 import java.util.List;
 import java.util.Map;
 
 import model.BoardCommand;
 
 public interface BoardDAO {
 //�Խ���
 	/**
 	 * ����Ʈ
  * @param map
 	 * @return
 	 */
 	public List<BoardCommand> list(Map<String, Object> map);
 
 	/**
 	 * ��ü�ۼ�
 	 * @param map
 	 * @return
  */
 	public int getRowCount(Map<String, Object> map);
 	
 	/**
 	 * �۾���
  * @param board
 	 */
 	public void insert(BoardCommand board);
 	
 	/**
 	 * �ۻ�
 	 * @param board
 	 */
 	public BoardCommand selectBoard(BoardCommand board);
 
 	/**
 	 * �ۼ��� 
  * @param board
 	 */
 	public void update(BoardCommand board);
 	
 	
 	/**
 	 * �ۻ���
 	 * @param board
 	 */
 	public void delete(BoardCommand board);
 	
 	//���
 	/**
 	 * �ۻ���
 	 * @param board
 	 */
 	public void deleteComment(BoardCommand board);
 	
 	/**
 	 * ����Ʈ
 	 * @param map
 	 * @return
 	 */
 	public List<BoardCommand> listComment(BoardCommand board);
 	
 	 /**
 	 * �۾���
 	 * @param board
 	 */
 	public void insertComment(BoardCommand board);
 	
 	/**
 	 * �����ü�ۼ�
 	 * @param map
 	 * @return
 	 */
 	public int getCommentCount(BoardCommand board);
 	
 	//��������
 	/**
 	 * ����Ʈ
 	 * @param map
 	 * @return
 	 */
 	public List<BoardCommand> listNotify(Map<String, Object> map);
 	
 	/**
 	 * ��ü�ۼ�
 	 * @param map
 	 * @return
 	 */
 	public int getNotifyCount(Map<String, Object> map);
 	
 	/**
 	 * �۾���
 	 * @param board
 	 */
 	public void insertNotify(BoardCommand board);
 	
 	/**
 	 * �ۻ�
 	 * @param board
 	 */
 	public BoardCommand selectNotify(BoardCommand board);
 	
 	/**
 	 * �ۼ��� 
 	 * @param board
 	 */
 	public void updateNotify(BoardCommand board);
 	
 	
 	/**
 	 * �ۻ���
 	 * @param board
 	 */
 	public void deleteNotify(BoardCommand board);
 } 