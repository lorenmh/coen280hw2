================================================================================
================================================================================
LAUREN HOWARD
COEN 280 HW2 - 2017.2.10
================================================================================
================================================================================
TABLES CREATED:

movie_role
tv_show_role
movie_nomination
tv_show_nomination
person_nomination
award
awards_event
imdb_user_review
critic_review
episode
season
scene
imdb_user
movie_language
movie_genre
language
movie
tv_show
person

================================================================================
================================================================================
EXECUTION RESULT:
================================================================================
================================================================================
SQL> START q1;

NAME
----------------------------------------------------------------
Jessica Alba
Scarlett Johanson
Tom Hanks

================================================================================
================================================================================
SQL> START q2;

        ID
----------
TITLE
--------------------------------------------------------------------------------
RELEASE_D      VOTES     RATING
--------- ---------- ----------
         3
My big fat greek wedding
01-FEB-00          8         10

        11
Lucy
01-FEB-15         13         10

================================================================================
================================================================================
SQL> START q3;

        ID
----------
TITLE
--------------------------------------------------------------------------------
RELEASE_D DIRECTOR_PERSON_ID PRODUCER_PERSON_ID  PROD_COST
--------- ------------------ ------------------ ----------
LOCATION
--------------------------------------------------------------------------------
        12
The Da Vinci Code
01-FEB-05                  4



        ID
----------
TITLE
--------------------------------------------------------------------------------
RELEASE_D DIRECTOR_PERSON_ID PRODUCER_PERSON_ID  PROD_COST
--------- ------------------ ------------------ ----------
LOCATION
--------------------------------------------------------------------------------
        13
The God Father part II
01-FEB-75                  1

================================================================================
================================================================================
SQL> START q4;

START_DAT
---------
01-FEB-10


================================================================================
================================================================================
SQL> START q5;

TITLE
--------------------------------------------------------------------------------
 CAST_SIZE
----------
Lucy
         4

================================================================================
================================================================================
SQL> START q6;

NAME
----------------------------------------------------------------
TITLE
--------------------------------------------------------------------------------
ROLE_COUNT
----------
Tom Hanks
The Polar Express
         6

================================================================================
================================================================================
SQL> START q7;

      YEAR
----------
TITLE
--------------------------------------------------------------------------------
    RATING
----------
      2005
The Da Vinci Code
   9

      2009
Angels and Daemons
   8

      YEAR
----------
TITLE
--------------------------------------------------------------------------------
    RATING
----------

      2010
The Island
   7

      2010
The Polar Express

      YEAR
----------
TITLE
--------------------------------------------------------------------------------
    RATING
----------
   7

      2013
Her
   8

      2013

      YEAR
----------
TITLE
--------------------------------------------------------------------------------
    RATING
----------
Now You see me
   8

      2014
Barely Lethal
   8


      YEAR
----------
TITLE
--------------------------------------------------------------------------------
    RATING
----------
      2014
Barely Lethal
   8

      2015
Lucy
  10

      YEAR
----------
TITLE
--------------------------------------------------------------------------------
    RATING
----------


9 rows selected.

================================================================================
================================================================================
SQL> START q8;

View created.


View created.


HIGH_RATINGS_COUNT
------------------
     9


LOW_RATINGS_COUNT
-----------------
    9


NO_FLOP_COUNT
-------------
      4


NAME
----------------------------------------------------------------
COUNT(MR.MOVIE_ID)
------------------
Angelina Jolie
     3

Scarlett Johanson
     3

Alex Parish
     1


NAME
----------------------------------------------------------------
COUNT(MR.MOVIE_ID)
------------------
Jennifer Lawrence
     1

================================================================================
================================================================================
SQL> START q9;

NAME
----------------------------------------------------------------
Scarlett Johanson
Julia Roberts
Angelina Jolie
Brad Pitt
Morgan Freeman

================================================================================
================================================================================
SQL> START q10;

NAME
----------------------------------------------------------------
Morgan Freeman
Brad Pitt

===============================================================================
===============================================================================
