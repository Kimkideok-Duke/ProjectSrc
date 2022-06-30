package connect;

import java.sql.*;
import java.util.ArrayList;

import db.FAQ;
import db.Notice;
import db.Review;
import db.Users001;

public class PreDAO {

	private Connection con;
	private PreparedStatement pstmt;
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
	
	/**   상대 매칭   **/
	public ArrayList<Users001> matching(String gender, String loc, int age_s, int age_e) {
		ArrayList<Users001> userList = new ArrayList<Users001>();
		try {
			setConn();
			String sql = "SELECT userno, nickname, gender, age, loc, "
					+ "interest1, interest2, interest3, interest4, interest5\n"
					+ "FROM users001\n"
					+ "where gender=?\n"
					+ "AND loc=?\n"
					+ "AND age >= ? AND age <= ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, gender);
			pstmt.setString(2, loc);
			pstmt.setInt(3, age_s);
			pstmt.setInt(4, age_e);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userList.add(new Users001(
						rs.getString("nickname"),
						rs.getString("gender"),
						rs.getInt("age"),
						rs.getString("loc"),
						rs.getString("interest1"),
						rs.getString("interest2"),
						rs.getString("interest3"),
						rs.getString("interest4"),
						rs.getString("interest5")
					)
				);
			}
			rs.close();
			pstmt.close();
			con.close();
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
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		return userList;
	}

	public Users001 logIn(String id, String password) {
		Users001 user = new Users001();
		try {
			setConn();
			String sql = "SELECT userno\n"
					+ "FROM users001\n"
					+ "WHERE id = ?\n"
					+ "AND password = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user = new Users001(
							rs.getString("userno")
						);
			}
			// 자원해제
			rs.close();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		return user;
	}

	/**   회원 조회   **/
	public ArrayList<Users001> getUserList(String userno) {
		ArrayList<Users001> userList = new ArrayList<Users001>();
		try {
			setConn();
			String sql = "SELECT userno, nickname, gender, age, loc, "
				+ "interest1, interest2, interest3, interest4, interest5\n"
				+ "FROM users001\n"
				+ "WHERE userno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userList.add(new Users001(
						rs.getString("nickname"),
						rs.getString("gender"),
						rs.getInt("age"),
						rs.getString("loc"),
						rs.getString("interest1"),
						rs.getString("interest2"),
						rs.getString("interest3"),
						rs.getString("interest4"),
						rs.getString("interest5")
					)
				);
			}
			rs.close();
			pstmt.close();
			con.close();
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
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		return userList;
	}

	
	/**   중복 ID 조회   **/
	public int getOverlapIDCnt(String id) {
		int cnt = 0; // DB서버와 연결되지 않은 상태에선 cnt값이 바뀌지 않기 때문에 어떤 아이디라도 사용가능한 아이디라고 뜬다.
		try {
			setConn();
			String sql = "SELECT count(id) idCnt FROM users001 WHERE id = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			cnt = rs.getInt("idCnt");
			System.out.println(cnt);
			rs.close();
			pstmt.close();
			con.close();
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
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		return cnt;
	}


	/**  회원 등록  **/
	public void insertUsers(Users001 ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO users001(userno, id, password, nickname, gender, age, loc)\r\n"
					+ "			values('U' || seq_userno.nextval, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPassword());
			pstmt.setString(3, ins.getNickname());
			pstmt.setString(4, ins.getGender());
			pstmt.setInt(5, ins.getAge());
			pstmt.setString(6, ins.getLoc());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			System.out.println("DB 에러 : " + e.getMessage());
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**   회원 정보 수정   **/
	public void updateUsers(Users001 ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "UPDATE users001\n"
					+ "    SET id = ?,\n"
					+ "        password = ?,\n"
					+ "        nickname= ?, \n"
					+ "        gender = ?,\n"
					+ "        age = ?,\n"
					+ "        loc = ?,\n"
					+ "        interest1 = ?,\n"
					+ "        interest2 = ?,\n"
					+ "        interest3 = ?,\n"
					+ "        interest4 = ?,\n"
					+ "        interest5 = ?\n"
					+ "WHERE userno = ?";
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, ins.getId());
			pstmt.setString(2, ins.getPassword());
			pstmt.setString(3, ins.getNickname());
			pstmt.setString(4, ins.getGender());
			pstmt.setInt(5, ins.getAge());
			pstmt.setString(6, ins.getLoc());
			pstmt.setString(7, ins.getInterest1());
			pstmt.setString(8, ins.getInterest2());
			pstmt.setString(9, ins.getInterest3());
			pstmt.setString(10, ins.getInterest4());
			pstmt.setString(11, ins.getInterest5());
			pstmt.setString(12, ins.getUserno());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   회원 가입3 관심사 추가 수정   **/
	public void updateUsersInterest(Users001 ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "UPDATE users001\n"
					+ "    SET interest1 = ?,\n"
					+ "        interest2 = ?,\n"
					+ "        interest3 = ?,\n"
					+ "        interest4 = ?,\n"
					+ "        interest5 = ?\n"
					+ "WHERE id = ?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, ins.getInterest1());
			pstmt.setString(2, ins.getInterest2());
			pstmt.setString(3, ins.getInterest3());
			pstmt.setString(4, ins.getInterest4());
			pstmt.setString(5, ins.getInterest5());
			pstmt.setString(6, ins.getId());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   회원 삭제   **/
	public void deleteUsers(String userno) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "DELETE FROM users001\n"
					+ "WHERE userno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userno);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   공지 조회   **/
	public ArrayList<Notice> showNoticeInfo(String noticeno) {
		ArrayList<Notice> notiList = new ArrayList<Notice>();
		try {
			setConn();
			String sql = "SELECT nttitle, ntcontent\n"
					+ "FROM notice\n"
					+ "WHERE noticeno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticeno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				notiList.add(new Notice(
						rs.getString("noticeno"),
						rs.getString("nttitle"),
						rs.getDate("ntdate"),
						rs.getString("ntcontent")
					)
				);
			}
			rs.close();
			pstmt.close();
			con.close();
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
			if(pstmt!=null) {
				try {
					pstmt.close();
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

	/**   공지 등록   **/
	public void insertNotice(Notice ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO notice \n"
					+ "values(?, ?, sysdate, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getNoticeno());
			pstmt.setString(2, ins.getNttitle());
			pstmt.setString(3, ins.getNtcontent());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   공지 수정   **/
	public void updateNotice(Notice ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "UPDATE notice\n"
					+ "    SET nttitle = ?,\n"
					+ "        ntcontent= ?\n"
					+ "WHERE noticeno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getNttitle());
			pstmt.setString(2, ins.getNtcontent());
			pstmt.setString(3, ins.getNoticeno());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   공지 삭제   **/
	public void deleteNotice(String noticeno) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "DELETE FROM notice\n"
					+ "WHERE noticeno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, noticeno);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   FAQ 조회   **/
	public ArrayList<FAQ> showFAQInfo(String faqno) {
		ArrayList<FAQ> faqList = new ArrayList<FAQ>();
		try {
			setConn();
			String sql = "SELECT question, answer\n"
					+ "FROM faq\n"
					+ "WHERE faqno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, faqno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				faqList.add(new FAQ(
						rs.getString("faqno"),
						rs.getString("question"),
						rs.getString("faqdateS"),
						rs.getString("answer")
					)
				);
			}
			rs.close();
			pstmt.close();
			con.close();
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
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		return faqList;
	}
	
	/**   FAQ 등록   **/
	public void insertfaq(FAQ ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO faq \n"
					+ "values(?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getFaqno());
			pstmt.setString(2, ins.getQuestion());
			pstmt.setString(3, ins.getAnswer());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   FAQ 수정   **/
	public void updateFaq(FAQ ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "UPDATE faq\n"
					+ "    SET question = ?,\n"
					+ "        answer= ?\n"
					+ "WHERE faqno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getQuestion());
			pstmt.setString(2, ins.getAnswer());
			pstmt.setString(3, ins.getFaqno());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}
	

	/**   FAQ 삭제   **/
	public void deleteFaq(String faqno) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "DELETE FROM faq\n"
					+ "WHERE faqno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, faqno);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}
	/**   FAQ 상세페이지   **/
	public FAQ getFAQDetail(String faqno) {
		FAQ f = new FAQ();
		try {
			setConn();
			String sql = "SELECT *\r\n"
					+ "FROM faq\r\n"
					+ "WHERE faqno=?";
			System.out.println(sql);
			// ? 가 들어갈 부분에 '?'로 처리하면 안된다.
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, faqno);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				f = new FAQ(rs.getString("faqno"), rs.getString("question"), rs.getString("faqdateS"),rs.getString("answer"));
			}
			// 자원해제(열린순서 반대 방향)
			rs.close();
			pstmt.close();
			con.close();
			// 예외 처리.
			// 기본 예외 : DB - SQLException
			// 일반 예외 : Exception
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 예외:" + e.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			// 예외 상관없이 처리할 내용.
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return f;
	}
	
	
	/**   리뷰 조회   **/
	public ArrayList<Review> showReviewInfo(String reviewno) {
		ArrayList<Review> revList = new ArrayList<Review>();
		try {
			setConn();
			String sql = "SELECT rvtitle, rvcontent\n"
					+ "FROM review\n"
					+ "WHERE reviewno = ?";
			System.out.println(sql);
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				revList.add(new Review(
						rs.getString("reviewno"),
						rs.getString("rvtitle"),
						rs.getString("rvwriter"),
						rs.getDate("rvdate"),
						rs.getString("rvcontent")
					)
				);
			}
			rs.close();
			pstmt.close();
			con.close();
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
			if(pstmt!=null) {
				try {
					pstmt.close();
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
		return revList;
	}

	/**   리뷰 등록   **/
	public void insertReview(Review ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "INSERT INTO review \n"
					+ "values(?, ?, ?, ?, sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getReviewno());
			pstmt.setString(2, ins.getRvtitle());
			pstmt.setString(3, ins.getRvwriter());
			pstmt.setString(4, ins.getRvcontent());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   리뷰 수정   **/
	public void updateReview(Review ins) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "UPDATE review\n"
					+ "    SET rvtitle = ?,\n"
					+ "        rvcontent= ?\n"
					+ "WHERE reviewno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, ins.getRvtitle());
			pstmt.setString(2, ins.getRvcontent());
			pstmt.setString(3, ins.getReviewno());
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}

	/**   리뷰 삭제   **/
	public void deleteReview(String reviewno) {
		try {
			setConn();
			con.setAutoCommit(false);
			String sql = "DELETE FROM review\n"
					+ "WHERE reviewno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, reviewno);
			pstmt.executeUpdate();
			con.commit();
			pstmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("DB 에러 : " + e.getMessage());
			// commit 전에 예외가 발생하면 rollback 처리
		} catch (Exception e) {
			System.out.println("일반 예외 : " + e.getMessage());
		} finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
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
	}
	


	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PreDAO dao = new PreDAO();
		dao.insertNotice(new Notice("1", "첫공지", "냉무"));
	}

}
