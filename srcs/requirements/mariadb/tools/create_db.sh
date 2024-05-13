#!/bin/bash


# Run the SQL script to create the database and user.
mysqld --bootstrap < init.sql
