DROP TABLE APPOINTMENT IF EXISTS;
DROP TABLE AUTO_USER IF EXISTS;
DROP TABLE SERVICES IF EXISTS;

CREATE TABLE APPOINTMENT (
  APPOINTMENT_ID BIGINT GENERATED BY DEFAULT AS IDENTITY,
  APPOINTMENT_DT TIMESTAMP,
  MAKE           VARCHAR(255),
  MODEL          VARCHAR(255),
  YEAR           SMALLINT,
  USER_ID        BIGINT,
  STATUS         VARCHAR(255),
  PRIMARY KEY (APPOINTMENT_ID)
);

CREATE TABLE AUTO_USER (
  autoUserId BIGINT GENERATED BY DEFAULT AS IDENTITY,
  EMAIL      VARCHAR(255),
  FIRST_NAME VARCHAR(255),
  LAST_NAME  VARCHAR(255),
  PASSWORD   VARCHAR(255),
  USERNAME   VARCHAR(255),
  PRIMARY KEY (autoUserId)
);

CREATE TABLE SERVICES (
  APPOINTMENT_ID BIGINT NOT NULL,
  NAME           VARCHAR(255)
);

ALTER TABLE APPOINTMENT
  ADD CONSTRAINT FK_hjr0wl1nbp09iulymmarqjj08
FOREIGN KEY (USER_ID)
REFERENCES AUTO_USER;

ALTER TABLE SERVICES
  ADD CONSTRAINT FK_e1e9lupq7o7mwsgtbkwd6uivn
FOREIGN KEY (APPOINTMENT_ID)
REFERENCES APPOINTMENT;


INSERT INTO AUTO_USER (autoUserId, EMAIL, FIRST_NAME, LAST_NAME, PASSWORD, USERNAME)
VALUES (NULL, 'kevin.m.bowersox@gmail.com', 'Kevin', 'Bowersox', 'password', 'kbowersox');
INSERT INTO AUTO_USER (autoUserId, EMAIL, FIRST_NAME, LAST_NAME, PASSWORD, USERNAME)
VALUES (NULL, 'johndoe@gmail.com', 'John', 'Doe', 'password', 'kbowersox');
INSERT INTO AUTO_USER (autoUserId, EMAIL, FIRST_NAME, LAST_NAME, PASSWORD, USERNAME)
VALUES (NULL, 'janedoe@gmail.com', 'Jane', 'Doe', 'password', 'kbowersox');
INSERT INTO AUTO_USER (autoUserId, EMAIL, FIRST_NAME, LAST_NAME, PASSWORD, USERNAME)
VALUES (NULL, 'juniordoe@gmail.com', 'Junior', 'Doe', 'password', 'kbowersox');

INSERT INTO APPOINTMENT (APPOINTMENT_ID, APPOINTMENT_DT, MAKE, MODEL, YEAR, USER_ID, STATUS)
VALUES (1, '2015-08-12 00:00:00', 'Subaru', 'Impreza', '2015', 1, 'Initial');
INSERT INTO APPOINTMENT (APPOINTMENT_ID, APPOINTMENT_DT, MAKE, MODEL, YEAR, USER_ID, STATUS)
VALUES (2, '2015-08-12 00:00:00', 'Subaru', 'Legacy', '2015', 2, 'Initial');

INSERT INTO SERVICES (APPOINTMENT_ID, NAME) VALUES (1, 'Oil Change');
INSERT INTO SERVICES (APPOINTMENT_ID, NAME) VALUES (1, 'Tire Change');
INSERT INTO SERVICES (APPOINTMENT_ID, NAME) VALUES (2, 'Antifreeze Change');
INSERT INTO SERVICES (APPOINTMENT_ID, NAME) VALUES (2, 'Bulb Change');

;