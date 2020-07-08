/*�����ϱ���, constraint(foreign key) �� ����*/
ALTER TABLE tbl_salelist_01 DROP CONSTRAINT FK_PCODE;

/* ���̺���� */
DROP TABLE tbl_product_01; 

/* ��ǰ ���̺� ����� */
CREATE TABLE tbl_product_01( 
pcode VARCHAR2(10) NOT NULL PRIMARY KEY,
name  VARCHAR2(20),
cost  NUMBER(10)
);

/* record �Է�*/
INSERT INTO tbl_product_01 VALUES('AA01', '�Ƹ޸�ī��', 3000);
INSERT INTO tbl_product_01 VALUES('AA02', '����������', 3500);
INSERT INTO tbl_product_01 VALUES('AA03', 'ī���',   4000);
INSERT INTO tbl_product_01 VALUES('AA04', 'ī��Ḷ��', 4500);
INSERT INTO tbl_product_01 VALUES('AA05', 'īǪġ��',   5000);
INSERT INTO tbl_product_01 VALUES('AA06', '���ڷ�����', 6000);
INSERT INTO tbl_product_01 VALUES('AA07', '����������', 6500);
INSERT INTO tbl_product_01 VALUES('AA08', '�����꽺',   7000);
INSERT INTO tbl_product_01 VALUES('AA09', '������',     2500);


ALTER TABLE tbl_salelist_01 DROP CONSTRAINT FK_SCODE;

DROP TABLE tbl_shop_01;

/* ���� ���̺� ����� */
CREATE TABLE tbl_shop_01(
scode VARCHAR2(10) NOT NULL PRIMARY KEY,
sname VARCHAR2(20)
);
INSERT INTO tbl_shop_01 VALUES('S001', '������'  );
INSERT INTO tbl_shop_01 VALUES('S002', '������'  );
INSERT INTO tbl_shop_01 VALUES('S003', '������'  );
INSERT INTO tbl_shop_01 VALUES('S004', '������'  );
INSERT INTO tbl_shop_01 VALUES('S005', '���빮��');
INSERT INTO tbl_shop_01 VALUES('S006', '��õ��'  );

DROP TABLE tbl_salelist_01;

/* �Ǹ� ���� ���̺� ����� */
CREATE TABLE tbl_salelist_01(
saleno   NUMBER(10) NOT NULL PRIMARY KEY,
pcode    VARCHAR2(10) NOT NULL,
saledate DATE,
scode    VARCHAR2(10) NOT NULL,
amount   NUMBER(10),
CONSTRAINT FK_SCODE FOREIGN KEY(scode) REFERENCES tbl_shop_01(scode),
CONSTRAINT FK_PCODE FOREIGN KEY(pcode) REFERENCES tbl_product_01(pcode)
);
INSERT INTO tbl_salelist_01 VALUES(100001, 'AA01', TO_DATE('20200102', 'YYYYMMDD'), 'S001', 50);
INSERT INTO tbl_salelist_01 VALUES(100002, 'AA03', TO_DATE('20200202', 'YYYYMMDD'), 'S002', 40);
INSERT INTO tbl_salelist_01 VALUES(100003, 'AA04', TO_DATE('20200302', 'YYYYMMDD'), 'S002', 20);
INSERT INTO tbl_salelist_01 VALUES(100004, 'AA04', TO_DATE('20200402', 'YYYYMMDD'), 'S001', 30);
INSERT INTO tbl_salelist_01 VALUES(100005, 'AA05', TO_DATE('20200502', 'YYYYMMDD'), 'S004', 40);
INSERT INTO tbl_salelist_01 VALUES(100006, 'AA03', TO_DATE('20200902', 'YYYYMMDD'), 'S004', 30);
INSERT INTO tbl_salelist_01 VALUES(100007, 'AA01', TO_DATE('20200702', 'YYYYMMDD'), 'S003', 10);
INSERT INTO tbl_salelist_01 VALUES(100008, 'AA04', TO_DATE('20200901', 'YYYYMMDD'), 'S003', 20);
INSERT INTO tbl_salelist_01 VALUES(100009, 'AA01', TO_DATE('20200902', 'YYYYMMDD'), 'S001', 30);
INSERT INTO tbl_salelist_01 VALUES(100010, 'AA05', TO_DATE('20200903', 'YYYYMMDD'), 'S002', 40);
INSERT INTO tbl_salelist_01 VALUES(100011, 'AA01', TO_DATE('20200904', 'YYYYMMDD'), 'S001', 50);
INSERT INTO tbl_salelist_01 VALUES(100012, 'AA03', TO_DATE('20200905', 'YYYYMMDD'), 'S002', 40);
INSERT INTO tbl_salelist_01 VALUES(100013, 'AA04', TO_DATE('20200906', 'YYYYMMDD'), 'S002', 50);
INSERT INTO tbl_salelist_01 VALUES(100014, 'AA05', TO_DATE('20200902', 'YYYYMMDD'), 'S004', 20);
INSERT INTO tbl_salelist_01 VALUES(100015, 'AA01', TO_DATE('20200902', 'YYYYMMDD'), 'S003', 20);

COMMIT;
