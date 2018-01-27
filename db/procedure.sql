CREATE PROCEDURE
  get_number_students
  (IN sch CHAR(50))
  SELECT
    COUNT(users.id)
  FROM
    users,
    schools
  WHERE
    schools.id = users.school_id
    AND schools.name = sch;