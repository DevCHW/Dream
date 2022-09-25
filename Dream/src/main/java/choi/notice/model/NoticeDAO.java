package choi.notice.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class NoticeDAO implements InterNoticeDAO{
	// DBCP
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
	
	
	// 생성자 
	public NoticeDAO() {
		
		try {
			// connection pool 을 위한 작업
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("/jdbc/dream");
			
			aes = new AES256(SecretMyKey.KEY);// KEY는 스태틱 변수이기때문에 객체생성 필요 x
			// SecretMyKey.KEY 는 우리가 만든 비밀키이다.
			
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) { // key 가 16글자 미만인경우 발생하는 예외 처리
			e.printStackTrace();
		}
	}
	
	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		
		try {
			if(rs != null)    { rs.close();    rs = null; }
			if(pstmt != null) { pstmt.close(); pstmt = null; }
			if(conn != null)  { conn.close();  conn = null; }
		}catch(SQLException e){
			e.printStackTrace();
		}// end of try ~ catch()---------------------------------
		
	}
			
			
			
			
	// 페이지 번호에 알맞는 게시물을 한 페이지에 보여줄 게시물 수만큼가져오는 메소드
	@Override
	public List<NoticeDTO> selectAllNotice(Map<String,String> paraMap) throws SQLException{
		List<NoticeDTO> noticeList = new ArrayList<>();
		try {
			conn = ds.getConnection();
			
			String sql = " select notice_num "
					   + " ,notice_title "
					   + " ,to_char(write_date,'yy-mm-dd hh:mi') write_date "
					   + " from  "
					   + " ( "
					   + " select rownum R,notice_num,notice_title,write_date "
					   + " from tbl_notice "
					   + " order by notice_num desc "
					   + " )A  "
					   + " where R between (?*?)-(?-1) and (?*?) ";
//			(조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수);
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,Integer.parseInt(paraMap.get("page")));
			pstmt.setInt(2,Integer.parseInt(paraMap.get("display_cnt")));
			pstmt.setInt(3,Integer.parseInt(paraMap.get("display_cnt")));
			pstmt.setInt(4,Integer.parseInt(paraMap.get("page")));
			pstmt.setInt(5,Integer.parseInt(paraMap.get("display_cnt")));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NoticeDTO ndto = new NoticeDTO();	//dto 하나 생성
				ndto.setNotice_num(rs.getInt("NOTICE_NUM"));
				ndto.setNotice_title(rs.getString("NOTICE_TITLE"));;
				
				noticeList.add(ndto);	//NoticeDTO들만 들어갈 수 있는 리스트에 담기
			}
		} finally {
			close();
		}
		return noticeList;
	}//end of public List<NoticeDTO> selectAllNotice() {}----
	
	
	//글번호를 입력받아서 한개의 글을 select 하는 메소드
	@Override
	public NoticeDTO select_one_notice(int notice_num) throws SQLException{
		NoticeDTO ndto = null;
		try {
			conn = ds.getConnection();
			
			String sql =  " select notice_title "
						+ "      , notice_content "
						+ "      , to_char(write_date,'yy-mm-dd') write_date "
						+ " from tbl_notice "
						+ " where notice_num = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,notice_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ndto = new NoticeDTO();
				
				ndto.setNotice_title(rs.getString("notice_title"));
				ndto.setNotice_content(rs.getString("notice_content"));
				ndto.setWrite_date(rs.getString("write_date"));
			}
		} finally {
			close();
		}
		return ndto;
		
	}//end of public void select_one_notice(int notice_num)------

	
	//모든 공지사항 갯수를 가져오는 메소드
	@Override
	public int cntAllNotice() throws SQLException {
		int total_cnt = 0;
		try {
			conn = ds.getConnection();
			
			String sql =  " select count(*) from tbl_notice ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total_cnt = rs.getInt(1);
			}
			
		} finally {
			close();
		}
		return total_cnt;
	}
}
