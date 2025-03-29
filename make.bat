@ECHO OFF

sqlite3 startrek.db < schema.sql
sqlite3 startrek.db < data.sql
