select vezeteknev || ' ' || keresztnev, to_char(szuletesi_datum, 'yyyy-mm-dd')
from konyvtar.tag
where lower(keresztnev) like 'a%a';

select *
from konyvtar.konyv
where isbn like '_7%'
order by tema desc;

select vezeteknev, keresztnev
from konyvtar.tag
where lower(vezeteknev || ' ' || keresztnev) like '%a%a%a%' and lower(vezeteknev || ' ' || keresztnev) not  like '%a%a%a%a%';

select to_char(sysdate+1, 'yyyy-mm-dd hh24-mi-ss') plus_egy_nap
from dual;

select to_char(add_months(sysdate, 1), 'yyyy-mm-dd hh24-mi-ss') plus_egy_honap
from dual;

select to_char(add_months(sysdate, 12), 'yyyy-mm-dd hh24-mi-ss') plus_egy_ev
from dual;

select to_char(sysdate + 1/24, 'yyyy-mm-dd hh24-mi-ss') plus_egy_ora
from dual;

select to_char(sysdate + 1/24/60, 'yyyy-mm-dd hh24-mi-ss') plus_egy_perc
from dual;

select to_char(sysdate + (1/24/60)*5, 'yyyy-mm-dd hh24-mi-ss') plus_egy_perc
from dual;

select *
from konyvtar.konyv
where (tema like 'krimi' or oldalszam < 30) and (kiado is null or lower(cim) like 'a%');

-- lehet ilyen feladat
select to_char(sysdate, 'mm')
from dual;

select extract (month from sysdate)
from dual;

select to_char(sysdate, 'yyyy')
from dual;

select extract (year from sysdate)
from dual;

select *
from konyvtar.szerzo
where floor((months_between(sysdate, szuletesi_datum) / 12)) > 100
order by extract (month from szuletesi_datum) desc;

select *
from konyvtar.konyv
where tema in ('krimi', 'természettudomány', 'horror') and oldalszam > 50 and  extract (year from kiadas_datuma) between 1970 and 2006;

select *
from konyvtar.tag
where cim not like '%Debrecen, %' 
and (floor((months_between(sysdate, szuletesi_datum))/12) < 20
or floor((months_between(sysdate, szuletesi_datum))/12) > 30)
order by szuletesi_datum desc, vezeteknev desc;

select vezeteknev || ' ' || keresztnev
from konyvtar.tag
where floor(months_between(sysdate, beiratkozasi_datum)/12) > 30
order by szuletesi_datum desc, extract (month from szuletesi_datum) asc;

select kesedelmi_dij
from konyvtar.kolcsonzes
where hany_napra > 100;

select vezeteknev || ' ' || keresztnev, to_char(szuletesi_datum, 'yyyy-mm-dd')
from konyvtar.tag
where to_date('1980-03-02', 'yyyy-mm-dd') > szuletesi_datum and nem = 'f';

