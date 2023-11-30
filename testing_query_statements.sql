
#New values are inserted into the table APP_USER

INSERT INTO CONTACT_TRACER.APP_USER VALUES (1001,"PLM25PVF5BP","Lucius","Parrish","(807) 858-3218")

#Checking For data type error and wrong column count error while inserting new data to the APP_USER table.
#Trying to insert string data type value to the INTEGER type. It gives error as “Value has type string which can not be inserted into column APP_USER_ID, which has type INT64”

INSERT INTO CONTACT_TRACER.APP_USER VALUES ("1002","PLM25PVF5BP","Lucius","Parrish","(807) 858-3218")

# Trying to insert values into the table APP_USER with skipping one column. It gives error as “Inserted row has wrong column count; has 4, expected 5”. 


INSERT INTO CONTACT_TRACER.APP_USER VALUES ("PLM25PVF5BP","Lucius","Parrish","(807) 858-3218")
#New values are inserted into the table TEST

INSERT INTO CONTACT_TRACER.TEST (TEST_ID,TEST_DATE,TEST_TYPE,USER_ID, LAB_ID, RESULT) VALUES(201,"2019-09-27", "RT-PCR", 46,17,False)

#Checking For data type error and wrong column count error while inserting.
#Trying to insert string data type value to the boolean type. It gives error as “Value has type string which can not be inserted into column RESULT, which has type BOOL”

INSERT INTO CONTACT_TRACER.TEST (TEST_ID,TEST_DATE,TEST_TYPE,USER_ID, LAB_ID, RESULT) VALUES(202,"2019-09-27", "RT-PCR", 46,17,"False")

#Trying to insert values into the table TEST with skipping one column. It gives error as “Inserted row has wrong column count; Has 5, expected 6”. 
INSERT INTO CONTACT_TRACER.TEST (TEST_ID,TEST_DATE,TEST_TYPE,USER_ID, LAB_ID, RESULT) VALUES(202,"2019-09-27", "RT-PCR",17,False)

#Trying to insert the wrong date type value into the column, it gives an error as “could not cast literal “2019/09/27” to type DATE”.
INSERT INTO CONTACT_TRACER.TEST (TEST_ID,TEST_DATE,TEST_TYPE,USER_ID, LAB_ID, RESULT) VALUES(202,"2019/09/27", "RT-PCR", 46,17,False)

#RETRIEVE OPERATION (i.e select)
#Trying to retrieve information about user who are infected by using select statement

SELECT USER_ID, GENDER, DOB,INFECTION_STATUS
FROM CONTACT_TRACER.USER
WHERE INFECTION_STATUS = "infected"

#Trying to retrieve APP_USER information, who are at high risk:

SELECT CONCAT(A.FIRST_NAME, ",", A.LAST_NAME), N.APP_USER_ID,  N.INFECTION_RISK, A.PHONE
FROM CONTACT_TRACER.NOTIFICATION N JOIN CONTACT_TRACER.APP_USER A
ON N.APP_USER_ID = A.APP_USER_ID
WHERE N.INFECTION_RISK = "High"

#UPDATE OPERATION (edit , modify)
#The LAB_NAME in the LAB table is updated as NEW_COVID_LAB with the WHERE condition  ZIPCODE  is K5M 0J4.

UPDATE CONTACT_TRACER.LAB
SET LAB_NAME = "NEW_COVID_LAB"
WHERE ZIPCODE = "K5M 0J4"

#DELETE OPERATION 
#Trying to delete one row from the ADDRESS table, where zipcode is 29778.

DELETE CONTACT_TRACER.ADDRESS
WHERE ZIPCODE = "29778"

#Buisness rules checks

# Checking for one user can take many tests
SELECT * FROM CONTACT_TRACER.TEST WHERE USER_ID = 72


# Checking for one zipcode/ address is assigned to many users

SELECT ZIPCODE , USER_ID FROM (
  SELECT *, COUNT(1) OVER(PARTITION BY ZIPCODE) dup_count
  FROM CONTACT_TRACER.USER
)
WHERE dup_count > 1 


#  # Checking for one user can have many tracker  

SELECT USER_ID , TRACKER_ID ,  FROM (
  SELECT *, COUNT(1) OVER(PARTITION BY USER_ID) dup_count
  FROM CONTACT_TRACER.TRACKER
)
WHERE dup_count > 1 