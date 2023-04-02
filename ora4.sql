select tema
from konyvtar.konyv
group by tema
having count(konyv_azon) < 3;

select kiado from konyvtar.konyv
where oldalszam > 200
group by kiado
having count(konyv_azon) > 2;

select *
from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz
on k.konyv_azon = ksz.konyv_azon inner join konyvtar.szerzo sz on ksz.szerzo_azon = sz.szerzo_azon
where extract(month from szuletesi_datum) = 5
and lower(cim) like '%a%a%' and lower(cim) not like '#a%a%a%' and honorarium > 100;

select *
from konyvtar.kolcsonzes k inner join konyvtar.tag t
on k.tag_azon = t.olvasojegyszam
where t.vezeteknev = 'Ácsi' and t.keresztnev = 'Milán';

select *
from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz
on k.konyv_azon = ksz.konyv_azon inner join konyvtar.szerzo sz on ksz.szerzo_azon = sz.szerzo_azon
where vezeteknev = 'Jókai' and keresztnev = 'Mór';

select vezeteknev, keresztnev, count(distinct kiado)
from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz
on k.konyv_azon = ksz.konyv_azon inner join konyvtar.szerzo sz on ksz.szerzo_azon = sz.szerzo_azon
group by ksz.szerzo_azon, vezeteknev, keresztnev;

-- Frei Tamasnal fiatalabb tag
select t.vezeteknev, t.keresztnev
from konyvtar.szerzo sz, konyvtar.tag t
where sz.vezeteknev = 'Frei' and sz.keresztnev = 'Tamás' and sz.szuletesi_datum < t.szuletesi_datum;

-- beagyazott select
-- ki a legidosebb tag
select vezeteknev, keresztnev
from konyvtar.tag
where szuletesi_datum = (select min(szuletesi_datum)
from konyvtar.tag);

select cim
from konyvtar.konyv
where ar = (select max(ar)
from konyvtar.konyv
where tema = 'krimi');

select vezeteknev, keresztnev, tagdij
from konyvtar.tag
where tagdij < (
select avg(tagdij)
from konyvtar.tag
where besorolas in ('nyugdíjas', 'diák'));

select vezeteknev, keresztnev
from konyvtar.tag
where olvasojegyszam not in (
select tag_azon
from konyvtar.kolcsonzes);

select cim, kiado, ar
from konyvtar.konyv k
where not exists
(select * from konyvtar.konyvtari_konyv
where konyv_azon = k.konyv_azon);

select cim
from konyvtar.konyv
order by cim
fetch first 10 rows only;

select cim
from konyvtar.konyv
order by cim
offset 10 rows fetch next 10 rows only;

select cim, kiado
from konyvtar.konyv
order by cim
fetch first 10 percent rows only;

select vezeteknev, keresztnev, to_char(szuletesi_datum, 'YYYY-MM-DD')
from konyvtar.szerzo
where szuletesi_datum = (
select min(szuletesi_datum)
from konyvtar.szerzo);

select first_name, last_name from hr.departments d inner join hr.employees e on d.department_id = e.department_id
where department_name = 'Sales';




