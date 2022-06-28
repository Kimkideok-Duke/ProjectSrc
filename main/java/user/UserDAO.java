package user;

import java.sql.*;
import java.util.ArrayList;

import db.FAQ;
import db.Notice;
import db.Review;
import db.Users001;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void setConn() throws SQLException {
		try {
			String driverName="oracle.jdbc.driver.OracleDriver";
			String dbURL = "jdbc:oracle:thin:@220.73.54.156:1521:xe";
			String dbID = "project01";
			String dbPassword="1111";
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			System.out.println("접속성공!!");
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 에러 : " + e.toString());
		}catch(SQLException sqle) {
			System.out.println("DB접속실패:"+sqle.toString());
		}catch(Exception e) {
			System.out.println("Unknown error");
			e.printStackTrace();
		}
	}
	
	public int login(String id, String passwd) {
		String sql = "select password from USERS001 where id = ? ";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(passwd)) {
					return 1; // 로그인 성공
				}else 
					return 0; // 비밀번호 틀림
			}
			return -1; // 존재하지 않는 아이디
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; // 오류
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
