package hgb.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import hgb.member.model.MemberDTO;

import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO{
	// DBCP
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
	
	
	// 생성자 
	public MemberDAO() {
		
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
	
	
	
	
	// 회원한명의 상세정보를 보여주는 메소드
	@Override
	public MemberDTO memberOneDetail(String userid) throws SQLException {
		
		MemberDTO member = null;
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, to_char(joindate,'yyyy-mm-dd') as joindate, membership, username, mobile, secession, rest_member "
					   + " from "
					   + " ( "
					   + " select rownum AS RNO, userid, joindate, membership, username, mobile, secession, rest_member "
					   + " from "
					   + " ( "
					   + " select M.userid, joindate, membership, username, mobile, secession, rest_member "
					   + " from tbl_member M join tbl_member_login L "
					   + " on M.userid = L.userid "
					   + " where M.userid = ? "
					   + " order by joindate desc "
					   + " ) A "
					   + " ) B  ";
				   
					  
						
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberDTO();
				
				
				member.setUserid(rs.getString(1));
				member.setJoindate(rs.getString(2));
				member.setMembership(rs.getInt(3)); 
				member.setUsername(rs.getString(4));
				member.setMobile(rs.getString(5));
				member.setSecession(rs.getInt(6));
				member.setRest_member(rs.getInt(7));   
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}		
		
		
		return member;
				
	}// end of public MemberDTO memberOneDetail(String userid) throws SQLException-------------------

	

	
		
		
		
		
		
		
		
		
}


























