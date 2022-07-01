package notice;

import java.sql.*;
import java.util.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class NoticeDAO {
	
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public void setConn() throws SQLException {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String info = "jdbc:oracle:thin:@220.73.54.156:1521:xe";
			con = DriverManager.getConnection(info, "project01", "1111");
			System.out.println("접속성공!!");
		} catch (ClassNotFoundException e) {
			System.out.println("클래스 에러 : " + e.getMessage());
		}
	}
	
/*
	private int noticeno;
    private String nttitle;
	private Date ntdate;
    private String ntcontent;
    
 * */	
	
	// 조회
	public List<Notice> showNoticeInfo() {
		String sql = "select noticeno, nttitle, ntdate, ntcontent from notice order by noticeno desc";
		ArrayList<Notice> notiList = new ArrayList<Notice>();
		try {
			setConn();
			
			System.out.println(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				Notice n = new Notice(
						rs.getInt(1),
						rs.getString(2),
						rs.getDate(3),
						rs.getString(4));
				notiList.add(n);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(stmt!=null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return notiList;
	}

	public Notice selectOne(int noticeno){
		String sql = "select noticeno, nttitle, ntdate, ntcontent from notice where noticeno =?";
		Notice n = null;
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, noticeno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				n = new Notice(
						rs.getInt(1),
						rs.getString(2),
						rs.getTimestamp(3),
						rs.getString(4));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(rs != null) {
				try {
					rs.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return n;
	}

	// 수정
	public int update(Notice n) {
		String sql="update notice set nttitle = ?, ntcontent = ? where noticeno = ?";
		int ret = -1;
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getNttitle());
			pstmt.setString(2, n.getNtcontent());
			pstmt.setInt(3, n.getNoticeno());
			ret = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return ret;
	}

	public int delete(int noticeno) {
			String sql="delete from notice where noticeno = ?";
			int ret = -1;
			try {
				setConn();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, noticeno);
				ret = pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				if(pstmt != null) {
					try {
						pstmt.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
				}
				if(con != null) {
					try {
						con.close();
					}catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			
			return ret;
	}

	// 삽입
	public int insert(Notice n) {
		String sql="insert into notice (noticeno, nttitle, ntdate, ntcontent) \r\n"
				+ "	values (seq_noticeno.nextval, ?, sysdate, ?)";
		int ret = -1;
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, n.getNttitle());
			pstmt.setString(2, n.getNtcontent());
			ret = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con != null) {
				try {
					con.close();
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		return ret;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		NoticeDAO dao = new NoticeDAO();
	}

	

}
