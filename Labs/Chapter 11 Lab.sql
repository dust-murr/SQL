/*Problem 1*/
USE ap;

CREATE INDEX vendors_vendor_zip_code_ix
	ON vendors(vendor_zip_code);


/*Problem 2*/
USE ex;

DROP TABLE IF EXISTS members;

CREATE TABLE IF NOT EXISTS members (
	member_id	INT				PRIMARY KEY		AUTO_INCREMENT,
    first_name 	VARCHAR(45)		NOT NULL,
    last_name 	VARCHAR(45)		NOT NULL,
    address		VARCHAR(45) 	NOT NULL,
    city		VARCHAR(45) 	NOT NULL,
    state		VARCHAR(2)		NOT NULL,
    phone		VARCHAR(15)		NOT NULL
);

DROP TABLE IF EXISTS groups;

CREATE TABLE groups (
	group_id 	INT				PRIMARY KEY		AUTO_INCREMENT,
    group_name	VARCHAR(45)		NOT NULL
);

DROP TABLE IF EXISTS members_groups;

CREATE TABLE members_groups (
	member_id	INT			REFERENCES members(member_id),
    group_id	INT			REFERENCES groups(group_id)
);


/*Problem 3*/
INSERT INTO members VALUES(DEFAULT, 'Dustin', 'Murry', '123 Fake Street', 'Springefield', 'NJ', '800-MAT-TRES');
INSERT INTO members VALUES(DEFAULT, 'Homer', 'Simpson', '231 Fake Street', 'Springefield', 'NJ', '800-555-5555');

INSERT INTO groups VALUES(DEFAULT, 'Lunch Club');
INSERT INTO groups VALUES(DEFAULT, 'Dinner Club');

INSERT INTO members_groups (member_id, group_id)
VALUES 	(1, 2), 
		(2, 1), 
        (2, 2);

SELECT group_name, last_name, first_name
FROM members NATURAL JOIN members_groups NATURAL JOIN groups
	/*ON M.member_id = MG.member_id
    JOIN groups G
		ON MG.group_id = G.group_id*/
ORDER BY 1, 2, 3;


/*Problem 4*/
ALTER TABLE members
	ADD annual_dues		DECIMAL(5,2)	DEFAULT 52.50,
    ADD payment_date	DATE;
    
SELECT group_name, last_name, first_name, annual_dues
FROM members NATURAL JOIN members_groups NATURAL JOIN groups
ORDER BY 1, 2, 3;


/*Problem 5*/
ALTER TABLE groups
	MODIFY group_name	VARCHAR(45)		UNIQUE		NOT NULL;
    
INSERT INTO groups VALUES(DEFAULT, 'Dinner Club');
