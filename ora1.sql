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
where besorolas = 'di�k';

select vezeteknev, keresztnev
from konyvtar.tag
where besorolas = 'di�k' or besorolas = 'feln�tt';

select vezeteknev, keresztnev
from konyvtar.tag
where besorolas in ('di�k', 'feln�tt');

select vezeteknev, keresztnev
from konyvtar.tag
where besorolas not in ('di�k', 'feln�tt');

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
where cim like '% �s %';

select cim
from konyvtar.konyv
where tema in ('krimi', 'thriller', 'horror');

select *
from konyvtar.tag
where cim like '%/%' and besorolas in ('di�k', 'nyugd�jas');

select *
from konyvtar.tag
where cim like '4032%';



