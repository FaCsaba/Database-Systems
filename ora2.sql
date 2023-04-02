select keresztnev, vezeteknev
from konyvtar.tag
where nem = 'n' and besorolas = 'felnőtt'
order by keresztnev desc;

select cim, ar, oldalszam, ar / oldalszam arany
from konyvtar.konyv
order by arany desc;

select 2+3 from dual;

select chr(66), chr(35) from dual;

-- lehet

-- lesz
select 'alma' || 'fa' || 'más' from dual;

select vezeteknev || ' ' || keresztnev 
from konyvtar.tag;

select besorolas, initcap(besorolas), upper(besorolas), lower(cim) from konyvtar.tag;

select cim, replace(cim, 'halál', 'cica') asdf from konyvtar.konyv;

select cim, substr(cim, 2, 6) from konyvtar.konyv;

select cim, length(cim) from konyvtar.konyv
where length(cim) > 20;

-- nagyon fontos!!
-- nvl replaces the coulumn with a value
select cim, nvl(kiado, 'nincs kiado megadva') from konyvtar.konyv;

select sysdate from dual;

-- fontos !!!
select to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss') from dual;

select to_char(sysdate, 'yyyy monthdd Day hh24:mi:ss')
from dual;

select to_date('1993.10.09', 'yyyy.mm.dd')
from dual;

select *
from konyvtar.tag
where to_date('1993.10.09', 'yyyy.mm.dd') > szuletesi_datum;

select to_char(add_months(sysdate, 2)+1, 'yyyy-mm-dd')
from dual;

select floor(months_between(sysdate, to_date('2002-07-05', 'yyyy-mm-dd')) / 12)
from dual;

select *
from konyvtar.tag
where lower(keresztnev) like '%a%' and besorolas = 'törzstag'
order by vezeteknev desc;

select keresztnev, vezeteknev
from konyvtar.tag
where lower(keresztnev) like 'z%' and lower(vezeteknev) like 'p%';
select *
from konyvtar.tag;

select keresztnev, vezeteknev, tagdij * .4
from konyvtar.tag
where cim like '% Budapest,%' and besorolas = 'diák';

select replace(cim, 'al', 'el')
from konyvtar.konyv;

select cim
from konyvtar.konyv
where isbn like '___0%'
order by cim desc;

select vezeteknev || ' ' || keresztnev, to_char(beiratkozasi_datum, 'yyyy-mm-dd')
from konyvtar.tag
order by tagdij asc;

select cim, to_char(kiadas_datuma, 'yyyy-mm-dd'), tema
from konyvtar.konyv
where tema in ('krimi', 'horror', 'történelem') and oldalszam >= 220
order by kiado asc;

select *
from konyvtar.tag
where cim like '% út %' or (lower(vezeteknev || ' ' || keresztnev) like '%e%e%' and lower(vezeteknev || ' ' || keresztnev) not like '%e%e%e%')
order by vezeteknev;

select vezeteknev, keresztnev
from konyvtar.tag
where (months_between(sysdate, szuletesi_datum)/12)<30;