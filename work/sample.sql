
-- 
-- sample�f�[�^�x�[�X
-- 
CREATE DATABASE sample;

-- 
-- sample���[�U�[�̍쐬
-- 
CREATE USER 'sampleuser'@'localhost'
IDENTIFIED BY 'sampleuser';

GRANT ALL ON sample.* TO 'sampleuser'@'localhost';
