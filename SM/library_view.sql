ALTER TABLE tb_rent DROP CONSTRAINT fk_bCode;
ALTER TABLE tb_rent DROP CONSTRAINT fk_mCode;

DROP TABLE tb_book;
CREATE TABLE tb_book(
bCode NUMBER(10) NOT NULL PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
type VARCHAR2(20),
CONSTRAINT con_type CHECK(type IN('�Ҽ�', '����', '��ť')));
DESC tb_book;

DROP TABLE tb_member;
CREATE TABLE tb_member(
mCode NUMBER(10) NOT NULL PRIMARY KEY,
name VARCHAR2(20) NOT NULL,
tel VARCHAR2(13));
DESC tb_rent;

DROP TABLE tb_rent;
CREATE TABLE tb_rent(
nRent NUMBER(10) NOT NULL PRIMARY KEY,
bCode NUMBER(10),
mCode NUMBER(10),
rent_date date,
CONSTRAINT fk_bCode FOREIGN KEY(bCode) REFERENCES tb_book(bCode) ON DELETE CASCADE,
CONSTRAINT fk_mCode FOREIGN KEY(mCode) REFERENCES tb_member(mCode) ON DELETE CASCADE
);
DESC tb_rent;

DROP SEQUENCE seq_book;
CREATE SEQUENCE seq_book START WITH 1000000001;
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '�Բ���',    '�Ҽ�');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '§������',  '�Ҽ�');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '�籹��',    '����');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '�ﱹ����',  '����');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '�︮����',  '�Ҽ�');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '������۳�', '�Ҽ�');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '�ʷ���',    '����');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '�����',  '��ť');
INSERT INTO tb_book VALUES(seq_book.NEXTVAL, '������',    '��ť');

DROP SEQUENCE seq_member;
CREATE SEQUENCE seq_member START WITH 2000000001;
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '������',    '010-1111-2222');
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '��ź�ҳ��', '010-2222-2222');
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '���缮',    '010-3333-2222');
INSERT INTO tb_member VALUES(seq_member.NEXTVAL, '��ȣ��',    '010-4444-2222');

DROP SEQUENCE seq_rent;
CREATE SEQUENCE seq_rent START WITH 3000000001;
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000001, 2000000001, TO_DATE('20200716', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000002, 2000000002, TO_DATE('20200616', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000003, 2000000003, TO_DATE('20200511', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000004, 2000000004, TO_DATE('20200526', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000005, 2000000001, TO_DATE('20200221', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000006, 2000000002, TO_DATE('20200312', 'YYYYMMDD'));
INSERT INTO tb_rent VALUES(seq_rent.NEXTVAL, 1000000007, 2000000001, TO_DATE('20200111', 'YYYYMMDD'));

SELECT * FROM tb_member;
SELECT * FROM tb_book;
SELECT * FROM tb_rent;

DELETE FROM tb_book WHERE type IS NULL;

CREATE OR REPLACE VIEW vState
AS
SELECT b.name "å�̸�", b.type "å�帣", TO_CHAR(r.rent_date, 'YYYY-MM-DD') "�뿩��¥", m.name "�뿩ȸ��"
FROM tb_book b, tb_member m, tb_rent r
WHERE r.bcode = b.bcode and r.mcode=m.mcode;

CREATE OR REPLACE VIEW vStateB
AS
SELECT * FROM vState ORDER BY "å�̸�";

CREATE OR REPLACE VIEW vStateR
AS
SELECT * FROM vState ORDER BY "�뿩��¥";

SELECT * FROM vStateB;
SELECT * FROM vStateR;
DROP VIEW bState;
DROP VIEW viewBStateB;
COMMIT;