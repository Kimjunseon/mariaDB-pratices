-- 함수: 수학

-- abs 절대값
select abs(1), abs(-1);

-- ceil 천장 수
select ceil(3.15), ceiling(3.15);

-- mod 나머지
select mod(10, 3);

-- floor 바닥 수
select floor(3.12);

-- round(x): x에 근접한 정수
-- round(x, d): x값 중에 소수점 d자리에 가장 근전합 실수
select round(1.498);
select round(1.498, 1);
select round(1.498, 0);

-- power(x, y), pow(x, y): x의 y 제곱 수
select pow(2, 3), powwr(2, 3);

-- sign(x) 양수는 1, 음수는 -1, 0은 0 출력
select sign(-1), sign(1), sign(0);

-- greatest(x, y, ...), least(x, y, ...) 최대 최소
select greatest(10, 40, 20, 50), least(10, 40, 20, 50);
select greatest("a", "A", "b", "c", "B", "C"), least("hello", "hela", "hell");











