CREATE DATABASE haebeop;
​
USE haebeop;
​
SHOW TABLES;
​
-- 회원 테이블 생성
CREATE TABLE user(
    id VARCHAR(20) PRIMARY KEY, 
	 pw VARCHAR(350) NOT NULL,
    name VARCHAR(50) NOT NULL, 
	 email VARCHAR(150),
    tel VARCHAR(20), 
	 addr1 VARCHAR(200),
    addr2 VARCHAR(200), 
	 postcode VARCHAR(20),
    regdate DATETIME DEFAULT CURRENT_TIME,
	 birth DATE DEFAULT CURRENT_DATE,
    pt INT DEFAULT 0,
    visited INT DEFAULT 0
);
​
SELECT * FROM user;
​
UPDATE user SET pw='$2a$10$WD5g5GdtR3qbpiwV5OVDMuAfKq/IA8LtbHaTVTetRTeq4jsdDLj0C' WHERE id='admin';
​
-- 공지사항 테이블 생성 
CREATE TABLE notice(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(300) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	author VARCHAR(100),
	regdate DATETIME DEFAULT CURRENT_TIME,
	cnt INT DEFAULT 0
);
​
SELECT * FROM notice;
​
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목1  입니다.','여기는 샘플 글 1의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목2  입니다.','여기는 샘플 글 2의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목3  입니다.','여기는 샘플 글 3의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목4  입니다.','여기는 샘플 글 4의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목5  입니다.','여기는 샘플 글 5의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목6  입니다.','여기는 샘플 글 6의 내용입니다.','admin',DEFAULT, DEFAULT);
​
-- 카테고리 테이블 생성 
CREATE TABLE category(
	cate VARCHAR(5) PRIMARY KEY NOT NULL,
	cateName VARCHAR(100) NOT NULL
);
​
INSERT INTO category VALUES('A', '국어');
INSERT INTO category VALUES('B', '수학');
INSERT INTO category VALUES('C', '영어');
INSERT INTO category VALUES('D', '과학');
INSERT INTO category VALUES('E', '사회');
​
SELECT * FROM category;
​
-- 게시판 테이블 생성 
CREATE TABLE board (
	 bno INT PRIMARY KEY AUTO_INCREMENT,
    cate VARCHAR(5) NOT NULL,
    title VARCHAR(200) NOT NULL,
    content VARCHAR(1000),
    author VARCHAR(20),
    resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
    cnt INT DEFAULT 0,
    FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
    FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE
);
​
INSERT INTO board(cate, title, content, author)
VALUES ('A', '게시판 더미데이터1', '여기는 게시판 더미데이터1입니다', 'admin');
INSERT INTO board(cate, title, content, author)
VALUES ('B', '게시판 더미데이터2', '여기는 게시판 더미데이터2입니다', 'admin');
INSERT INTO board(cate, title, content, author)
VALUES ('C', '게시판 더미데이터3', '여기는 게시판 더미데이터3입니다', 'admin');
INSERT INTO board(cate, title, content, author)
VALUES ('D', '게시판 더미데이터4', '여기는 게시판 더미데이터4입니다', 'admin');
INSERT INTO board(cate, title, content, author)
VALUES ('A', '게시판 더미데이터5', '여기는 게시판 더미데이터5입니다', 'admin');
INSERT INTO board(cate, title, content, author)
VALUES ('B', '게시판 더미데이터6', '여기는 게시판 더미데이터6입니다', 'admin');
INSERT INTO board(cate, title, content, author)
VALUES ('C', '게시판 더미데이터7', '여기는 게시판 더미데이터7입니다', 'admin');
INSERT INTO board(cate, title, content, author)
VALUES ('D', '게시판 더미데이터8', '여기는 게시판 더미데이터8입니다', 'admin');
​
SELECT * FROM board;
​
-- 댓글 테이블 생성
CREATE TABLE COMMENT(
	comNo INT PRIMARY KEY AUTO_INCREMENT,
	cno INT NOT NULL,
	author VARCHAR(20) NOT NULL,
	resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
	content VARCHAR(1000) NOT NULL,
	FOREIGN KEY(cno) REFERENCES board(bno) ON DELETE CASCADE,
	FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE
); 
​
SELECT * FROM comment;
​
-- 자료실 자료 데이터 테이블 생성
CREATE TABLE fileInfo(
	fno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	articleno INT,
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL
);
​
SELECT * FROM fileInfo;
                         
-- 자료실 테이블 생성
CREATE TABLE fileboard (
   articleno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id varchar(16) NOT NULL,
   title varchar(100) NOT NULL,
   content varchar(2000) NOT NULL,
   regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
   FOREIGN KEY(id) REFERENCES user(id) ON DELETE CASCADE
);
​
SELECT * FROM fileboard;
​
-- 과목  테잉블 생성
CREATE TABLE subject(
	scode VARCHAR(20) PRIMARY KEY NOT NULL,
	name VARCHAR(100) NOT NULL,
	price INT(11) NOT NULL,
)
​
-- 교재 테이블 생성
CREATE TABLE book (
	bcode VARCHAR(20) primary key NOT NULL ,
	name VARCHAR(100) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	author VARCHAR(1000) NOT NULL,
	price INT(11) NOT NULL
);
​
--강사 테이블 생성
CREATE TABLE teacher (
	tcode VARCHAR(20) primary key NOT NULL,
	name VARCHAR(20) NOT NULL,
	tel VARCHAR(100),
	email VARCHAR(100),
);
​
-- 강의 테이블 생성
CREATE TABLE lecture(
	lcode VARCHAR(20) NOT NULL,
	lname VARCHAR(100) NOT NULL,
	lfile VARCHAR(400),
	scode VARCHAR(20) NOT NULL,
	bcode VARCHAR(20) NULL DEFAULT,
	tcode VARCHAR(20) NOT NULL,
	amt INT(11),
   FOREIGN KEY (bcode) REFERENCES book(bcode) ON DELETE CASCADE,
	FOREIGN KEY (tcode) REFERENCES teacher(tcode) ON DELETE CASCADE,
	FOREIGN KEY (scode) REFERENCES subject(scode) ON DELETE CASCADE
);
​
--수강 테이블 생성
CREATE TABLE student (
	sdcode VARCHAR(20) primary key NOT NULL,
	lcode VARCHAR(20) NOT NULL,
	id VARCHAR(20) NOT NULL,
	totaltime INT(11),
	status VARCHAR(5) CHECK (status in (0,1)),
	FOREIGN KEY (lcode) REFERENCES lecture (lcode) ON DELETE CASCADE,
	FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE,
);
​
COMMIT;
​
-- 메인기능 : 공지사항 , 자료실, 자유게시판,강의별 댓글, 교재와 시범강의
-- 부가 기능 : 파일업로드, 채팅, 타계정 또는 sns 로그인
-- 가입시 축하 이메일 보내기, 비밀번호 변경시 이메일 보내기, 온라인 평가,
-- 진도관리, 학습 스케줄러, 나의 강의실 등
​
-- 강의배정이란?
-- 과목, 강사, 교재 정보를 강의 테이블에 등록하는 행위로 
-- 하나의 과목당 여러 강의를 모두 등록해야한다.
​
-- 수강신청이란?
-- 학생별로 모든 강의정보가 등록되어야 하며, 만약 수강신청시 수강인원이
-- 초과될 경우 수강신청을 할 수 없다. (강의 - 수강인원 & 수강 - 학생 아이디 같을 때 수강신청 더이상 하지 못함)