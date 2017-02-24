package pds.model;

import java.util.ArrayList;
import java.util.List;

// 리스트로 뿌려줄 Dto
public class PdsItemListModel {
	
	
	private List<PdsItem> pdsItemList;
	private int requestPage;
	private int totalPageCount;
	private int startRow;
	private int endRow;

	
	public PdsItemListModel() {
		
		this(new ArrayList<PdsItem>(), 0, 0, 0, 0);
		
	}
	
	
	public PdsItemListModel(List<PdsItem> PdsItemList, int requestPageNumber, int totalPageCount, int startRow, int endRow) {
		
		this.pdsItemList = PdsItemList;
		this.requestPage = requestPageNumber;
		this.totalPageCount = totalPageCount;
		this.startRow = startRow;
		this.endRow = endRow;
		
	}

	
	public List<PdsItem> getPdsItemList() {
		return pdsItemList;
	}
	
	
	// 글이 있다면 true 반환, 글이 없다면 false 반환
	public boolean isHasPdsItem() {
		return ! pdsItemList.isEmpty();
	}

	
	public int getRequestPage() {
		return requestPage;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

}
