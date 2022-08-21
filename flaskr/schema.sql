drop table if exists roles;

CREATE TABLE if not exists user (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL
);

create table if not exists roles (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_role varchar(100) not null,
  unique(user_role)
);

INSERT INTO roles (user_role)
VALUES('ADMIN');

INSERT INTO roles (user_role)
VALUES('AUTHOR');

INSERT INTO roles (user_role)
VALUES('COMMENTOR');

create table if not exists user_roles (
  user_id int unsigned not null,
  role_id int unsigned not null,
  unique(user_id, role_id)
);

CREATE INDEX idx_user_roles_user
ON user_roles (user_id);

CREATE TABLE if not exists post (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  author_id INTEGER NOT NULL,
  created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  FOREIGN KEY (author_id) REFERENCES user (id)
);
