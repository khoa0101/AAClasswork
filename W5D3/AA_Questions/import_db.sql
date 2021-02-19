drop table if exists question_likes;
drop table if exists question_follows;
drop table if exists replies;
drop table if exists questions;
drop table if exists users;
PRAGMA foreign_keys = ON;

CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
    id INTEGER PRIMARY KEY,
    question_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,

    FOREIGN KEY (question_id) REFERENCES questions(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    subject INTEGER NOT NULL,
    parents_reply_id INTEGER,
    user_id INTEGER NOT NULL,
    body TEXT NOT NULL,

    FOREIGN KEY (parents_reply_id) REFERENCES replies(id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (subject) REFERENCES questions(id)
);

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    like BOOL,
    user_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
    users (fname, lname)
VALUES
    ('Ned', 'Flanders'),
    ('Kush', 'Smith'),
    ('Earl', 'Gray');

INSERT INTO
    questions (title, body, author_id)
VALUES
    ('IT', 'Computer does not work?', (SELECT id FROM users WHERE fname = 'Ned')),
    ('Ruby', 'Ruby is not loading?', (SELECT id FROM users WHERE fname = 'Kush')),
    ('SQL', 'What is SQL?', (SELECT id FROM users WHERE fname = 'Earl'));

INSERT INTO
    replies (subject, body, parents_reply_id, user_id)
VALUES 
    ((SELECT id FROM questions WHERE title = 'IT'), 'Try pressing the power button.', null, (SELECT id FROM users WHERE fname = 'Kush')),
    ((SELECT id FROM questions WHERE title = 'Ruby'), 'Try gem install.', null, (SELECT id FROM users WHERE fname = 'Earl')),
    ((SELECT id FROM questions WHERE title = 'SQL'), 'SQL is a domain-specific language used in programming and designed for managing data held in a relational database management system, or for stream processing in a relational data stream management system.', null , (SELECT id FROM users WHERE fname= 'Ned')),
    ((SELECT id FROM questions WHERE title = 'IT'), 'Try restarting your computer.', (SELECT id FROM replies WHERE subject = (SELECT id FROM questions WHERE title = 'IT')), (SELECT id FROM users WHERE fname = 'Earl'));

INSERT INTO
    question_follows (question_id, user_id)
VALUES
    ((SELECT id FROM questions WHERE title = 'IT'), (SELECT id FROM users WHERE fname = 'Ned')),
    ((SELECT id FROM questions WHERE title = 'Ruby'),(SELECT id FROM users WHERE fname = 'Kush')),
    ((SELECT id FROM questions WHERE title = 'SQL'),(SELECT id FROM users WHERE fname = 'Earl'));

INSERT INTO
    question_likes (like, user_id, question_id)
VALUES
    (1, (SELECT id FROM users WHERE fname = 'Ned'), (SELECT id FROM questions WHERE title = 'IT')),
    (0, (SELECT id FROM users WHERE fname = 'Kush'), (SELECT id FROM questions WHERE title = 'Ruby')),
    (1, (SELECT id FROM users WHERE fname = 'Earl'), (SELECT id FROM questions WHERE title = 'SQL'));