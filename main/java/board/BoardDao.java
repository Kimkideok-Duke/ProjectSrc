package board;

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


public class BoardDao {
	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private Statement stmt;

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
	
	// 삽입
	public int insert(BoardVo vo) {
		String sql="insert into board (num, title, writer, content, regdate, cnt) \r\n"
				+ "	values (board_seq.nextval, ?, ?, ?, sysdate, 0)";
		int ret = -1;
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getContent());
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
	
	
	// 조회
	public List<BoardVo> selectAll(){
		String sql = "select num, title, writer, content, regdate, cnt from board order by num desc";
		ArrayList<BoardVo> ls = new ArrayList<BoardVo>();
		try {
			setConn();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				BoardVo vo = new BoardVo(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getTimestamp(5),
						rs.getInt(6));
				ls.add(vo);
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
			if(stmt != null) {
				try {
					stmt.close();
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
		return ls;
	}

	
	public BoardVo selectOne(int num){
		String sql = "select num, title, writer, content, regdate, cnt from board where num =?";
		BoardVo vo = null;
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				updateCnt(num); // 조회수 증가
				vo = new BoardVo(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getTimestamp(5),
						rs.getInt(6) + 1); // 첫 클릭부터 조회수1이 되도록
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
		return vo;
	}

	// 수정
	public int update(BoardVo vo) {
		String sql="update board set title = ?, content = ? where num = ?";
		int ret = -1;
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getNum());
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
	
	
	public int updateCnt(int num) {
		String sql="update board set cnt = cnt+1 where num = ?"; // 조회수에 조회수+1을 해서 업데이트함
		int ret = -1;
		try {
			setConn();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	public int delete(int num) {
			String sql="delete from board where num = ?";
			int ret = -1;
			try {
				setConn();
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
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
		BoardDao dao = new BoardDao();
	}

}
