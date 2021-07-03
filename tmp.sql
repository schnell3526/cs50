SELECT
    *
FROM
    courthouse_security_logs
WHERE
    year = 2020
    AND MONTH = 7
    AND DAY = 28
    AND HOUR = 10
    AND activity = 'exit'
    AND 15 <= MINUTE
    AND MINUTE <= 25;

-- 295|2020|7|28|Chamberlin Street|Theft of the CS50 duck took place at 10:15am at the Chamberlin Street courthouse. Interviews were conducted today with three witnesses who were present at the time — each of their interview transcripts mentions the courthouse.
-- 295|2020|7|28｜チャンバーリン・ストリート｜CS50ダックの盗難は10時15分にチャンバーリン・ストリートの裁判所で行われました。本日、その場にいた3人の目撃者へのインタビューが行われました。それぞれのインタビュー記録が裁判所に記載されています。
-- 161|ルース|2020|7|28｜盗難から10分以内に、裁判所の駐車場で泥棒が車に乗り込み、走り去るのを見ました。もし裁判所の駐車場の監視カメラの映像があれば、その時間帯に駐車場を出た車を探してみてはいかがでしょうか。
SELECT
    *
FROM
    courthouse_security_logs
WHERE
    year = 2020
    AND MONTH = 7
    AND DAY = 28
    AND HOUR = 10
    AND activity = 'exit'
    AND 15 <= MINUTE
    AND MINUTE <= 25;

-- 260|2020|7|28|10|16|exit|5P2BI95
-- 261|2020|7|28|10|18|exit|94KL13X
-- 262|2020|7|28|10|18|exit|6P58WS2
-- 263|2020|7|28|10|19|exit|4328GD8
-- 264|2020|7|28|10|20|exit|G412CB7
-- 265|2020|7|28|10|21|exit|L93JTIZ
-- 266|2020|7|28|10|23|exit|322W7JE
-- 267|2020|7|28|10|23|exit|0NTHK55
SELECT
    *
FROM
    people
WHERE
    license_plate IN (
        SELECT
            license_plate
        FROM
            courthouse_security_logs
        WHERE
            year = 2020
            AND MONTH = 7
            AND DAY = 28
            AND HOUR = 10
            AND activity = 'exit'
            AND 15 <= MINUTE
            AND MINUTE <= 25
    );

-- 221103|Patrick|(725) 555-4692|2963008352|5P2BI95
-- 243696|Amber|(301) 555-4174|7526138472|6P58WS2
-- 396669|Elizabeth|(829) 555-5269|7049073643|L93JTIZ
-- 398010|Roger|(130) 555-0289|1695452385|G412CB7
-- 467400|Danielle|(389) 555-5198|8496433585|4328GD8
-- 514354|Russell|(770) 555-1861|3592750733|322W7JE
-- 560886|Evelyn|(499) 555-9472|8294398571|0NTHK55
-- 686048|Ernest|(367) 555-5533|5773159633|94KL13X
-- 162|Eugene|2020|7|28|泥棒の名前はわかりませんが、見覚えのある人でした。今朝早く、裁判所に到着する前に、フィファー通りのATMの前を歩いていたら、そこで泥棒がお金を引き出しているのを見ました。
SELECT
    *
FROM
    atm_transactions
WHERE
    year = 2020
    AND MONTH = 7
    AND DAY = 28
    AND atm_location = 'Fifer Street'
    AND transaction_type = 'withdraw';

-- 246|28500762|2020|7|28|Fifer Street|withdraw|48
-- 264|28296815|2020|7|28|Fifer Street|withdraw|20
-- 266|76054385|2020|7|28|Fifer Street|withdraw|60
-- 267|49610011|2020|7|28|Fifer Street|withdraw|50
-- 269|16153065|2020|7|28|Fifer Street|withdraw|80
-- 288|25506511|2020|7|28|Fifer Street|withdraw|20
-- 313|81061156|2020|7|28|Fifer Street|withdraw|30
-- 336|26013199|2020|7|28|Fifer Street|withdraw|35
SELECT
    *
FROM
    bank_accounts
    JOIN people ON bank_accounts.person_id = people.id
WHERE
    account_number IN (
        SELECT
            account_number
        FROM
            atm_transactions
        WHERE
            year = 2020
            AND MONTH = 7
            AND DAY = 28
            AND atm_location = 'Fifer Street'
            AND transaction_type = 'withdraw'
    );

-- 49610011|686048|2010|686048|Ernest|(367) 555-5533|5773159633|94KL13X
-- 26013199|514354|2012|514354|Russell|(770) 555-1861|3592750733|322W7JE
-- 16153065|458378|2012|458378|Roy|(122) 555-4581|4408372428|QX4YZN3
-- 28296815|395717|2014|395717|Bobby|(826) 555-1652|9878712108|30G67EN
-- 25506511|396669|2014|396669|Elizabeth|(829) 555-5269|7049073643|L93JTIZ
-- 28500762|467400|2014|467400|Danielle|(389) 555-5198|8496433585|4328GD8
-- 76054385|449774|2015|449774|Madison|(286) 555-6063|1988161715|1106N58
-- 81061156|438727|2018|438727|Victoria|(338) 555-6650|9586786673|8X428L0
-- 163|Raymond|2020|7|28| 泥棒が裁判所を出ようとしたとき、誰かに電話をして1分弱話していました。その電話の中で、泥棒は明日(7/29)フィフティビルを出る一番早い便に乗るつもりだと言っているのを聞きました。そして、泥棒は電話の相手に航空券の購入を依頼した。
SELECT
    *
FROM
    flights
    JOIN airports ON airports.id = flights.origin_airport_id
WHERE
    year = 2020
    AND MONTH = 7
    AND DAY = 29
    -- AND city = 'Fiftyville'
ORDER BY
    HOUR,
    MINUTE;

-- 36|8|20|Fiftyville
-- 43|9|30|Fiftyville
-- 23|12|15|Fiftyville
-- 53|15|20|Fiftyville
-- 18|16|0|Fiftyville
SELECT
    *
FROM
    passengers
WHERE
    flight_id = 36;

-- 36|7214083635|2A
-- 36|1695452385|3B
-- 36|5773159633|4A
-- 36|1540955065|5C
-- 36|8294398571|6C
-- 36|1988161715|6D
-- 36|9878712108|7A
-- 36|8496433585|7B
SELECT
    *
FROM
    people
WHERE
    passport_number IN (
        SELECT
            passport_number
        FROM
            passengers
        WHERE
            flight_id = 36
    );

-- 395717|Bobby|(826) 555-1652|9878712108|30G67EN
-- 398010|Roger|(130) 555-0289|1695452385|G412CB7
-- 449774|Madison|(286) 555-6063|1988161715|1106N58
-- 467400|Danielle|(389) 555-5198|8496433585|4328GD8
-- 560886|Evelyn|(499) 555-9472|8294398571|0NTHK55
-- 651714|Edward|(328) 555-1152|1540955065|130LD9Z
-- 686048|Ernest|(367) 555-5533|5773159633|94KL13X
-- 953679|Doris|(066) 555-9701|7214083635|M51FA04
-- 電話を2020/7/29にかけた人の電番番号(60秒以内)
SELECT
    caller
FROM
    phone_calls
WHERE
    year = 2020
    AND MONTH = 7
    AND DAY = 28
    AND duration < 60;

-- 名前
SELECT
    *
FROM
    people
WHERE
    phone_number IN (
        SELECT
            caller
        FROM
            phone_calls
        WHERE
            year = 2020
            AND MONTH = 7
            AND DAY = 28
            AND duration < 60
    );

-- 395717|Bobby|(826) 555-1652|9878712108|30G67EN
-- 398010|Roger|(130) 555-0289|1695452385|G412CB7
-- 438727|Victoria|(338) 555-6650|9586786673|8X428L0
-- 449774|Madison|(286) 555-6063|1988161715|1106N58
-- 514354|Russell|(770) 555-1861|3592750733|322W7JE
-- 560886|Evelyn|(499) 555-9472|8294398571|0NTHK55
-- 686048|Ernest|(367) 555-5533|5773159633|94KL13X
-- 907148|Kimberly|(031) 555-6622|9628244268|Q12B3Z3
SELECT
    name
FROM
    people
WHERE
    license_plate IN (
        SELECT
            license_plate
        FROM
            courthouse_security_logs
        WHERE
            year = 2020
            AND MONTH = 7
            AND DAY = 28
            AND HOUR = 10
            AND activity = 'exit'
            AND 15 <= MINUTE
            AND MINUTE <= 25
    )
INTERSECT
SELECT
    name
FROM
    bank_accounts
    JOIN people ON bank_accounts.person_id = people.id
WHERE
    account_number IN (
        SELECT
            account_number
        FROM
            atm_transactions
        WHERE
            year = 2020
            AND MONTH = 7
            AND DAY = 28
            AND atm_location = 'Fifer Street'
            AND transaction_type = 'withdraw'
    )
INTERSECT
SELECT
    name
FROM
    people
WHERE
    passport_number IN (
        SELECT
            passport_number
        FROM
            passengers
        WHERE
            flight_id = 36
    )
INTERSECT
SELECT
    name
FROM
    people
WHERE
    phone_number IN (
        SELECT
            caller
        FROM
            phone_calls
        WHERE
            year = 2020
            AND MONTH = 7
            AND DAY = 28
            AND duration < 60
    );

-- Ernest
-- 犯人の電話番号
SELECT
    receiver
FROM
    phone_calls
WHERE
    year = 2020
    AND MONTH = 7
    AND DAY = 28
    AND duration < 60
    AND caller = '(367) 555-5533';

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
            AND duration < 60
            AND caller = '(367) 555-5533'
    );

-- 864400|Berthold|(375) 555-8161||4V16VO0
SELECT
    city
FROM
    flights
    JOIN airports ON airports.id = flights.destination_airport_id
WHERE
    flights.id = 36;

-- London
Ernest Berthold London
