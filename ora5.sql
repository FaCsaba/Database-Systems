--1. Melyek azok a könyvek, amelyeknek az oldalankénti ára több, mint 20?
--Listizzuk a könyv címét, azonosítóját, oldalankénti árát.
--A lista legyen az oldalankénti ár szerint rendezett.

select cim, konyv_azon, ar/oldalszam from konyvtar.konyv
where ar/oldalszam > 20
order by ar/oldalszam;


--2. Melyek azok a tagok, akiknek a címében szerepel az 'út' szó, 
--vagy a nevükben pontosan két 'e' betû szerepel? A lista legyen név szerint rendezve.
select * from konyvtar.tag
where cim like '% út %' or (lower(vezeteknev || keresztnev) like '%e%e%' and lower(vezeteknev || keresztnev) not like '%e%e%e%')
order by vezeteknev;


--3. Listázzuk ki az 1940 és 1960 között született nõi tagok besorolását. 
--Minden besorolás csak egyszer szerepeljen. Rendezzük a listát.
select distinct(besorolas) from konyvtar.tag
where extract(year from szuletesi_datum) BETWEEN to_date('1940', 'YYYY') and to_date('1960', 'YYYY') and nem = 'n'
order by besorolas;

--4. Hány olyan  tag van, aki 1980.03.01 elõtt született?
select count(olvasojegyszam) from konyvtar.tag
where szuletesi_datum < to_date('1980.03.01', 'YYYY.MM.DD');

--5. A keresztnév elsõ két betûjeként csoportosotva hány nõi tag van?
--Rendezzek a listát darabszám szerint csökkenõen.


--6. Keressük azokat a szerzõket, akik krimi, sci-fi, horror témájú 
--könyvek megírásáért 2 milliónál több összhonoráriumot kaptak.
select * from konyvtar.szerzo
where szerzo_azon = (select szerzo_azon from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz on k.konyv_azon = ksz.konyv_azon
where honorarium > 2000000 and tema in ('krimi', 'sci-fi', 'horror'));

-- 7. Kik azok a debreceni tagok, akik 1-nél több példányt kölcsönöztek ki?
select tag_azon, count(tag_azon) from konyvtar.kolcsonzes 
group by tag_azon
having count(tag_azon) > 1;

--8. Melyik könyvbõl nincs példány? (BEÁGYAZOTT SELECT)
select *
from konyvtar.konyv
where konyv_azon not in (select konyv_azon from konyvtar.konyvtari_konyv);

--9. Melyik szerzõ kapta a legnagyobb összhonoráriumot? (BEÁGYAZOTT SELECT)
select sz.szerzo_azon, sum(ksz.honorarium) as honorarium_szum from konyvtar.szerzo sz inner join konyvtar.konyvszerzo ksz on sz.szerzo_azon = ksz.szerzo_azon
group by sz.szerzo_azon
order by honorarium_szum desc;


--11. Melyek azok a könyvek, amelyek az átlagos árú könyvektõl olcsóbbak és 
--amelyeket Móra Ferenc szerzõ írt?
select * from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz on k.szerzo_ = ksz.szerzo_azon
where ar < (select avg(ar) from konyvtar.konyv)
    and vezeteknev='Móra'
    and keresztnev='Ferenc';

--12. A nõi tagok között mi a legfiatalabb tagnak a neve? 
select *
from konyvtar.tag
where szuletesi_datum = (select max(szuletesi_datum) from konyvtar.tag where nem = 'n');
