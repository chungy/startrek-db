DBFILE?=startrek.db
SQLITE3?=sqlite3

all:
	$(SQLITE3) $(DBFILE) < schema.sql
	$(SQLITE3) $(DBFILE) < data.sql

clean:
	$(RM) startrek.db
