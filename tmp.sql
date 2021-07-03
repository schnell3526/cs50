SELECT
    *
FROM
    people
WHERE
    phone_number = (
        SELECT
            receiver
        FROM
            phone_calls
        WHERE
            year = 2020
            AND MONTH = 7
            AND DAY = 28
            AND caller = '(367) 555-5533'
    );