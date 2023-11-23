-- music계정(=mypage계정)의 테이블 및 시퀀스 조회
select * from tab;
select * from seq;

select * from pr_board;

-- 마이페이지에서는 데이터를 가져오기만 하기에, 
-- 따로 테이블을 생성하지는 않음
--테이블명 :  myboard
CREATE TABLE pr_board (
	prNo NUMBER NOT NULL, /* 게시글번호 */
	userId VARCHAR2(20) NOT NULL, /* ID */
	prSub VARCHAR2(100) NOT NULL, /* 제목 */
	prText VARCHAR2(4000) NOT NULL, /* 내용 */
	prRcount NUMBER NOT NULL, /* 조회수 */
	prMajor VARCHAR2(100), /* 전공 */
	prLoc VARCHAR2(20), /* 지역 */
	prCareer VARCHAR2(20), /* 경력 */
	prVideo VARCHAR2(4000), /* 영상 */
	prFile VARCHAR2(4000), /* 첨부파일명 */
	prHash VARCHAR2(4000), /* 해시태그 */
	prDate DATE NOT NULL, /* 작성일 */
	prUpdate DATE, /* 수정일 */
	prDelYn CHAR(1) NOT NULL /* 삭제여부 */
);

--시퀀스
--create sequence myboard_seq;
create sequence pr_no_seq1
start with 1
increment by 1
nocache;
