ALTER TABLE users
    drop column isadmin,
    ADD COLUMN isadmin INTEGER;
        /*CONSTRAINT users_isadmin_0or1 CHECK ( isadmin=0 OR isadmin=1);*/

INSERT INTO users(ID, FIST_NAME, LAST_NAME, ISADMIN)
VALUES (234,'Marzhan','Omarbekova', 5);


