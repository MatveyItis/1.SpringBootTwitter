create extension if not exists pgcrypto;

update client set password= crypt(password, gen_salt('bf', 8));