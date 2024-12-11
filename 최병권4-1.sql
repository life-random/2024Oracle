--3�� �̼�
--1-1 9���� �Ի��� ����� ����� ���ÿ�
--SUBSTR�Լ��� ����Ѵ�
select *
from emp
where substr(hiredate,4,2) = '09' ;

--1-2 2003�⵵�� �Ի��� ����� �˾Ƴ��� ���� �������� ������ ���� �ۼ��� �� �ֽ��ϴ�
--�̷��� ��� ���� ���� �� �н��� SUBSTR�Լ��� �̿��Ͽ�, 2004�⵵�� �Ի��� ����� 
--�˻��� ������ �ϼ���
select *
from emp
where substr(hiredate,1,2) = '03';


--1-3 ������ �̸��� "��"�� ������ ����� �˻��� ������ �սô�. �� ���� ���忡�� ����� 
--LIKE �����ڸ� �̿��Ͽ� ������ ���� ǥ���� �� �ֽ��ϴ�.
--�̷��� ��� ���� ���� �� �н��� SUBSTR �Լ��� �̿��Ͽ�, ename Į���� ������ ���� �� ����
--�����ؼ� �̸��� E�� ������ ����� �˻��� ������ �ϼ���.
--���� ��ġ�� -1�� �ְ�, ������ ���� ������ 1�� �ָ� �˴ϴ�.
select *
from emp
where substr(ename, -1, 1) = '��';

--1-4 �̹����� �̸��� �� ��° ���ڿ� "��"�� �ִ� ����� �˻��� ���ô�.
--INSTR�Լ� ���
select *
from emp
where instr(ename, '��', 1 ,1) = 2;  -- instr ��ġ�� ��ȯ

--2-1 ���޿� ���� �޿� �λ�, ���� 5%, ���� 10%, �븮 15%, ��� 20%
select empno, ename, job, sal, decode(job, '����', sal *1.05,
                                                    '����', sal *1.10,
                                                    '�븮', sal *1.15,
                                                    '���', sal *1.20,
                                                    'sal')
from emp;

select empno, ename, job, sal, case when job = '����' then sal *1.05 
                                    when job = '����' then sal *1.10
                                    when job = '�븮' then sal *1.15
                                    when job = '���' then sal *1.20
                                    else sal
                                end upsal
from emp;

--3-1 �Ի��� ������ 2�ڸ�, ���� ����(MON)ǥ��, ���� ���(DY)�� ���� ���
select hiredate, to_char(hiredate, 'YY/MON/DY')
from emp;