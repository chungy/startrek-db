#!/bin/sh

# Script to generate the data.sql and schema.sql files.
# Very simple and dumb.

pg_dump --if-exists -Oxcsn public startrek > schema.sql
pg_dump -Oan public startrek > data.sql
