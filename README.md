# Star Trek database

This is a database containing metadata for all the episodes and movies
in the _Star Trek_ franchise.  It can be used to query information
about episode listings, DVD and Blu-ray contents, release dates, star
dates, and a few other miscellany.  The database covers all fourteen
movies released, and classic _Star Trek_ television episodes (this is
to say, everything through the end of _Star Trek: Enterprise_).  One
additional, and unofficial, entry is [_Star Trek
Continues_](https://www.startrekcontinues.com/), because I am a fan of
this fan-made series.

This database is built in [SQLite](https://sqlite.org/), a portable
and no-install database program contained in a single program, and the
database in a single file.  This makes it easy to use without any sort
of database administration required.

## Using the database

A pre-built binary database may be downloaded from the following link:
[startrek.db](/uv/startrek.db).  You can use `sqlite3 startrek.db` to
interact with the database, or any number of available
SQLite-compatible GUI utilities.

The source code to this project is primarily two files: `schema.sql`
and `data.sql`.  In a fresh check-out of the repository, you may run

```
$ make
```

to build the `startrek.db` file, which should be practically identical
to the above download, barring trivial differences between SQLite
versions.  Both a Makefile (for Unix systems) and Windows batch file
are provided; as long as you have `sqlite3` in your `$PATH`, it should
work.

## Cloning the repository

This is a [Fossil](https://fossil-scm.org/) repository, and may be
cloned (having `fossil` in your `$PATH`) by:

```
$ fossil clone https://chiselapp.com/user/chungy/repository/startrek-db
```

If you are viewing this on GitHub, know the upstream forge is at the
[above
link](https://chiselapp.com/user/chungy/repository/startrek-db).

## Future plans

Without any promise for plans to be realized (this project is 10 years
old at time of writing), some ideas:

### Expanded media

The media set tables are biased toward media that I actually own.
_Star Trek_ has been on virtually every kind of physical media that
has ever existed (LaserDisc, Betamax, VHS, etc), and there remains a
lot of room to document all of it.

### Kurtzman-era documenation

As mentioned earlier, only classic _Star Trek_ is represented.  In the
earlier PostgreSQL version of the database, I had kept updates for
_Discovery_, _Lower Decks_, and _Picard_, but apathy toward the Alex
Kurtzman era caused me to become disinterested and I never stuck with
them to the end of their runs, and likewise did not update the
PostgreSQL database as episodes came out.  I'll use the Postgres
version to reference what's in there, and siphon Memory Alpha for the
rest.

### GUI/WebUI to interact with the database

SQL is not for everyone.  It may be nice to make a GUI program or a
WebUI to interact with the database.
