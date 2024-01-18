# NOTE :- In this context, it's important to note that the table names used in the examples include underscores and numbers, 
# which differ from the naming conventions used in the LeetCode problem.

Create table If Not Exists Users_32 (
user_id int, 
name varchar(30), 
mail varchar(50)
);

Truncate table Users_32;

insert into Users_32 (user_id, name, mail) values ('1', 'Winston', 'winston@leetcode.com');
insert into Users_32 (user_id, name, mail) values ('2', 'Jonathan', 'jonathanisgreat');
insert into Users_32 (user_id, name, mail) values ('3', 'Annabelle', 'bella-@leetcode.com');
insert into Users_32 (user_id, name, mail) values ('4', 'Sally', 'sally.come@leetcode.com');
insert into Users_32 (user_id, name, mail) values ('5', 'Marwan', 'quarz#2020@leetcode.com');
insert into Users_32 (user_id, name, mail) values ('6', 'David', 'david69@gmail.com');
insert into Users_32 (user_id, name, mail) values ('7', 'Shapiro', '.shapo@leetcode.com');

/*
Write a solution to find the users who have valid emails.

A valid e-mail has a prefix name and a domain where:

Q. The prefix name is a string that may contain letters (upper or lower case), digits, underscore '_', period '.', and/or dash '-'. The prefix name must start with a letter.
The domain is '@leetcode.com'.
Return the result table in any order.
The result format is in the following example.

Input: 
Users table:
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 2       | Jonathan  | jonathanisgreat         |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
| 5       | Marwan    | quarz#2020@leetcode.com |
| 6       | David     | david69@gmail.com       |
| 7       | Shapiro   | .shapo@leetcode.com     |
+---------+-----------+-------------------------+
Output: 
+---------+-----------+-------------------------+
| user_id | name      | mail                    |
+---------+-----------+-------------------------+
| 1       | Winston   | winston@leetcode.com    |
| 3       | Annabelle | bella-@leetcode.com     |
| 4       | Sally     | sally.come@leetcode.com |
+---------+-----------+-------------------------+
Explanation: 
The mail of user 2 does not have a domain.
The mail of user 5 has the # sign which is not allowed.
The mail of user 6 does not have the leetcode domain.
The mail of user 7 starts with a period.
*/

SELECT * FROM Users_32;

SELECT * 
FROM Users_32
WHERE mail REGEXP "^[a-zA-Z][a-zA-Z0-9\_\.\-]*@leetcode.com$";

SELECT * 
FROM Users_32
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode.com$';

SELECT * 
FROM Users_32
WHERE regexp_like(mail, '^[A-Za-z]+[A-Za-z0-9\_\.\-]*@leetcode.com');

# To print only".shapo@leetcode.com" -> REGEXP "^\\..*@leetcode.com$";
/*
-> ^: Asserts the start of the string.
-> [a-zA-Z]: Matches any single uppercase or lowercase letter.
-> [a-zA-Z0-9\_\.\-]*: Matches zero or more occurrences of uppercase or lowercase letters, digits, underscores, periods, or hyphens.
-> since dot has a special meaning in regular expressions, it needs to be escaped with a backslash
-> *: Matches any character (except for a newline) zero or more times.
-> @leetcode.com: Matches the literal string "@leetcode.com" at the end of the value.
-> $: Asserts the end of the string.
*/
