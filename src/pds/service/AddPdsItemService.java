package pds.service;

import java.sql.Connection;
import java.sql.SQLException;

import pds.dao.PdsItemDao;
import pds.model.AddRequest;
import pds.model.PdsItem;
import jdbc.JdbcUtil;
import jdbc.ConnectionProvider;

public class AddPdsItemService {

	
	private static AddPdsItemService instance = new AddPdsItemService();
	
	
	public static AddPdsItemService getInstance() {
		return instance;
	}
	
	
	private AddPdsItemService() {
	}
	
	
	// 
	public PdsItem add(AddRequest request) {
		
		Connection conn = null;
		try {
			
			conn = ConnectionProvider.getConnection();
			//트랜잭션 처리...
			conn.setAutoCommit(false);
			
			
			// AddRequest 객체를 PdsItem 객체로 변환해주는 작업...
			PdsItem pdsItem = request.toPdsItem();
			
			
			// 디비에 저장
			int id = PdsItemDao.getInstance().insert(conn, pdsItem);
			
			if (id == -1) {
				JdbcUtil.rollback(conn);
				throw new RuntimeException("DB 삽입 안 됨");
			}
			
			// 아이디에 pds_item_id_seq.CURRVAL 값 세팅
			pdsItem.setId(id);
			
			conn.commit();
			
			return pdsItem;
			
			
		} catch (SQLException e) {
			JdbcUtil.rollback(conn);
			throw new RuntimeException(e);
		} finally {
			if (conn != null) {
				try {
					conn.setAutoCommit(true);
				} catch (SQLException e) {
				}
			}
			JdbcUtil.close(conn);
		}
	}
}