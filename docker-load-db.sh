#!/bin/bash

psql -U postgres -c 'CREATE DATABASE startrek'
psql -U postgres -d startrek -c 'CREATE EXTENSION pgcrypto'
psql -U postgres -f /dumps/schema.sql startrek
psql -U postgres -f /dumps/data.sql startrek
