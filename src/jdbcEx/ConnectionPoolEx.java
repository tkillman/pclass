package jdbcEx;

import java.sql.*;

public class ConnectionPoolEx {
	public static void main(String[] args) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ConnectionPool cp = null;
		try {
			cp = ConnectionPool.getInstance("jdbc:oracle:thin:@localhost:1521:xe", "cc", "1234", 5, 10);
			con = cp.getConnection();
			pstmt = con.prepareStatement("select * from dept");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				System.out.println("deptno : " + rs.getInt(1) + ",");
				System.out.println("dname : " + rs.getString(2) + ",");

				System.out.println("loc : " + rs.getString(3));
			}
		} catch (SQLException sqle) {
			sqle.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (con != null)
					cp.releaseConnection(con);
			} catch (SQLException _sqle) {
				_sqle.printStackTrace();
			}
		}
		cp.closeAll();
	}
}
