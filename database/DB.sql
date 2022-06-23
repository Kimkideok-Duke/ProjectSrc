-- 회원 테이블 (회원번호, 아이디, 비밀번호, 닉네임, 성별, 나이, 지역, 관심사 1, 관심사2, 관심사3, 관심사4, 관심사5)
CREATE TABLE USERS001 (
    userno varchar2(50) PRIMARY KEY,
    id varchar2(50) NOT NULL UNIQUE,
    passwd varchar2(50) NOT NULL,
    nickname varchar2(50) NOT NULL,
    gender char(1) CONSTRAINT user_gender_ck CHECK (gender IN ('M', 'F')),
    age NUMBER NOT NULL,
    loc varchar2(50) NOT NULL,
    interest1 varchar2(50) NOT NULL,
    interest2 varchar2(50) NOT NULL,
    interest3 varchar2(50) NOT NULL,
    interest4 varchar2(50) NOT NULL,
    interest5 varchar2(50) NOT NULL
);
	
		-- 회원 테이블 - 회원번호 시퀀스
		CREATE SEQUENCE seq_userno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
		
		-- 회원 테이블 - 회원 가입 양식(insert)
		INSERT INTO users001 values('U' || seq_userno.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
		-- 회원 테이블 - 회원 정보 조회 양식(search)
		SELECT *
		FROM users001
		WHERE userno = ?;
		-- 회원 테이블 - 회원 정보 수정 양식(update)
		UPDATE users001
		    SET id = ?,
		        passwd = ?,
		        nickname= ?, 
		        gender = ?,
		        age = ?,
		        loc = ?,
		        interest1 = ?,
		        interest2 = ?,
		        interest3 = ?,
		        interest4 = ?,
		        interest5 = ?
		WHERE userno = ?;
		-- 회원 테이블 - 회원 탈퇴 양식(delete)
		DELETE FROM users001 WHERE userno = ?;


	
-- 공지사항 테이블 (공지번호, 공지제목, 공지작성일자, 공지내용)
CREATE TABLE notice (
	noticeno varchar2(50) PRIMARY KEY,
	nttitle varchar2(500) NOT NULL,
	ntdate DATE NOT NULL,
	ntcontent varchar2(4000) NOT NULL
);
		-- 공지사항 테이블 - 공지번호 시퀀스
		CREATE SEQUENCE seq_noticeno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
		
		-- 공지사항 테이블 - 공지등록 양식(insert)
		INSERT INTO notice values('N' || seq_noticeno.nextval, ?, sysdate, ?);
		-- 공지사항 테이블 - 공지조회 양식(search)
			-- 1. 제목으로 검색
			SELECT nttitle, ntcontent
			FROM notice
			WHERE nttitle = '%' || ? || '%';
		-- 공지사항 테이블 - 공지수정 양식(update)
		-- 공지사항 테이블 - 공지삭제 양식(delete)


	
-- FAQ 테이블 (FAQ번호, 질문, 답변)
CREATE TABLE faq (
	faqno varchar2(50) PRIMARY KEY,
	question varchar2(500) NOT NULL,
	answer varchar2(4000) NOT NULL
);
		
		-- FAQ 테이블 - FAQ번호 시퀀스
		CREATE SEQUENCE seq_faqno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
		
		-- FAQ 테이블 - FAQ등록 양식
		INSERT INTO faq values('Q' || seq_faqno.nextval, ?, ?);
		-- FAQ 테이블 - FAQ조회 양식
		-- FAQ 테이블 - FAQ수정 양식
		-- FAQ 테이블 - FAQ삭제 양식
	
	

-- 리뷰 테이블 (리뷰번호, 리뷰제목, 리뷰작성자, 리뷰작성일자, 리뷰내용)
CREATE TABLE review (
	reviewno varchar2(50) PRIMARY KEY,
	rvtitle varchar2(500) NOT NULL,
	rvwriter varchar2(50) NOT NULL,
	rvdate DATE NOT NULL,
	rvcontent varchar2(4000) NOT NULL
);

		-- 리뷰 테이블 - 리뷰번호 시퀀스
		CREATE SEQUENCE seq_reviewno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
		
		-- 리뷰 테이블 - 리뷰등록 양식
		INSERT INTO review values('R' || seq_reviewno.nextval, ?, ?, sysdate, ?); 
		-- 리뷰 테이블 - 리뷰조회 양식
		-- 리뷰 테이블 - 리뷰수정 양식
		-- 리뷰 테이블 - 리뷰삭제 양식
	
	

SELECT * FROM users001;

/**   상대 매칭   **/
SELECT userno, nickname, gender, age, loc, interest1, interest2, interest3, interest4, interest5
FROM users001
where gender=?
AND loc=?
AND age >= ? AND age <= ?

/**   회원 조회   **/
SELECT nickname, gender, age, loc, interest1, interest2, interest3, interest4, interest5
FROM users001
WHERE userno = ?

/**   회원 등록   **/
INSERT INTO users001 
values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)

/**   회원 수정   **/
UPDATE users001
    SET id = ?,
        passwd = ?,
        nickname= ?, 
        gender = ?,
        age = ?,
        loc = ?,
        interest1 = ?,
        interest2 = ?,
        interest3 = ?,
        interest4 = ?,
        interest5 = ?
WHERE userno = ?

/**   회원 삭제   **/
DELETE FROM users001
WHERE userno = ?

/**   공지 조회   **/
SELECT nttitle, ntcontent
FROM notice
WHERE noticeno = ?

/**   공지 등록   **/
INSERT INTO notice 
values(?, ?, ?)

/**   공지 수정   **/
UPDATE notice
    SET nttitle = ?,
        ntcontent= ?
WHERE noticeno = ?

/**   공지 삭제   **/
DELETE FROM notice
WHERE noticeno = ?

/**   FAQ 조회   **/
SELECT question, answer
FROM faq
WHERE faqno = ?

/**   FAQ 등록   **/
INSERT INTO faq 
values(?, ?, ?)

/**   FAQ 수정   **/
UPDATE faq
    SET question = ?,
        answer= ?
WHERE faqno = ?

/**   FAQ 삭제   **/
DELETE FROM faq
WHERE faqno = ?

/**   리뷰 조회   **/
SELECT rvtitle, rvcontent
FROM review
WHERE reviewno = ?

/**   리뷰 등록   **/
INSERT INTO review 
values(?, ?, ?)

/**   리뷰 수정   **/
UPDATE review
    SET rvtitle = ?,
        rvcontent= ?
WHERE reviewno = ?

/**   리뷰 삭제   **/
DELETE FROM review
WHERE reviewno = ?