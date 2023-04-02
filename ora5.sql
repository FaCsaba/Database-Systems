--1. Melyek azok a k�nyvek, amelyeknek az oldalank�nti �ra t�bb, mint 20?
--Listizzuk a k�nyv c�m�t, azonos�t�j�t, oldalank�nti �r�t.
--A lista legyen az oldalank�nti �r szerint rendezett.

select cim, konyv_azon, ar/oldalszam from konyvtar.konyv
where ar/oldalszam > 20
order by ar/oldalszam;


--2. Melyek azok a tagok, akiknek a c�m�ben szerepel az '�t' sz�, 
--vagy a nev�kben pontosan k�t 'e' bet� szerepel? A lista legyen n�v szerint rendezve.
select * from konyvtar.tag
where cim like '% �t %' or (lower(vezeteknev || keresztnev) like '%e%e%' and lower(vezeteknev || keresztnev) not like '%e%e%e%')
order by vezeteknev;


--3. List�zzuk ki az 1940 �s 1960 k�z�tt sz�letett n�i tagok besorol�s�t. 
--Minden besorol�s csak egyszer szerepeljen. Rendezz�k a list�t.
select distinct(besorolas) from konyvtar.tag
where extract(year from szuletesi_datum) BETWEEN to_date('1940', 'YYYY') and to_date('1960', 'YYYY') and nem = 'n'
order by besorolas;

--4. H�ny olyan  tag van, aki 1980.03.01 el�tt sz�letett?
select count(olvasojegyszam) from konyvtar.tag
where szuletesi_datum < to_date('1980.03.01', 'YYYY.MM.DD');

--5. A keresztn�v els� k�t bet�jek�nt csoportosotva h�ny n�i tag van?
--Rendezzek a list�t darabsz�m szerint cs�kken�en.


--6. Keress�k azokat a szerz�ket, akik krimi, sci-fi, horror t�m�j� 
--k�nyvek meg�r�s��rt 2 milli�n�l t�bb �sszhonor�riumot kaptak.
select * from konyvtar.szerzo
where szerzo_azon = (select szerzo_azon from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz on k.konyv_azon = ksz.konyv_azon
where honorarium > 2000000 and tema in ('krimi', 'sci-fi', 'horror'));

-- 7. Kik azok a debreceni tagok, akik 1-n�l t�bb p�ld�nyt k�lcs�n�ztek ki?
select tag_azon, count(tag_azon) from konyvtar.kolcsonzes 
group by tag_azon
having count(tag_azon) > 1;

--8. Melyik k�nyvb�l nincs p�ld�ny? (BE�GYAZOTT SELECT)
select *
from konyvtar.konyv
where konyv_azon not in (select konyv_azon from konyvtar.konyvtari_konyv);

--9. Melyik szerz� kapta a legnagyobb �sszhonor�riumot? (BE�GYAZOTT SELECT)
select sz.szerzo_azon, sum(ksz.honorarium) as honorarium_szum from konyvtar.szerzo sz inner join konyvtar.konyvszerzo ksz on sz.szerzo_azon = ksz.szerzo_azon
group by sz.szerzo_azon
order by honorarium_szum desc;


--11. Melyek azok a k�nyvek, amelyek az �tlagos �r� k�nyvekt�l olcs�bbak �s 
--amelyeket M�ra Ferenc szerz� �rt?
select * from konyvtar.konyv k inner join konyvtar.konyvszerzo ksz on k.szerzo_ = ksz.szerzo_azon
where ar < (select avg(ar) from konyvtar.konyv)
    and vezeteknev='M�ra'
    and keresztnev='Ferenc';

--12. A n�i tagok k�z�tt mi a legfiatalabb tagnak a neve? 
select *
from konyvtar.tag
where szuletesi_datum = (select max(szuletesi_datum) from konyvtar.tag where nem = 'n');
