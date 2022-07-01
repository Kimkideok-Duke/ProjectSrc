package user;

import java.sql.*;
import java.util.ArrayList;

import db.Review;
import db.Users001;
import faq.FAQ;
import notice.Notice;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConn() throws SQLException {
		try {
			String driverName="oracle.jdbc.driver.OracleDriver";
			Class.forName(driverName);
			
			String dbURL = "jdbc:oracle:thin:@220.73.54.156:1521:xe";
			String dbID = "project01";
			String dbPassword="1111";
			System.out.println("접속!!  ");
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("접속성공!!   SUCCESS");
		
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 에러 : " + e.toString());
		}catch(SQLException sqle) {
			System.out.println("DB접속실패:"+sqle.toString());
		}catch(Exception e) {
			System.out.println("Unknown error");
			e.printStackTrace();
		}
	}
	
	public String login(String id, String password) {
		System.out.println(id+"\t"+password);
	
		String sql = "select userno from users001 where id = ? and password = ?";
		try {
			 setConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("userno");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 오류
	}
	
	public String getAuth(String id, String password) {
		System.out.println(id+"\t"+password);
	
		String sql = "select auth from users001 where id = ? and password = ?";
		try {
			 setConn();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString("auth");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; // 오류
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		UserDAO dao = new UserDAO();

			
		System.out.println(dao.login("1","0"));
			

	}

}
