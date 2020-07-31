
-- �׽�Ʈ�� ���̺��� �����
CREATE TABLE tbl_emp(
eid INTEGER,
esal NUMBER(9));
-- �������� �����
CREATE SEQUENCE seq_eid;

-- �����͸� �Է��ϰ�
INSERT INTO tbl_emp VALUES(seq_eid.NEXTVAL, 300000);

-- ���������� �����
CREATE OR REPLACE PROCEDURE upSal
(veid tbl_emp.eid%TYPE)
IS
    BEGIN
        UPDATE tbl_emp SET esal=500000
        WHERE eid=veid;
    END;
/
-- ������ �������� Ȯ��
DESC USER_SOURCE;
SELECT text FROM USER_SOURCE WHERE name='UPSAL';

-- �ϴ� Ȯ��
SELECT * FROM tbl_emp;

-- ���������� �����ϰ�
EXEC upSal(1);

-- ��� Ȯ��
SELECT * FROM tbl_emp;

    
-- �׽�Ʈ�� ���� ���̺��� �����
CREATE TABLE tbl_order(
no INTEGER,
ordCode VARCHAR2(10),
ordDate DATE);

-- ���� trigger�� �����,
-- ���� Trigger�� ������ �޴� ���� ���� ������, trigger�� �ѹ��� �߻�
CREATE OR REPLACE TRIGGER tri_order
BEFORE INSERT ON tbl_order
BEGIN
    IF(TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '12:05' AND '12:20') THEN
        RAISE_APPLICATION_ERROR(-20100, '���ð��� �ƴմϴ�.');
    END IF;
END;
/

INSERT INTO tbl_order VALUES(4, 'C100', SYSDATE);

-- ��Ʈ������ �����
-- ��trigger�� ���̺��� trigger�̺�Ʈ�� ������ ������ ���� ����ǰ�,
-- trigger �̺�Ʈ�� ������ �޴� ���� ���� ��쿡�� ������� �ʴ´�.
CREATE OR REPLACE TRIGGER tri_order2
BEFORE INSERT ON tbl_order
FOR EACH ROW
BEGIN
    IF(:NEW.ordCode) NOT IN ('C100') THEN
        RAISE_APPLICATION_ERROR(-20200, '��ǰ�ڵ尡 Ʋ���ϴ�');
    END IF;
END;
/



INSERT INTO tbl_order VALUES(3, 'C300', SYSDATE);

CREATE OR REPLACE TRIGGER tri_order3
BEFORE INSERT ON tbl_order
    FOR EACH ROW
    WHEN (NEW.ordCode = 'C500')
BEGIN
    IF(TO_CHAR(SYSDATE, 'HH24:MI') NOT BETWEEN '19:30' AND '19:35') THEN
        RAISE_APPLICATION_ERROR(-20300, 'C500 ��ǰ�� �Է����ð��� �ƴմϴ�.!');
    END IF;
END;
/

INSERT INTO tbl_order VALUES(5, 'C500', SYSDATE);
