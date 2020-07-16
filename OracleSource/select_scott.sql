select * from emp;
select * from bonus;
select * from dept;
select * from salgrade;

-- 30�� �μ��� �ٹ��ϴ� ��� ����� �̸��� �޿�(emp)
select ename, sal from emp where deptno = 30;

-- ��� ��ȣ�� �̸�, ���� �޿��� 10% �λ�� �޿�(�÷��̸� �λ�� �޿�)�� ���
-- ��, �����ȣ������ ��������
select empno, ename, sal, sal*(1.1) as "�λ�� �޿�" from emp order by empno;

-- ��� ����� �ִ� �� �ּ� �޿�, �հ� �� ��� �޿��� ���
-- �� �̸� ���� MAX, MIN, SUM, AVG�� �Ѵ�.(�Ҽ��� ���ϴ� �ݿø��Ͽ� ������ ���)
 select MAX(sal) as MAX, MIN(sal) as MIN, sum(sal) as SUM, round(avg(sal), 0) as AVG    --'0' �Ҽ��� ���� ����
 from emp;

-- �����̸��� �������� ������ ������ �ϴ� ����� ���� ���
-- (���̸� '����', '������ �����')
select job as ����, count(*) as "������ �����" from emp group by job;

-- ��ձ޿��� ���� ���� �μ��� ��ȣ�� ���(�μ����� Ȱ��)
select dept.deptno, avg(sal)
from emp, dept
where emp.deptno = dept.deptno
group by dept.deptno
having avg(sal) >= all(select avg(sal) from emp group by deptno);

-- sql ������ ������ ����Ŭ������(-)
select dept.deptno
    from dept
    except
        select dept.deptno
        from dept, emp
        where dept.deptno = emp.deptno;

-- ���� ����(job)�� �ϴ� ����� ���� 4�� �̻��� ������ �ο��� ���
select job, count(*) from emp group by job having count(*) >= 4;

-- �����ȣ(empno)�� 7400 �̻� 7600 ������ ����� �̸�(ename)�� ���
select ename from emp where empno between 7400 and 7600;

-- ��� scott���� �޿�(sal)�� ���� �޴� ����� �̸�(ename)�� ���(�μ�����)
select ename from emp where sal > (select sal from emp where ename = 'SCOTT');



select * from emp;

-- SCOTT ������ ���̽� (��Į������)
-- ����� �̸��� �μ��� �̸��� ���
-- ����
select ename, dname
from emp, dept
where emp.deptno = dept.deptno;

select ename, (select dname from dept where emp.deptno = dept.deptno) "Dname"
from emp;

-- SCOTT �����ͺ��̽� (�ζ��� ��)
-- 'CHICAGO'�� �ٹ��ϴ� ����� �̸� ���
select * from emp;
select * from dept;
-- �������� 
select ename
from emp, dept
where emp.deptno = dept.deptno and loc = 'CHICAGO';
-- �ζ��κ�
select deptno from dept where loc like 'CHICAGO';

select ename
from emp e, (select deptno from dept where loc like 'CHICAGO') d
where e.deptno = d.deptno;
-- ��ø����(INȰ��)
select ename
from emp
where deptno IN(select deptno from dept where loc like 'CHICAGO');
-- ��ø����(EXISTS)
select ename
from emp
where EXISTS (select * from dept where emp.deptno = dept.deptno and loc like 'CHICAGO');

-- ��պ��� �޿��� ���� ������ �̸�
select ename
from emp
where sal > (select avg(sal) from emp);

-- �μ��� ��պ��� �޿��� ���� ������ �̸��� �޿�
select deptno, ename, sal, round((select avg(sal) from emp e2 where e1.deptno = e2.deptno),1) "�μ��� ���"
from emp e1
where sal > (select avg(sal) from emp e2 where e1.deptno = e2.deptno)
order by deptno;

select deptno, avg(sal) from emp group by deptno;