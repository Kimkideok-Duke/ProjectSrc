package bbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BbsDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public void setConn() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String info = "jdbc:oracle:thin:@220.73.54.156:1521:xe";
			conn = DriverManager.getConnection(info, "project01", "1111");
			System.out.println("접속성공!!");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 에러 : " + e.getMessage());
		}
	}
	
	// 작성일자
	String getDate() {
		String sql = "select sysdate from dual";
		try {
			setConn();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	// 게시글 번호 부여 
	public int getNext() {
		String sql = "select bbsID from bbs order by bbsID desc";
		try {
			setConn();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) +1; // 게시글 번호 1씩 누적 처리
			}
			return 1; // 첫번째 게시물인 경우
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류	
	}

	// 글쓰기 
	public int write(String bbsTitle, String id, String bbsContent) {
		String sql = "insert into bbs values(?,?,?,?,?,?)";
		try {
				setConn();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, getNext());
				pstmt.setString(2, bbsTitle);
				pstmt.setString(3, id);
				pstmt.setString(4, getDate());
				pstmt.setString(5, bbsContent);
				pstmt.setInt(6, 1); // 글의 유효번호 (삭제된글/존재하는글)
				return pstmt.executeUpdate();
			}catch(Exception e){
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류	
	}
	
	// 게시글 리스트 메소드
	public ArrayList<Bbs> getList(int pageNumber){
		String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1 order by bbsID desc limit 10";
		ArrayList<Bbs> list = new ArrayList<Bbs>();
		try {
			setConn();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNext() - (pageNumber -1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setid(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				list.add(bbs);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean nextPage(int pageNumber) {
		String sql = "select * from bbs where bbsID < ? and bbsAvailable = 1";
		try {
			setConn();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  getNext() - (pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return true;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
	
	
	}
}
