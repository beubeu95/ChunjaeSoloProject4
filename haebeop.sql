CREATE DATABASE haebeop;

USE haebeop;

CREATE TABLE test(num INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL);

INSERT INTO test VALUES (DEFAULT, '테스트제목1');
INSERT INTO test VALUES (DEFAULT, '테스트제목2');
INSERT INTO test VALUES (DEFAULT, '테스트제목3');
INSERT INTO test VALUES (DEFAULT, '테스트제목4');
INSERT INTO test VALUES (DEFAULT, '테스트제목5');

SELECT * from test;

COMMIT;

SELECT * FROM emp;

DESC test;

DESC emp;

CREATE TABLE user(
    id VARCHAR(20) PRIMARY KEY, pw VARCHAR(350) NOT NULL,
    name VARCHAR(50) NOT NULL, email VARCHAR(150),
    tel VARCHAR(20), addr1 VARCHAR(200),
    addr2 VARCHAR(200), postcode VARCHAR(20),
    regdate DATETIME DEFAULT CURRENT_TIME,
	 birth DATE DEFAULT CURRENT_DATE,
    pt INT DEFAULT 0,
    visited INT DEFAULT 0
);

SELECT * FROM user;

CREATE TABLE notice(
	NO INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(300) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	author VARCHAR(100),
	regdate DATETIME DEFAULT CURRENT_TIME,
	cnt INT DEFAULT 0
);

SELECT * FROM notice;

INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목1  입니다.','여기는 샘플 글 1의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목2  입니다.','여기는 샘플 글 2의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목3  입니다.','여기는 샘플 글 3의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목4  입니다.','여기는 샘플 글 4의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목5  입니다.','여기는 샘플 글 5의 내용입니다.','admin',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'샘플 글 제목6  입니다.','여기는 샘플 글 6의 내용입니다.','admin',DEFAULT, DEFAULT);

CREATE TABLE category(
	cate VARCHAR(5) PRIMARY KEY NOT NULL,
	cateName VARCHAR(100) NOT NULL
);

INSERT INTO category VALUES('A', '국어');
INSERT INTO category VALUES('B', '수학');
INSERT INTO category VALUES('C', '영어');
INSERT INTO category VALUES('D', '과학');
INSERT INTO category VALUES('E', '사회');


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

CREATE TABLE COMMENT(
	comNo INT PRIMARY KEY AUTO_INCREMENT,
	cno INT NOT NULL,
	author VARCHAR(20) NOT NULL,
	resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
	content VARCHAR(1000) NOT NULL,
	FOREIGN KEY(cno) REFERENCES board(bno) ON DELETE CASCADE,
	FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE
); 

COMMIT;
