package controller.board;

import org.apache.catalina.Session;

public class PagingUtil {
	private int startCount;//한페이지에서 보여줄 게시글의 시작번호
	private int endCount;//한페이지에서 보여줄 게시글의 끝번호
	private StringBuffer pagingHtml;//페이징 생성자
	
    /**
     * currentPage : 현재페이지
     * totalCount : 전체 게시물 수
     * pageCount : 한 페이지의  게시물의 수
     * Page : 한 화면에 보여줄 페이지 수
     * pageUrl : 호출 페이지 url
     * addKey : 부가적인 key 없을 때는 null 처리 (&num=23형식으로 전달할 것)
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
			addkey="";//부가키가 null일때 ""처리
		}
		
		//전체 페이지 수
		int totalPage = (int) Math.ceil((double) totalCount / pageCount);
		if(totalPage==0){
			totalPage = 1;
		}
		//현재 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if(currentPage > totalPage){
			currentPage = totalPage;
		}
		
		//현재 페이지의 처음과 마지막 글의 번호 가져오기
		startCount = (currentPage -1) * pageCount + 1;
		endCount = currentPage * pageCount;
		//시작 페이지와 마지막 페이지 값 구하기
		int startPage = (int) ((currentPage - 1) / page) * page + 1;
		int endPage = startPage + page - 1;
		//마지막 페이지가 전체 페이지 수보다 크면 전체 페이지 수로 설정
		if(endPage > totalPage){
			endPage = totalPage;
		}
		 
		//이전 페이지
		pagingHtml = new StringBuffer();
		if(currentPage > page){
			if(keyWord==null){//검색 미사용시
				pagingHtml.append("<a href="+pageUrl+"?pageNum="+(startPage - 1)+addkey+">");
			}else{
				pagingHtml.append("<a href="+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum="+(startPage - 1)+addkey+">");
			}
			pagingHtml.append("이전");
			pagingHtml.append("</a>");
		}
		pagingHtml.append(" | ");
		//페이지 번호. 현제 페이지는 빨간색으로 강조하고 링크를 제거.
		for(int i = startPage; i <= endPage; i++){
			if(i > totalPage){
				break;
			}
			if(i == currentPage){
				pagingHtml.append("<b> <font color='red'>");
				pagingHtml.append(i);
				pagingHtml.append("</font></b>");
			}else{
				if(keyWord==null){//검색 미사용시
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
		//다음 페이지
		if(totalPage - startPage >= page){
			if(keyWord==null){//검색 미사용시
				pagingHtml.append("<a href='"+pageUrl+"?pageNum="+(endPage + 1)+addkey+">");
			}else{
				pagingHtml.append("<a href='"+pageUrl+"?keyField="+keyField+"&keyWord="+keyWord+"&pageNum="+(endPage + 1)+addkey+">");
			}
			pagingHtml.append("다음");
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
