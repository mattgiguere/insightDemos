/*
PROBLEM:
For all cases where the same reviewer rated the same 
movie twice and gave it a higher rating the second time, 
return the reviewer's name and the title of the movie. 
*/


#Instead, I will just copy and paste the join query twice:

select name, title
    from 
        (select r.name as name,
        m.title as title,
        t.ratingDate as rDate,
        t.stars as stars
        from Reviewer r
        inner join Rating t
        on r.rID=t.rID
        inner join Movie m
        on t.mID=m.mID) a
    inner join 
        (select r.name as name,
        m.title as title,
        t.ratingDate as rDate,
        t.stars as stars
        from Reviewer r
        inner join Rating t
        on r.rID=t.rID
        inner join Movie m
        on t.mID=m.mID) b
    using (title, name)
    where b.rDate > a.rDate
        and b.stars > a.stars;


/* BLA! MySQL does not support
common table expressions! The 
below code will not work with MySQL!
Instead, I needed to put the full 
inner join in parentheses
*/
with tablea as
    (select r.name as name,
        m.title as title,
        t.ratingDate as rDate,
        t.stars as stars
        from Reviewer r
        inner join Rating t
        on r.rID=t.rID
        inner join Movie m
        on t.mID=m.mID),
select name from tablea;

