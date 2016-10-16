package controller.board;

public class PagingUtil {
	private int startCount;//������������ ������ �Խñ��� ���۹�ȣ
	private int endCount;//������������ ������ �Խñ��� ����ȣ
	private StringBuffer pagingHtml;//����¡ ������
	
    /**
     * currentPage : ����������
     * totalCount : ��ü �Խù� ��
     * pageCount : �� ��������  �Խù��� ��
     * Page : �� ȭ�鿡 ������ ������ ��
     * pageUrl : ȣ�� ������ url
     * addKey : �ΰ����� key ���� ���� null ó�� (&num=23�������� ������ ��)
     * */
	
	public PagingUtil(int currentPage, int totalCount, int pageCount, int page,
			String pageUrl){
		this(null, null, currentPage, totalCount, pageCount, page, pageUrl, null);
	}
	
	public PagingUtil(int currentPage, int totalCount, int pageCount, int page,
			String pageUrl, String addkey){
		this(null, null, currentPage, totalCount, pageCount, page, pageUrl, addkey);
	}
	
	public PagingUtil(String keyField, String keyWord, int currentPage, int totalCount, int pageCount, int page,
			String pageUrl){
		this(keyField, keyWord, currentPage, totalCount, pageCount, page, pageUrl, null);
	}
	
	public PagingUtil(String keyField, String keyWord, int currentPage, int totalCount, int pageCount, int page,
			String pageUrl, String addkey){
		if(addkey==null){
			addkey="";//�ΰ�Ű�� null�϶� ""ó��
		}
		
		//��ü ������ ��
		int totalPage = (int) Math.ceil((double) totalCount / pageCount);
		if(totalPage==0){
			totalPage = 1;
		}
		//���� �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		//���� �������� ó���� ������ ���� ��ȣ ��������
		startCount = (currentPage -1) * pageCount + 1;
		endCount = currentPage * pageCount;
		//���� �������� ������ ������ �� ���ϱ�
		int startPage = (int) ((currentPage - 1) / page) * page + 1;
		int endPage = startPage + page - 1;
		//������ �������� ��ü ������ ������ ũ�� ��ü ������ ���� ����
		if(endPage > totalPage){
			endPage = totalPage;
		}
		//���� ������
		pagingHtml = new StringBuffer();
		if(currentPage > page){
			if(keyWord==null){//�˻� �̻���
				pagingHtml.append("<a href="+pageUrl+"?pageNum="+(startPage - 1)+addkey+">");
			}else{
				pagingHtml.append("<a href="+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum="+(startPage - 1)+addkey+">");
			}
			pagingHtml.append("����");
			pagingHtml.append("</a>");
		}
		pagingHtml.append(" | ");
		//������ ��ȣ. ���� �������� ���������� �����ϰ� ��ũ�� ����.
		for(int i = startPage; i <= endPage; i++){
			if(i > totalPage){
				break;
			}
			if(i == currentPage){
				pagingHtml.append("<b> <font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("</font></b>");
			}else{
				if(keyWord==null){//�˻� �̻���
					pagingHtml.append("<a href='"+pageUrl+"?pageNum=");
				}else{
					pagingHtml.append("<a href='"+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum=");
				}
				pagingHtml.append(i);
				pagingHtml.append(addkey+"'>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
			}
			pagingHtml.append(" ");
		}
		pagingHtml.append(" | ");
		//���� ������
		if(totalPage - startPage >= page){
			if(keyWord==null){//�˻� �̻���
				pagingHtml.append("<a href='"+pageUrl+"?pageNum="+(endPage + 1)+addkey+">");
			}else{
				pagingHtml.append("<a href='"+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"?pageNum="+(endPage + 1)+addkey+">");
			}
			pagingHtml.append("����");
			pagingHtml.append("</a>");			
		}
	}
	public StringBuffer getPagingHtml(){
		return pagingHtml;
	}
	public int getStartCount(){
		return startCount;
	}
	public int getEndCount(){
		return endCount;
	}
}
