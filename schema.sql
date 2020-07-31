-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/V36RX5
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Sport" (
    "id" serial   NOT NULL,
    "Sport" varchar   NOT NULL,
    CONSTRAINT "pk_Sport" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Country" (
    "id" serial   NOT NULL,
    "Country_code" varchar   NOT NULL,
    "Country" varchar   NOT NULL,
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

CREATE TABLE "Olympic_Season" (
    "id" serial   NOT NULL,
    "City" varchar   NOT NULL,
    "Year" int   NOT NULL,
    "Season" varchar   NOT NULL,
    CONSTRAINT "pk_Olympic_Season" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Event" (
    "id" serial   NOT NULL,
    "Event_name" varchar   NOT NULL,
    "Athlete_id" int   NOT NULL,
    "Sport_id" int   NOT NULL,
    "Olympic_season_id" int   NOT NULL,
    CONSTRAINT "pk_Event" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Athlete_event" (
    "Athlete_id" int   NOT NULL,
    "Medal" varchar   NOT NULL,
    "Event_id" int   NOT NULL
);

CREATE TABLE "Country_stats" (
    "Year" int   NOT NULL,
    "Country_id" int   NOT NULL,
    "Population" int,
    "GDP" int,
    CONSTRAINT "pk_Country_stats" PRIMARY KEY (
        "Year","Country_id"
     )
);

ALTER TABLE "Athlete" ADD CONSTRAINT "fk_Athlete_Nationality" FOREIGN KEY("Nationality")
REFERENCES "Country" ("id");

ALTER TABLE "Event" ADD CONSTRAINT "fk_Event_Athlete_id" FOREIGN KEY("Athlete_id")
REFERENCES "Athlete" ("id");

ALTER TABLE "Event" ADD CONSTRAINT "fk_Event_Sport_id" FOREIGN KEY("Sport_id")
REFERENCES "Sport" ("id");

ALTER TABLE "Event" ADD CONSTRAINT "fk_Event_Olympic_season_id" FOREIGN KEY("Olympic_season_id")
REFERENCES "Olympic_Season" ("id");

ALTER TABLE "Athlete_event" ADD CONSTRAINT "fk_Athlete_event_Athlete_id" FOREIGN KEY("Athlete_id")
REFERENCES "Athlete" ("id");

ALTER TABLE "Athlete_event" ADD CONSTRAINT "fk_Athlete_event_Event_id" FOREIGN KEY("Event_id")
REFERENCES "Event" ("id");

ALTER TABLE "Country_stats" ADD CONSTRAINT "fk_Country_stats_Country_id" FOREIGN KEY("Country_id")
REFERENCES "Country" ("id");

