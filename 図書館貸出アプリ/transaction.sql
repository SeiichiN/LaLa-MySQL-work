-- �g�����U�N�V��������

-- ���ۂ̑ݏo�Ɩ�

BEGIN;  -- �g�����U�N�V���������̊J�n

-- ���������� (auto_increment)
INSERT INTO loans
  (member_id, loan_at, return_at)
VALUES
  ('123458', '2025-10-02', '2025-10-16');


-- �ŐV��auto_increment�̒l���擾
SET @last_id := last_insert_id();

-- �s���ȑ}��
INSERT INTO loan_book VALUES
( @last_id, 'bk009');

ROLLBACK;  -- �����߂�

-- �����������̏ꍇ
COMMIT;    -- �m��
