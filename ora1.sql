SELECT *
FROM konyvtar.konyv;

SELECT cim 
FROM konyvtar.konyv;

SELECT *
FROM konyvtar.tag
WHERE nem = 'n';

SELECT *
FROM konyvtar.tag
WHERE nem != 'n';

select vezeteknev, keresztnev
from konyvtar.tag
where besorolas = 'diák';

select vezeteknev, keresztnev
from konyvtar.tag
where besorolas = 'diák' or besorolas = 'felnõtt';

select vezeteknev, keresztnev
from konyvtar.tag
where besorolas in ('diák', 'felnõtt');

select vezeteknev, keresztnev
from konyvtar.tag
where besorolas not in ('diák', 'felnõtt');

select *
from konyvtar.tag
where nem = 'n' and tagdij < 1000;

select *
from konyvtar.tag
where nem = 'n' or tagdij < 1000;

select * from konyvtar.konyv
where kiado is not null;

select vezeteknev, keresztnev
from konyvtar.tag
where vezeteknev like 'A%';

select vezeteknev, keresztnev
from konyvtar.tag
where vezeteknev like '%a';

select vezeteknev, keresztnev
from konyvtar.tag
where vezeteknev like '%a%';

select vezeteknev, keresztnev
from konyvtar.tag
where vezeteknev like '_a%';

select cim, isbn -- zh lol :)
from konyvtar.konyv
where isbn like '%1%1%';

select cim, isbn -- very zh lol :)
from konyvtar.konyv
where isbn like '%1%1%' and isbn not like '%1%1%1%';

select kiado
from konyvtar.konyv
where cim like '% és %';

select cim
from konyvtar.konyv
where tema in ('krimi', 'thriller', 'horror');

select *
from konyvtar.tag
where cim like '%/%' and besorolas in ('diák', 'nyugdíjas');

select *
from konyvtar.tag
where cim like '4032%';



