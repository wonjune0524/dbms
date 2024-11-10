-- select * from students; -- 주석 : 메모장 개발자들이 어떤 코드를 작성했는지 설명해주기 위해 주석을 사용
# 한줄 주석

/*  여러줄 주석
			*/
select * from actor;

-- 미리 기능을 만들어 놓은 것을 불러쓰는 것(함수)alter
-- DBMS에서 제공하는 함수가 존재함
-- 문자열 함수 / 수학 함수 / 날짜 함수alter

-- 수학 함수
select abs(-8);   -- 결과 : 8

select * from payment;
-- select abs(칼럼명) from 테이블이름;
select abs(amount) from payment;

select ceiling(18.20);
select ceiling(amount) from payment;

select floor(15.31);
select floor(amount) from payment;

-- 소수 첫번째 자리에서 반올림
select round(13.456, 1);
select round(amount, 1) from payment;

-- 소수점 첫째 자리에서 절삭
select truncate(13.456, 1);
select truncate(amount, 1) from payment;

select pow(2, 4);   -- 결과 2*2*2*2 = 16

select mod(5, 3);   -- 5를 3으로 나눴을 때 나머지가 2이다. 결과값은 2이다.

select greatest(1, 2, 3);   -- 주어진 값 중 가장 큰 값 찾기
select least(1, 2, 3);   -- 가장 작은 값 찾기

select concat('hello', ' ', 'World');

select * from actor;
-- 테이블의 두 열(칼럼)을 연결
select concat(first_name, '  ///  ', last_name) from actor;
select concat(actor_id, '  ///  ', last_update) from actor;

-- 문자열 중간에 다른 문자열 삽입
-- 7번째 문자부터 5개를 지우고 'MySQL'을 대신 넣는다.
select insert('Hello World!', 7, 5, 'MySQL');

select insert('java world', 1, 4, 'SQL');

-- select insert(칼럼명, 1, 2, '문자') from table_name;

select replace('hello world', 'world', 'MySQL');   -- hello MySQL

-- select replace(칼럼명, '원본데이터', '바꾸고자 하는 데이터') from 테이블 이름
-- ' ' : 문자로 취급이 되서 칼럼명으로 인식을 못함
select replace(first_name, 'NICK', 'JOHN') from actor;

-- hello world라는 문자열에서 world의 시작 위치값을 나타낸다.
select instr('hello world', 'world');

-- 테이블의 특정 열에서 ''이 시작되는 위치
-- select instr(칼럼명, '') from 테이블 이름

-- 문자열의 왼쪽부터 3번째 문자까지 반환
select Left('hello', 3);

select * from actor;
select Left(first_name, 3) from actor;

-- 특정 열(last_name)에서 왼쪽 4문자 반환
select Left(last_name, 4) from actor;

select Right(first_name, 3) from actor;

-- 문자열의 중간 부분만 반환
select mid('hello world', 4, 4);

-- select mid(칼럼명, n, n) from 테이블이름
select mid(first_name, 3, 5) from actor;

-- 공벡 제거하는 함수
select ltrim('  hello world  a');
select rtrim('       hello world      ');
-- select ltrim, rtrim(칼럼명) from 테이블이름

-- 양쪽 공백 제거 함수
select trim('      hello world          ');

-- 문자열을 소문자로 변환
select lower('HELLO WORLD');

select * from actor;
-- select lower(칼럼명) from 테이블이름

-- 문자열을 대문자로 변환(UPPER)
select upper('hello world');   -- HELLO WORLD;
-- select upper(칼럼명) from 테이블 이름

select reverse('hello world');   -- 결과 값이 바뀐다.
select reverse(first_name) from actor;

-- 날짜 관련 함수
select now();

select curtime();
select curdate();
select year('2024-01-01');
-- select year(칼럼명) from 테이블이름

select * from actor;
select year(last_update) from actor;
-- month
select month(last_update) from actor;
-- day
select day(last_update) from actor;

select * from customer;

select store_id, count(*)
from customer
group by store_id;

select active, count(*)   -- 주어진 칼럼의 값들의 개수를 반환한다.
from customer
group by active;


-- as를 붙여서 결과 출력에서 열의 이름으로 사용함
-- as = Alias의 줄임말. 한글 뜻 : '별명'
-- as로 열의 이름을 지정해주었기에 다른 사람이 읽었을 때, 어떤 의미를 가지는지 더 쉽게 알 수 있다.
select store_id, count(*) as store_id_count
from customer
group by store_id;

select * from staff;

-- update문을 이용하여
-- 2번인 학생의 비밀번호 넣어주기
-- 'abcdefg'

update staff set password = 'abcdefg' where staff_id = 2;

insert into staff(staff_id, first_name, last_name, address_id, picture, email, store_id,
active, username, password, last_update)
values
(3, 'Alice', 'Johnson', 8, NULL, 'Alice@korea.com', 1, 1, 'AliceJ', NULL, '2024-08-25 12:00:00'),
(4, 'Bob', 'Johnson', 9, NULL, 'Bob@korea.com', 2, 1, 'AliceJ', NULL, '2021-08-07 12:00:00'),
(5, 'Carol', 'Johnson', 10, NULL, 'Carol@korea.com', 1, 1, 'CarolW', 'abcd', '2007-06-18 12:00:00');

delete from staff where staff_id in (3);
delete from staff where staff_id in (4);
delete from staff where staff_id in (5);

-- count(칼럼명) : 함수 사용
-- null값은 제외하고 count 해준다.
select last_name, count(password) as password_count
from staff
group by last_name;

-- store_id 칼럼에서 최솟값을 찾기 : min()
select min(store_id) as min_store_id
from staff;

-- last_update 칼럼에서 가장 이른 날짜를 찾기 as earliest_update
-- select min(칼럼명) as 별명 from 테이블 이름;
select min(last_update) as earliest_update
from staff;

-- last_name이 'johnson'인 모든 직원들을 하나의 그룹으로 묶고, 그 그룹 내에서 가장 이른 last_update 값을 반환한다.


select last_name, min(last_update) as earliest_update
from staff
where last_name = 'johnson'
group by last_name;

-- select 뒤에 last_name의 존재 유무
-- 없어도 상관은 없으나 결과의 명확성이 떨어질 수 있다.

-- MAX() 함수

-- 1. last_update의 최댓값 찾기
select max(last_update) as latest_update
from staff;

-- 특정(last_name)에 대해 last_update의 최댓값 찾기 as latest_update
select last_name, max(last_update) as latest_update
from staff
group by last_name;


-- store_id별로 last_update의 최댓값 찾기
select store_id, max(last_update) as latest_update
from staff
group by store_id;

-- "store_id가 2인 경우의 최신 last_update 값을 구하시오."

select store_id, max(last_update) as latest_update
from staff
where store_id = 2
group by store_id;

-- 테이블에 직원 월급을 넣을 수 있는 칼럼을 만들기 데이터 타입은 integer
-- 칼럼 이름 : salary
alter table staff add column salary integer;

select * from staff;



