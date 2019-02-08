delete from user_role;
delete from client;

insert into client (id, active, password, username) values
  (1, true, '$2a$08$Qdg3JDfIZ4yjvX30BuogPOrJuiyNF19GJhn2lpoysFQ9BkU2OtlI6', 'danis'),
  (2, true, '$2a$08$QPUP5tIFeEB/staoeckIw.AbojU1uOuJzjqwOlbXErATgZb9zV3pm', 'Nikita');

insert into user_role (user_id, roles) values (1, 'USER'), (1, 'ADMIN'), (2, 'USER');