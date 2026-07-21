-- String functions

-- 1.
-- concat(a,b,c...): joins string as is...returns NULL if any argument is NULL.
-- concat_ws(sep,a,b,c...): joins strings with a separator and SKIPS NULL.
   -- if NULL is the separator then output is NULL.

select concat('Dhyey'," ",'Savaliya') as full_name;
select concat('Dhyey',NULL,'Savaliya') as null_name;


select concat_ws("-",'Dhyey', NULL, 'Savaliya') as sep_name;
select concat_ws(NULL, 'Dhyey',' ','Savaliya') as new_name;

select concat_ws('Hello',NULL,'Dhyey') as new_Exp; -- everything after NULL is considered


-- 2. Lower AND Upper
-- lower: converts text to Lower case
-- upper: converts text to Upper case
select lower('Dhyey') as lower_case;
select upper('Dhyey') as upper_case;


-- 3. TRIM/LTRIM/RTRIM
-- TRIM: remove spaces from both sides
-- LTRIM: Remove spaces from left side
-- RTRIM: Remove spaces from rigth side

select trim('  dhyey  ');
select ltrim('  dhyey  ');
select rtrim('  dhyey  ');


-- 4. length/char_length
-- length: number of bytes
-- char_length: number of characters

select length('dhyey'); -- 5
select char_length('dhyey'); -- 5

select length('✅'); -- 3
select char_length('✅'); -- 1

select length('DHYEY'); -- 5
select char_length('DHYEY'); -- 5


SELECT LENGTH('é');
SELECT CHAR_LENGTH('é');

-- 5. LEFT() / RIGHT() / SUBSTRING()
-- LEFT(str, n) = first n characters
-- RIGHT(str, n) = last n characters
-- SUBSTRING(str, start, len) = slice string

-- NOTE: MySQL uses 1-based indexing
select left('dhyey savaliya', 7);
select right('dhyey savaliya',10);

select substring('dhyey savaliya', 3, 2);
select substring('dhyey savaliya',3);

-- 6) LOCATE() / INSTR()
-- LOCATE(substr, str): returns starting index of substr
-- INSTR(str, substr)

select locate('gmail','dhyey@gmail.com');
select instr('dhyeysavalia@gmail.com','savalia');

-- 7) REPLACE()
-- Replaces all occurrences of a substring.
-- replace(str, substr to replace, replacement)
select replace('mississippi','s','-');
select replace('bitch','it','**') as explicit_content;


-- 8) LIKE Pattern Matching
-- Wildcards

-- % = any length
-- _ = exactly one character

select 'plus_user' like 'plus%'; -- True
SELECT 'plus1user' LIKE 'plus_us_r'; -- True
SELECT 'plus1user' LIKE 'plus\_user'; -- False