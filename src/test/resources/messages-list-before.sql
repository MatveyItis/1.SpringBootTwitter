delete from message;

insert into message (id, text, tag, user_id) values
  (1, 'first', 'tag', 1),
  (2, 'first1', 'tag-3', 1),
  (3, 'firs2', 'tag', 1),
  (4, 'first45', 'tag-1', 1);

alter sequence hibernate_sequence restart with 10;