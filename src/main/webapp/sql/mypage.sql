
-- 문의게시글 답변 게시판(임의 생성)
CREATE TABLE qnaReplyBoard (
	qnaRepNo NUMBER NOT NULL, /* 댓글번호 */
	qnaNo NUMBER NOT NULL, /* 문의게시글 번호 */
	userId VARCHAR2(20) NOT NULL, /* 회원ID */
	qnaRepText VARCHAR2(4000) NOT NULL, /* 답변내용 */
	qnaRep_enroll_Date DATE NOT NULL, /* 작성일(sysdate) */
	qnaRepDelYn CHAR(1) NOT NULL, /* 답변삭제여부 */
	qnaRep_category VARCHAR2(50) NOT NULL /* 문의 게시판 카테고리 */
)

-- 카테고리 관련해서는 서브쿼리로 값 가져옴
(select qnaRep_category from qnaBoard
where qnaNo in (select #{qnaNo} from qnaReplyBoard))




-- 문의 답변 게시판 시퀀스
create sequence qnaRep_no_seq
start with 1
increment by 1
nocache;

select * from QNABOARD;

insert into qnaReplyBoard values (qnaRep_no_seq.nextval,
	63, 'test2', '문의 게시글 답변 작성', sysdate, 'N', '기타');

		SELECT count(*) FROM msg
		WHERE recvId = 'test2' AND msgDelYn != 'Y' AND msgCheck = 0;

		SELECT us.userId,
			(SELECT COUNT(CASE WHEN rcvmsg.readSt = 1 AND msgCheck = 0 THEN 1 ELSE NULL END) AS messagesCount
			FROM msg rcvmsg
			WHERE rcvmsg.recvId = 'test2' AND msgDelYn != 'Y') AS messagesCount				
		FROM member us
		WHERE us.userId = 'test2';

SELECT COUNT(CASE WHEN rcvmsg.readSt = 1 AND msgCheck = 0 THEN 1 ELSE NULL END) AS messagesCount
			FROM msg rcvmsg
			WHERE rcvmsg.recvId = 'test2' AND msgDelYn != 'Y';
