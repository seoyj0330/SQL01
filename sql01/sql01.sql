-- 문제 1번
--  입사일 올림차순으로 가장 선임부터 출력 
--  이름, 월급, 전화번호, 입사일 순서 
--  "이름", "월급", "전화번호", "입사일" 컬럼대체
select first_name ||' '|| last_name as "이름",
       salary as "월급", 
       phone_number as "전화번호",
       hire_date as "입사일"
from employees
order by hire_date asc;


--문제 2번
--  업무별로 업무이름, 최고월급을 월급의 내림차순으로 정렬
select job_title, max_salary
from jobs
order by max_salary desc;


--문제 3번
--  담당매니저가 배정, 커미션비율 X, 월급 3000초과
--  해당하는 직원의 이름, 매니저아이디, 커미션 비율, 월급을 출력
select  first_name,
        manager_id,
        commission_pct,
        salary 
from employees
where manager_id is not null
    and commission_pct is null
    and salary > 3000;
    

--문제 4번
-- 최고월급 10000이상인 업무의 이름, 최고월급을 
-- 최고월급의 내림차순으로 정렬 
select job_title, max_salary
from jobs
where max_salary >= 10000
order by max_salary desc;
    

--문제 5번
-- 월급이 14000미만 10000이상
-- 직원의 이름, 월급, 커미션퍼센트를    월급순으로 내림차순 출력
-- 단, 커미션 퍼센트가 null 이면 0으로 나타내기
select first_name,
       salary,
       NVL(commission_pct,0)
from employees
where salary >= 10000
    and salary < 14000
order by salary desc;   


--문제 6번
--  부서번호가 10,90,100인 직원의 이름,월급, 입사일, 부서번호
-- 입사일은 1997-12 와 같이표기
select  first_name,
        salary,
        to_char(hire_date,'YYYY-MM'),
        department_id
from employees
where department_id in (10, 90, 100);


--문제 7번
--  이름에 S 또는 s가 들어가는 직원의 이름 , 월급
select  first_name,
        salary
from employees
where first_name like '%s%'
    or first_name like '%S%';


--문제 8번
--  전체 부서 출력. 순서는 부서이름이 긴 순서대로 출력
select *
from departments
order by length(department_name) desc;


--문제 9번
--  지사가 있을 것으로 예상되는 나라들의 이름을 대문자로 출력 & 올림차순(asc)로 정렬
select upper(country_name)
from countries
order by country_name asc;


--문제 10번
--  입사일이 03/12/31일 이전 입사한 직원의 이름, 월급, 전화번호, 입사일 출력
--  전화번호는 543-343-3433 의 형태로 출력
select  first_name,
        salary,
        replace (phone_number,'.','-'),
        hire_date
from employees 
where hire_date < '03/12/31';