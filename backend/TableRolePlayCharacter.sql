CREATE TABLE "users" (
  "id" bigint PRIMARY KEY,
  "username" varchar,
  "phone" bigint,
  "character_id" bigint
);

CREATE TABLE "games" (
  "id" bigint PRIMARY KEY,
  "name" varchar,
  "description" text
);

CREATE TABLE "character_templates" (
  "id" bigint PRIMARY KEY,
  "game_id" bigint NOT NULL,
  "template_name" varchar NOT NULL,
  "attributes" JSONB,
  "class_id" bigint,
  "race_id" bigint
);

CREATE TABLE "characters" (
  "id" bigint PRIMARY KEY,
  "name" varchar,
  "template_id" bigint NOT NULL
);

CREATE TABLE "talents" (
  "id" bigint PRIMARY KEY,
  "game_id" bigint,
  "name" varchar,
  "description" text
);

CREATE TABLE "spells" (
  "id" bigint PRIMARY KEY,
  "game_id" bigint,
  "name" varchar,
  "description" text
);

CREATE TABLE "races" (
  "id" bigint PRIMARY KEY,
  "game_id" bigint,
  "name" varchar,
  "description" text
);

CREATE TABLE "classes" (
  "id" bigint PRIMARY KEY,
  "game_id" bigint,
  "name" varchar,
  "description" text
);

ALTER TABLE "users" ADD FOREIGN KEY ("character_id") REFERENCES "characters" ("id");

ALTER TABLE "character_templates" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("id");

ALTER TABLE "character_templates" ADD FOREIGN KEY ("class_id") REFERENCES "classes" ("id");

ALTER TABLE "character_templates" ADD FOREIGN KEY ("race_id") REFERENCES "races" ("id");

ALTER TABLE "characters" ADD FOREIGN KEY ("template_id") REFERENCES "character_templates" ("id");

ALTER TABLE "talents" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("id");

ALTER TABLE "spells" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("id");

ALTER TABLE "races" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("id");

ALTER TABLE "classes" ADD FOREIGN KEY ("game_id") REFERENCES "games" ("id");
