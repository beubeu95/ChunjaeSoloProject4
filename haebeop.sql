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

UPDATE user SET pw='$2a$10$WD5g5GdtR3qbpiwV5OVDMuAfKq/IA8LtbHaTVTetRTeq4jsdDLj0C' WHERE id='admin';
UPDATE user SET pt=300 WHERE id='kimhkk';

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
-- faq 테이블 생성
CREATE TABLE faq(
	fno INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(300) NOT NULL,
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP()
);
​
INSERT INTO faq VALUES (DEFAULT, '제목1', 'faq 더미데이터1 입니다.', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '제목2', 'faq 더미데이터2 입니다.', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '제목3', 'faq 더미데이터3 입니다.', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '제목4', 'faq 더미데이터4 입니다.', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '제목5', 'faq 더미데이터5 입니다.', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '제목6', 'faq 더미데이터6 입니다.', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '제목7', 'faq 더미데이터7 입니다.', DEFAULT);
INSERT INTO faq VALUES (DEFAULT, '제목8', 'faq 더미데이터8 입니다.', DEFAULT);
​
-- qna 테이블 생성
CREATE TABLE qna(
  qno int PRIMARY KEY AUTO_INCREMENT,   		
  title VARCHAR(100) NOT NULL,   			
  content VARCHAR(1000) NOT NULL,   			
  author VARCHAR(16),   								
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  
  lev INT DEFAULT 0, 									
  par INT DEFAULT 0,												
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE);
 
SELECT * FROM qna;
  
INSERT INTO	qna VALUES(DEFAULT, '가입하고 싶어요','웹사이트에 어떻게 가입하나요?','kimhkk',DEFAULT, DEFAULT, 1);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 가입하고 싶어요',' 회원 가입 페이지에서 필요한 정보를 입력하여 가입할 수 있습니다.','admin',DEFAULT, 1, 1);
INSERT INTO	qna VALUES(DEFAULT, '개인 정보 업데이트하고 싶어요','회원 정보를 어떻게 수정하거나 업데이트하나요?','kimhkk',DEFAULT, DEFAULT, 3);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 개인 정보 업데이트하고 싶어요',' 로그인 후, 마이페이지에서 회원 정보를 수정하고 업데이트할 수 있습니다.','admin',DEFAULT, 1, 3);
INSERT INTO	qna VALUES(DEFAULT, '커뮤니티 어떻게 사용해요?','게시물을 작성하는 방법을 알려주세요.','kimhkk',DEFAULT, DEFAULT, 5);
INSERT INTO	qna VALUES(DEFAULT, '[답변] 커뮤니티 어떻게 사용해요?',' 커뮤니티 페이지에서 카테고리를 설정한 후 글을 작성해주세요. 글의 하단에는 댓글을 추가할 수 있는 공간도 있습니다. 글과 댓글을 작성하면서 정보를 공유하세요','admin',DEFAULT, 1, 5);
​
​
-- 댓글 테이블 생성
CREATE TABLE COMMENT(
	comNo INT PRIMARY KEY AUTO_INCREMENT,
	bno INT,
	lno INT,
	author VARCHAR(20) NOT NULL,
	resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
	content VARCHAR(1000) NOT NULL,
	FOREIGN KEY(bno) REFERENCES board(bno) ON DELETE CASCADE,
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
-- 교재 테이블 생성
CREATE TABLE book (
	bcode VARCHAR(20) primary key NOT NULL ,
	bname VARCHAR(100) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	author VARCHAR(1000) NOT NULL,
	price INT(11) NOT NULL
);

SELECT * FROM lecture;
​
INSERT INTO book VALUES ('A-1','빠삭중학국어', '중학국어입니다.', '김이름', 12000);
INSERT INTO book VALUES ('B-1','빠삭중학수학', '중학수학입니다.', '김이름', 12000);
INSERT INTO book VALUES ('C-1','빠삭중학영어', '중학영어입니다.', '김이름', 12000);
INSERT INTO book VALUES ('D-1','빠삭중학과학', '중학과학입니다.', '김이름', 12000);
INSERT INTO book VALUES ('E-1','빠삭중학사회', '중학사회입니다.', '김이름', 12000);
SELECT * FROM book;
​
--강사 테이블 생성
CREATE TABLE teacher (
	tcode VARCHAR(20) primary key NOT NULL,
	tname VARCHAR(20) NOT NULL,
	tel VARCHAR(100),
	email VARCHAR(100)
);
​
INSERT INTO teacher VALUES ('A-1', '김선생', '010-1111-2222', 'kim@edu.com');
INSERT INTO teacher VALUES ('B-1', '이선생', '010-1111-2223', 'lee@edu.com');
INSERT INTO teacher VALUES ('C-1', '박선생', '010-1111-2224', 'park@edu.com');
INSERT INTO teacher VALUES ('D-1', '최선생', '010-1111-2225', 'choi@edu.com');
INSERT INTO teacher VALUES ('E-1', '채선생', '010-1111-2226', 'chae@edu.com');
INSERT INTO teacher VALUES ('A-2', '우선생', '010-1111-2227', 'woo@edu.com');
INSERT INTO teacher VALUES ('A-3', '한선생', '010-1111-2228', 'han@edu.com');

SELECT * FROM teacher ;

-- 강의 테이블 생성
CREATE TABLE lecture(
	lno INT PRIMARY KEY AUTO_INCREMENT,
	cate VARCHAR(5) NOT NULL,
	title VARCHAR(100) NOT NULL,
	content VARCHAR(1000),
	img VARCHAR(5000) DEFAULT 'class-1.jpg',
	video varchar(256) default 'sample1.mp4',
	price INT DEFAULT 0,
	STATUS VARCHAR(5) CHECK(status IN(0, 1)),
   sdate DATE,
   edate DATE,
	tdate INT(11) NOT null,
	bcode VARCHAR(20) NOT NULL,
	tcode VARCHAR(20) NOT NULL,
	amt INT DEFAULT 0,
	FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CASCADE,
   FOREIGN KEY(bcode) REFERENCES book(bcode) ON DELETE CASCADE,
	FOREIGN KEY(tcode) REFERENCES teacher(tcode) ON DELETE CASCADE
);
​
SELECT * FROM lecture;
​
INSERT INTO lecture (cate, title, content,price, tdate, bcode, tcode, amt) VALUES ( 'A', '빠삭중학국어', '중학생국어수업입니다.', 0, 90, 'A-1','A-1', 30); 
INSERT INTO lecture (cate, title, content,price, tdate, bcode, tcode, amt) VALUES ( 'B', '빠삭중학수학', '중학생국어수업입니다.', 0, 90, 'B-1','B-1', 30);
INSERT INTO lecture (cate, title, content,price, tdate, bcode, tcode, amt) VALUES ( 'C', '빠삭중학과학', '중학생국어수업입니다.', 0, 90, 'C-1','C-1', 30);
INSERT INTO lecture (cate, title, content,price, tdate, bcode, tcode, amt) VALUES ( 'D',  '빠삭중학과학', '중학생국어수업입니다.',0,90,'D-1','D-1', 30);
INSERT INTO lecture (cate, title, content,price, tdate, bcode, tcode, amt) VALUES ( 'E', '빠삭중학사회', '중학생국어수업입니다.', 0, 90, 'E-1','E-1', 30);
INSERT INTO lecture (cate, title, content,price, tdate, bcode, tcode, amt) VALUES ( 'A', '빠삭고등국어', '고등학생국어수업입니다.', 0, 90,'A-1','A-2', 30);
INSERT INTO lecture (cate, title, content,price, tdate, bcode, tcode, amt) VALUES ( 'A', '빠삭초등국어', '초등학생국어수업입니다.', 0, 90,'A-1','A-3', 30);
​

-- 결제 테이블 생성
create table payment(
	   pno INT primary KEY AUTO_INCREMENT,
	   title VARCHAR(100) NOT NULL,
		lno INT NOT NULL,		
		bcode VARCHAR(20) NOT NULL,
		tcode VARCHAR(20),
	   id varchar(20) not null,	
	   method varchar(100),		
	   com varchar(100),			
	   price int default 1000,
		dno INT,	
	   account varchar(100) NOT NULL,
	   resdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	   FOREIGN KEY (lno) REFERENCES lecture (lno) ON DELETE CASCADE,
	   FOREIGN KEY (bcode) REFERENCES book (bcode) ON DELETE CASCADE,
	   FOREIGN KEY (tcode) REFERENCES teacher (tcode) ON DELETE CASCADE,
		FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE
);

SELECT * FROM payment;

--남은 인원
SELECT (SELECT amt FROM lecture WHERE lno = 5) - (SELECT COUNT(*) FROM payment WHERE lno =5);
        
-- 배송 테이블 생성
create table delivery(
	 dno int primary KEY AUTO_INCREMENT,
	 pno int, 					
	 id varchar(20) not NULL,				
	 addr VARCHAR(200),	
	 tel varchar(13) not null,				
	 dcom varchar(100),					
	 dtel varchar(13),			
	 dstatus int default 0,				
	 ddate timestamp default current_timestamp,
	 edate varchar(13),						
	 dcode varchar(30),
	 FOREIGN KEY (pno) REFERENCES payment(pno) ON DELETE CASCADE,
	 FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE,					
);

SELECT * FROM delivery;


-- 출고 테이블 생성
create table serve(
    sno int primary KEY AUTO_INCREMENT,							
    bcode VARCHAR(20) NOT NULL,		              
    sprice int default 1000,					 
    amount int default 1,				         	
    resdate timestamp default CURRENT_TIMESTAMP,
	 FOREIGN KEY (bcode) REFERENCES book (bcode) ON DELETE CASCADE    
);

SELECT * FROM serve;

COMMIT;


-- 메인기능 : 공지사항 , 자료실, 자유게시판, 강의별 댓글, 교재와 시범강의
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