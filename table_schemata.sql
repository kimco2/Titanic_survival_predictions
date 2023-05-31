
 -- Creating the tables
CREATE TABLE "passenger_information" (
    "passenger_id" int   NOT NULL,
    "pclass_updated" varchar(20)   NOT NULL,
    "name" varchar(150)   NOT NULL,
    "sex" varchar(10)   NOT NULL,
    "age_updated" numeric   NOT NULL,
    "sibsp" int   NOT NULL,
    "parch" int   NOT NULL,
    "ticket" varchar(30)   NOT NULL,
    "fare_updated" numeric   NOT NULL,
    "cabin" varchar(30)  ,
    "embarked_updated" varchar(20)   NOT NULL,
    "home_dest_updated" varchar(100)   NOT NULL,
    "deck" varchar(10)   NOT NULL,
    CONSTRAINT "pk_passenger_information" PRIMARY KEY (
        "passenger_id"
     )
);

CREATE TABLE "survival" (
    "passenger_id" int   NOT NULL,
    "survived" int   NOT NULL,
    "boat" varchar(10) ,
    "body" numeric  ,
    CONSTRAINT "pk_survival" PRIMARY KEY (
        "passenger_id"
     )
);

ALTER TABLE "survival" ADD CONSTRAINT "fk_survival_passenger_id" FOREIGN KEY("passenger_id")
REFERENCES "passenger_information" ("passenger_id");

-- Importing data into the tables from the relevant csv file
COPY passenger_information FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\who_survived_the_titanic\data_files\titanic_passenger_info.csv'DELIMITER ',' CSV HEADER;
COPY survival FROM 'C:\Users\kymco\Desktop\UWA_data_analytics\homework\who_survived_the_titanic\data_files\titanic_survival_info.csv'DELIMITER ',' CSV HEADER;

-- Checking the data imported
select * from passenger_information;
select * from survival;