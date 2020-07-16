select * from emp; -- deptno
select * from dept; -- deptno

-- 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿�(emp)
select ename,sal from emp where dept=30;
-- ��� ��ȣ�� �̸�, ���� �޿��� 10% �λ�� �޿�(�÷��̸� �λ�� �޿�)�� ���
-- �� ��� ��ȣ������ ��������
select empno, ename, sal, sal*1.1 as "�λ�� �޿�"
from emp
order by empno;
-- ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ���
-- ���̸��� ���� MAX,MIN,SUM,AVG�� �Ѵ�(�Ҽ��� ���ϴ� �ݿø��Ͽ� ������ ���)
select MAX(sal) as MAX, MIN(sal) as MIN, sum(sal) as SUM,
round(avg(sal),0) as AVG
from emp;

-- �����̸��� �������� ������ ������ �ϴ� ����� ���� ��� 
-- (���̸� '����','������ �����')
select job as ����, count(ename) as "������ �����"
from emp
group by job;

-- ��ձ޿��� ���� ���� �μ��� ��ȣ�� ���(�μ����� Ȱ��)
select dept.detpno, avg(sal)
from emp,dept
where emp.deptno=dept.deptno
group by dept.deptno 
having avg(sal) >= all (SELECT (avg(sal)) from emp group by deptno);
-- sql ���� ������
SELECT Dept.deptno
	FROM Dept
	EXCEPT 
		SELECT Dept. deptno
		FROM Dept, Emp
		WHERE Dept.deptno=Emp.deptno;
        
-- ���� ����(job)�� �ϴ� ����� ���� 4�� �̻��� ����(job)�� �ο��� ���
select job, count(ename) as �����
from emp
group by job
having �����>=4;
-- �����ȣ(empno)�� 7400�̻� 7600������ ����� �̸�(ename)�� ���
select ename
from emp
where empno between 7400 and 7600;
-- ��� scott���� �޿�(sal)�� ���� �޴� ����� �̸�(ename)�� ���(�μ�����)
select ename from emp where sal > 
        (select sal from emp where ename like 'SCOTT');







