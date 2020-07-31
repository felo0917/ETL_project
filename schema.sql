-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/V36RX5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Sports" (
    "id" serial   NOT NULL,
    "Sport" varchar   NOT NULL,
    CONSTRAINT "pk_Sports" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Country" (
    "id" serial   NOT NULL,
    "Country_code" varchar   NOT NULL,
    "Country" varchar   NOT NULL,
    "Population" int   NOT NULL,
    "GDP" int   NOT NULL,
    CONSTRAINT "pk_Country" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Athlete" (
    "id" int   NOT NULL,
    "Name" varchar   NOT NULL,
    "Sex" varchar   NOT NULL,
    "Nationality" int   NOT NULL,
    CONSTRAINT "pk_Athlete" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Olympics" (
    "id" serial   NOT NULL,
    "City" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Season" varchar   NOT NULL,
    "Sport_id" int   NOT NULL,
    CONSTRAINT "pk_Olympics" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Events" (
    "id" serial   NOT NULL,
    "Event_name" varchar   NOT NULL,
    "Athlete_id" int   NOT NULL,
    "Sport_id" int   NOT NULL,
    CONSTRAINT "pk_Events" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Medal_winners" (
    "id" serial   NOT NULL,
    "Medal" varchar   NOT NULL,
    "Country_id" int   NOT NULL,
    "Event_id" int   NOT NULL,
    CONSTRAINT "pk_Medal_winners" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Athlete" ADD CONSTRAINT "fk_Athlete_Nationality" FOREIGN KEY("Nationality")
REFERENCES "Country" ("id");

ALTER TABLE "Olympics" ADD CONSTRAINT "fk_Olympics_Sport_id" FOREIGN KEY("Sport_id")
REFERENCES "Sports" ("id");

ALTER TABLE "Events" ADD CONSTRAINT "fk_Events_Athlete_id" FOREIGN KEY("Athlete_id")
REFERENCES "Athlete" ("id");

ALTER TABLE "Events" ADD CONSTRAINT "fk_Events_Sport_id" FOREIGN KEY("Sport_id")
REFERENCES "Sports" ("id");

ALTER TABLE "Medal_winners" ADD CONSTRAINT "fk_Medal_winners_id" FOREIGN KEY("id")
REFERENCES "Athlete" ("id");

ALTER TABLE "Medal_winners" ADD CONSTRAINT "fk_Medal_winners_Country_id" FOREIGN KEY("Country_id")
REFERENCES "Country" ("id");

ALTER TABLE "Medal_winners" ADD CONSTRAINT "fk_Medal_winners_Event_id" FOREIGN KEY("Event_id")
REFERENCES "Events" ("id");

