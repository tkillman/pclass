package pds.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import pds.dao.PdsItemDao;
import pds.model.PdsItem;
import pds.model.PdsItemListModel;
import jdbc.JdbcUtil;
import jdbc.ConnectionProvider;

public class ListPdsItemService {

	private static ListPdsItemService instance = new ListPdsItemService();

	public static ListPdsItemService getInstance() {
		return instance;
	}

	private ListPdsItemService() {
	}

	public static final int COUNT_PER_PAGE = 10;

	
	//
	public PdsItemListModel getPdsItemList(int pageNumber) {
		
		// 페이지 넘버가 0보다 작다면  에러 발생시켜준다.
		if (pageNumber < 0) {
			throw new IllegalArgumentException("page number < 0 : " + pageNumber);
		}
		
		// PdsItemDao 디비에 접근
		PdsItemDao pdsItemDao = PdsItemDao.getInstance();
		Connection conn = null;
		
		
		try {
			conn = ConnectionProvider.getConnection();
			
			// totalArticleCount 에 table pds_item 등록
			int totalArticleCount = pdsItemDao.selectCount(conn);

			if (totalArticleCount == 0) { //써진 글이 없다면 비어있는 PdsItemListModel 객체 반환
		
				return new PdsItemListModel();
			}
			
			//전체 있어야 할 페이지 수 
			int totalPageCount = calculateTotalPageCount(totalArticleCount);

			//계산해서 보여줄 글 번호들
			int firstRow = (pageNumber - 1) * COUNT_PER_PAGE + 1;
			int endRow = firstRow + COUNT_PER_PAGE - 1;

			//실질적으로 있어야 할 페이지 수로 endRow를 설정
			if (endRow > totalArticleCount) {
				endRow = totalArticleCount;
			}
			
			
			//select 메소드 실행 , firstRow와 endRow 사이의 PdsItem 리스트를 받아온다.
			List<PdsItem> PdsItemList = pdsItemDao.select(conn, firstRow, endRow);

			// PdsItemListModel 에 설정해준다.  PdsItemList, pageNumber, totalPageCount, firstRow, endRow 이 값을 전부 들고 있는
			PdsItemListModel PdsItemListView = new PdsItemListModel(PdsItemList, pageNumber, totalPageCount, firstRow, endRow);
			
			return PdsItemListView;
			
		} catch (SQLException e) {
			throw new RuntimeException("DB 에러 발생:" + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}

	
	private int calculateTotalPageCount(int totalPdsItemCount) {
		
		if (totalPdsItemCount == 0) {
			return 0;
		}
		
		int pageCount = totalPdsItemCount / COUNT_PER_PAGE;
		
		if (totalPdsItemCount % COUNT_PER_PAGE > 0) {
			pageCount++;
		}
		return pageCount;
		
	}
	
}