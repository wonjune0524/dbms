-- film_id와 category_id 그리고 actor_id를 연결하여 조회하는 예제

select * from film_actor;   -- actor_id 존재 O
select * from film_category;   -- category_id 존재 O

-- join을 이용하여 연결
select fc.film_id, fc.category_id, fa.actor_id
from film_category fc
inner join film_actor fa
on fc.film_id = fa.film_id;

-- actor_id = 1 출연한 영화의 카테고리 조회하기
select fa.actor_id, fa.film_id, fc.category_id
from film_actor fa
inner join film_category fc
on fa.film_id = fc.film_id
where fa.actor_id = 1;

-- 결과
-- 예제 1번째 2번째의 공통점과 차이점
-- 공통점 : 두 테이블의 데이터를 결합하고 있다.
-- 차이점 : 첫 번째 예제는 특정 영화와 그 영화에 속한 카테고리 및 배우 정보를 모두
-- 보여주고 있는 반면, 두 번째 예제는 특정 배우가 출연한 영화의 카테고리 정보에 초점을
-- 맞추고 있다. (왜? where 절을 사용해서 조건을 걸었기 때문에)


-- 영화 ID별로 출연 배우 수 조회
-- film_id별로 해당 영화에 출연한 배우의 수(actor_count)를 조회하는 예제이다.
-- film_id를 기준으로 두 테이블을 결합하고, group by를 사용하여
-- 영화별로 출연한 배우의 수를 계산하시오.
select fc.film_id, count(fa.actor_id) as actor_count
from film_category fc
inner join film_actor fa
on fc.film_id = fa.film_id
group by fc.film_id;

-- inner join할 때는 결합하고자 하는 테이블의 순서는 상관이 없다.
-- film_id를 기준으로 두 테이블을 결합한 후, category_id가 6인 영화들만 조회하시오.
select fa.actor_id, fc.film_id, fc.category_id
from film_actor fa
inner join film_category fc
on fa.film_id = fc.film_id
where category_id = 6;

-- 모든 영화와 관련된 배우 정보 조회
select fc.film_id, fc.category_id, fa.actor_id
from film_category fc
left outer join film_actor fa
on fc.film_id = fa.film_id;

