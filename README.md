# _Star Trek_ Database

This thing evolved eventually from a very simple and dumb database for
me to use for selecting random episodes from my TOS and TNG sets,
which is also mostly why those two are the only ones presently
represented with DVD/Blu-ray entries.

In short, it’s a PostgreSQL database containing metadata for all the
episodes and movies in the _Star Trek_ franchise.  In this version I’m
pushing out publicly, I designed it a bit generically and loosely
modeled after the [MusicBrainz](https://musicbrainz.org/) database.  I
initially had tables for all the series but it created a lot of
redundant schema details throughout, and was a pain when I wanted to
do `ALTER TABLE` to change them around.  It’s a little bit unwieldy at
times, but everything has UUIDs now and a few layers of indirection
between it all.  Overall though, this is exactly what views are for,
and I’ve included some obvious ones already.

All seven official series and thirteen movies are included in the
database, with one extra: _Star Trek Continues_, because I’m a fan of
their work.  Perhaps opening the floodgates a bit too much for people
to add other fan series, but that’s perfectly fine by me.

## Using it

As I made this with [PostgreSQL](https://www.postgresql.org/), that’s
what you’ll need to have installed and running in order to load this
database.  PostgreSQL is available on all the major OSes (including
Linux, Windows, and Mac OS) and isn’t difficult to set up.  I won’t
cover how to do that here.  Any recent version should do (I did this
on 9.4).

Once you have PostgreSQL installed and running, I recommend creating a
new database, probably with a name like `startrek`, to load the schema
and data into.  A separate database isn’t strictly required, but you
may run into collision issues by using another.

As the database superuser, run `CREATE EXTENSION pgcrypto` on the
`startrek` database, this extension is required in order to use the
`gen_random_uuid()` function. Following that, the following two
commands should load the schema and the data:

```
$ psql -f schema.sql startrek
$ psql -f data.sql startrek
```

## Moving forward

I’ll be happy to accept additions and improvements to the database.
There’s a lot missing, in particular with video sets of all the series
and on all the formats (VHS, DVD, LaserDisc, whatever...).  And
probably more that I can’t forsee. 😉
