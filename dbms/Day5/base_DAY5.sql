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