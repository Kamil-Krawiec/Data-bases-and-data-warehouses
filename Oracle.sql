--Tworzenie tabeli
ALTER SESSION SET NLS_DATE_FORMAT = "YYYY-MM-DD";

delete from Wrogowie_kocurow;
drop table Wrogowie_kocurow;

delete from Wrogowie;
drop table Wrogowie;

delete from Funkcje;
drop table Funkcje cascade constraints;

delete from Bandy;
drop table Bandy cascade constraints;

delete from Kocury;
drop table Kocury cascade constraints;


CREATE TABLE Funkcje(
    funkcja varchar2(10) constraint f_funkcja_pk primary key,
    min_myszy number(3) constraint f_min_myszy_ch Check(min_myszy>5),
    max_myszy number(3) constraint f_max_myszy_ch check(max_myszy<200),
    constraint f_min_max_myszy_ch Check(min_myszy<max_myszy)
);

create table Wrogowie(
    imie_wroga varchar2(15) constraint w_imie_wroga_pk Primary key,
    stopien_wrogosci number(2) constraint w_stopien_wrogosci_ch CHECK(stopien_wrogosci between 1 and 10),
    gatunek varchar2(15),
    lapowka varchar2(20)
);

CREATE TABLE Kocury(
    imie VARCHAR2(15) CONSTRAINT k_imie_nn NOT NULL,
    plec VARCHAR2(1) CONSTRAINT k_plec_ch Check(plec in ('M','D')),
    pseudo VARCHAR2(15) constraint k_pseudo_pk primary key,
    funkcja varchar2(10) constraint k_funkcja_fk REFERENCES Funkcje(funkcja),
    szef varchar2(15),
--    constraint k_szef_fg references Kocury(pseudo),
    w_stadku_od date default SYSDATE,
    przydzial_myszy Number(3),
    myszy_extra Number(3),
    nr_bandy Number(2) 
);

CREATE TABLE Bandy(
    nr_bandy number(2) constraint b_nr_bandy_pk primary key,
    nazwa varchar2(20) constraint b_nazwa_nn not null,
    teren varchar2(15) constraint b_teren_u unique,
    szef_bandy varchar2(15) constraint b_szef_bandy_fk unique references Kocury(pseudo)
);
    
create table Wrogowie_kocurow(
    pseudo varchar2(15) constraint wk_pseudo_fk references Kocury(pseudo),
    imie_wroga varchar2(15) constraint wk_imie_wroga_fk references Wrogowie(imie_wroga),
    data_incydentu date constraint wk_data_incydentu_nn not null,
    opis_incydentu varchar2(50),
    constraint wk_klucz_pk Primary Key(pseudo,imie_wroga)
);
    
-- DODAWANIE DANYCH DO TABELI
    
   
insert all 
    into Funkcje(funkcja,min_myszy,max_myszy) values ('SZEFUNIO',90,110)
    into Funkcje(funkcja,min_myszy,max_myszy) values ('BANDZIOR',70,90)
    into Funkcje(funkcja,min_myszy,max_myszy) values ('LOWCZY',60,70)
    into Funkcje(funkcja,min_myszy,max_myszy) values ('LAPACZ',50,60)
    into Funkcje(funkcja,min_myszy,max_myszy) values ('KOT',40,50)
    into Funkcje(funkcja,min_myszy,max_myszy) values ('MILUSIA',20,30)
    into Funkcje(funkcja,min_myszy,max_myszy) values ('DZIELCZY',45,55)
    into Funkcje(funkcja,min_myszy,max_myszy) values ('HONOROWA',6,25)
    select * from Dual;
    
    
insert all
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('JACEK','M','PLACEK','LOWCZY','LYSY','2008-12-01',67,NULL,2)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('BARI','M','RURA','LAPACZ','LYSY','2009-09-01',56,NULL,2)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('MICKA','D','LOLA','MILUSIA','TYGRYS','2009-10-14',25,47,1)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('LUCEK','M','ZERO','KOT','KURKA','2010-03-01',43,NULL,3)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('SONIA','D','PUSZYSTA','MILUSIA','ZOMBI','2010-11-18',20,35,3)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('LATKA','D','UCHO','KOT','RAFA','2011-01-01',40,NULL,4)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('DUDEK','M','MALY','KOT','RAFA','2011-05-15',40,NULL,4)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('MRUCZEK','M','TYGRYS','SZEFUNIO',NULL,'2002-01-01',103,33,1)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('CHYTRY','M','BOLEK','DZIELCZY','TYGRYS','2002-05-05',50,NULL,1)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('KOREK','M','ZOMBI','BANDZIOR','TYGRYS','2004-03-16',75,13,3)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('BOLEK','M','LYSY','BANDZIOR','TYGRYS','2006-08-15',72,21,2)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('ZUZIA','D','SZYBKA','LOWCZY','LYSY','2006-07-21',65,NULL,2)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('RUDA','D','MALA','MILUSIA','TYGRYS','2006-09-17',22,42,1)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('PUCEK','M','RAFA','LOWCZY','TYGRYS','2006-10-15',65,NULL,4)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('PUNIA','D','KURKA','LOWCZY','ZOMBI','2008-01-01',61,NULL,3)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('BELA','D','LASKA','MILUSIA','LYSY','2008-02-01',24,28,2)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('KSAWERY','M','MAN','LAPACZ','RAFA','2008-07-12',51,NULL,4)
    into Kocury(imie,plec,pseudo,funkcja,szef,w_stadku_od,przydzial_myszy,myszy_extra,nr_bandy) values ('MELA','D','DAMA','LAPACZ','RAFA','2008-11-01',51,NULL,4)
    SELECT * FROM Dual;
   

    
insert all 
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('KAZIO',10,'CZLOWIEK','FLASZKA')
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('GLUPIA ZOSKA',1,'CZLOWIEK','KORALIK')
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('SWAWOLNY DYZIO',7,'CZLOWIEK','GUMA DO ZUCIA')
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('BUREK',4,'PIES','KOSC')
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('DZIKI BILL',10,'PIES',NULL)
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('REKSIO',2,'PIES','KOSC')
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('BETHOVEN',1,'PIES','PEDIGRIPALL')
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('CHYTRUSEK',5,'LIS','KURCZAK')
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('SMUKLA',1,'SOSNA',NULL)
    into Wrogowie(imie_wroga,stopien_wrogosci,gatunek,lapowka) values ('BAZYLI',3,'KOGUT','KURA DO STADA')
    select * from Dual;
    
    
insert all
    into Bandy(nr_bandy,nazwa,teren,szef_bandy) values (1,'SZEFOSTWO','CALOSC','TYGRYS')
    into Bandy(nr_bandy,nazwa,teren,szef_bandy) values (2,'CZARNI RYCERZE','POLE','LYSY')
    into Bandy(nr_bandy,nazwa,teren,szef_bandy) values (3,'BIALI LOWCY','SAD','ZOMBI')    
    into Bandy(nr_bandy,nazwa,teren,szef_bandy) values (4,'LACIACI MYSLIWI','GORKA','RAFA')    
    into Bandy(nr_bandy,nazwa,teren,szef_bandy) values (5,'ROCKERSI','ZAGRODA',NULL)    
    select * from Dual;
    
    
insert all 
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('TYGRYS','KAZIO','2004-10-13','USILOWAL NABIC NA WIDLY')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('ZOMBI','SWAWOLNY DYZIO','2005-03-07','WYBIL OKO Z PROCY')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('BOLEK','KAZIO','2005-03-29','POSZCZUL BURKIEM')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('SZYBKA','GLUPIA ZOSKA','2006-09-12','UZYLA KOTA JAKO SCIERKI')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('MALA','CHYTRUSEK','2007-03-07','ZALECAL SIE')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('TYGRYS','DZIKI BILL','2007-06-12','USILOWAL POZBAWIC ZYCIA')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('BOLEK','DZIKI BILL','2007-11-10','ODGRYZL UCHO')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('LASKA','DZIKI BILL','2008-12-12','POGRYZL ZE LEDWO SIE WYLIZALA')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('LASKA','KAZIO','2009-01-07','ZLAPAL ZA OGON I ZROBIL WIATRAK')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('DAMA','KAZIO','2009-02-07','CHCIAL OBEDRZEC ZE SKORY')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('MAN','REKSIO','2009-04-14','WYJATKOWO NIEGRZECZNIE OBSZCZEKAL')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('LYSY','BETHOVEN','2009-05-11','NIE PODZIELIL SIE SWOJA KASZA')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('RURA','DZIKI BILL','2009-09-03','ODGRYZL OGON')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('PLACEK','BAZYLI','2010-07-12','DZIOBIAC UNIEMOZLIWIL PODEBRANIE KURCZAKA')    
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('PUSZYSTA','SMUKLA','2010-11-19','OBRZUCILA SZYSZKAMI')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('KURKA','BUREK','2010-12-14','POGONIL')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('MALY','CHYTRUSEK','2011-07-13','PODEBRAL PODEBRANE JAJKA')
    into Wrogowie_kocurow(pseudo,imie_wroga,data_incydentu,opis_incydentu) values('UCHO','SWAWOLNY DYZIO','2011-07-14','OBRZUCIL KAMIENIAMI')
    Select * from Dual;


    
ALTER TABLE Kocury ADD constraint k_nr_bandy_fk FOREIGN KEY (nr_bandy) References Bandy(nr_bandy);
ALTER TABLE Kocury ADD constraint k_szef_fk FOREIGN KEY (szef) References Kocury(pseudo);
    
    
    
--Zadania -------------------------------------------------------------------------------------

--Zadanie 1 GIIIT
SELECT imie_wroga wrog, opis_incydentu przewina FROM Wrogowie_kocurow WHERE data_incydentu LIKE '2009%';


--Zadanie 2 GIIIT
SELECT pseudo imie, funkcja, w_stadku_od "Z nami od" FROM Kocury
    WHERE plec = 'D'
    AND w_stadku_od BETWEEN DATE ' 2005-09-01' AND DATE '2007-07-31';
    
--Zadanie 3 GIIIT

SELECT imie_wroga wrog, gatunek, stopien_wrogosci "stopien wrogosci" FROM wrogowie 
    WHERE lapowka IS NULL
    ORDER BY stopien_wrogosci;


--Zadanie 4 GIIIT

SELECT
    imie || ' zwany ' || pseudo ||' (fun. '||funkcja||') lowi myszki w bandzie ' || nr_bandy || ' od '|| w_stadku_od "wszystko o kocurach"
    FROM kocury WHERE plec = 'M'
    ORDER BY w_stadku_od DESC, pseudo;

--Zadanie 5 GIIIT
SELECT pseudo, REGEXP_REPLACE(REGEXP_REPLACE(pseudo,'A','#',1,1),'L','%',1,1) "Po wymianie A na # oraz L na %" FROM Kocury 
WHERE pseudo LIKE '%A%' AND pseudo LIKE '%L%';


--Zadanie 6 GIIIIT

SELECT imie, w_stadku_od "w stadku",  ROUND(przydzial_myszy/1.1,0) Zjadal,ADD_MONTHS(w_stadku_od,6) Podwyzka ,przydzial_myszy Zjada FROM Kocury 
    WHERE months_between(SYSDATE, w_stadku_od)/12>=13 AND EXTRACT(MONTH FROM w_stadku_od) BETWEEN 3 AND 9
    ORDER BY przydzial_myszy DESC;

--Zadanie 7 GIIIIT

SELECT imie, przydzial_myszy*3 "myszy kwartalnie", NVL(myszy_extra,0)*3 "kwartalne dodatki" FROM kocury 
WHERE NVL(przydzial_myszy,0)>2*NVL(myszy_extra,0) AND NVL(przydzial_myszy,0)>=55
ORDER BY przydzial_myszy DESC;

--Zadanie 8 ????

SELECT imie ,CASE  
    WHEN (NVL(przydzial_myszy,0)+NVL(myszy_extra,0))*12 > 660 THEN TO_CHAR(NVL(przydzial_myszy,0)*12) 
    WHEN (NVL(przydzial_myszy,0)+NVL(myszy_extra,0))*12 = 660 THEN 'LIMIT'
    ELSE 'ponizej 660' END "Zjada rocznie"
    FROM kocury
    ORDER BY imie;


--Zadanie 9 GIIIT
--NEXT_DAY(date,weekday) nastepna date weekdaya
--LAST_DAY(date) ostatni dzien biez. miesiaca

SELECT pseudo, w_stadku_od "W STADKU", 
    CASE
        WHEN EXTRACT(DAY FROM w_stadku_od) <= 15 AND NEXT_DAY(LAST_DAY(DATE'2022-10-27'), 3) - 7 >=DATE'2022-10-27'
        THEN TO_CHAR(NEXT_DAY(LAST_DAY(DATE'2022-10-25'), 3) - 7)
        
        ELSE TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(DATE'2022-10-25', 1)), 3) - 7)
 
        END "WYPLATA"
FROM Kocury
ORDER BY w_stadku_od;

SELECT pseudo, w_stadku_od "W STADKU", 
    CASE
        WHEN EXTRACT(DAY FROM w_stadku_od) <= 15 AND NEXT_DAY(LAST_DAY(DATE'2022-10-27'), 3) - 7 >=DATE'2022-10-27' --trzeba przeskoczyc do kolejnego miesiaca jesli data juz byla
        THEN TO_CHAR(NEXT_DAY(LAST_DAY(DATE'2022-10-27'), 3) - 7) 
        
        ELSE TO_CHAR(NEXT_DAY(LAST_DAY(ADD_MONTHS(DATE'2022-10-27', 1)), 3) - 7)
 
        END "WYPLATA"
FROM Kocury
ORDER BY w_stadku_od;



--Zadanie 10 GIIIIT
SELECT pseudo || ' - '||CASE WHEN COUNT(*)=1 THEN 'Unikalny' ELSE 'Nieunikalny' END "Unikalnosc atr. PSEUDO"
FROM Kocury
GROUP BY pseudo
ORDER BY pseudo;


SELECT szef || ' - '|| CASE WHEN COUNT(*)=1 THEN 'Unikalny' ELSE 'Nieunikalny' END "Unikalnosc atr. SZEF"
FROM Kocury
WHERE szef is not null
GROUP BY szef;


--Zadanie 11 GIIIIT
SELECT pseudo Pseudonim, COUNT(*) "Liczba wrogow" FROM wrogowie_kocurow 
    GROUP BY pseudo
    HAVING COUNT(*)>=2;
    
--Zadanie 12 GIIIT
SELECT 'Liczba kotow= ' || COUNT(*)|| ' lowi jako ' || funkcja ||' i zjada max. ' || round(MAX(NVL(przydzial_myszy,0)+NVL(myszy_extra,0)),0) || ' myszy miesiecznie' " "
    FROM Kocury  
    WHERE plec != 'M' AND funkcja != 'SZEFUNIO' 
    GROUP BY funkcja
    HAVING AVG(NVL(przydzial_myszy,0)+NVL(myszy_extra,0))>50;
 

-- Zadanie 13 GIIIIT
SELECT nr_bandy "nr bandy", plec, MIN(NVL(przydzial_myszy,0)) "Minimalny przydzial" FROM kocury
    GROUP BY nr_bandy,plec;

--Zadanie 14 GIIIIT

SELECT level Poziom, pseudo Pseudonim, funkcja, nr_bandy "nr bandy"
    FROM Kocury 
    WHERE plec!='D'
    CONNECT BY PRIOR pseudo=szef 
    START WITH funkcja ='BANDZIOR';

--Zadanie 15 GIIIIT
--rpad(string od prawej do lewej, ile literek, co dodac ponad limitem)

SELECT 
    CASE  
    WHEN level>1 Then 
    rpad('===>',(level-1)*4,'===>')||(level-1)
    ELSE 
    TO_CHAR(level-1)
    END||'      '||imie  Hierarchia,
    NVL(szef,'Sam sobie szefem') "Pseudo szefa",
    funkcja 
    FROM kocury
    WHERE NVL(myszy_extra,0)>0
    CONNECT BY PRIOR pseudo=szef
    START WITH szef is NULL;

--Zadanie 16 GIIIIT

SELECT RPAD(' ', (level-1)*4,' ') || pseudo "Droga sluzbowa" FROM kocury 
    CONNECT BY prior szef = pseudo AND pseudo!='RAFA'
    START WITH months_between('2022-07-14', w_stadku_od)/12>=13 AND plec='M' AND NVL(myszy_extra,0)=0 AND pseudo!='RAFA';
    


-- Zadanie 17 giiit

select k.pseudo, NVL(przydzial_myszy,0) "Przydzial myszy",b.nazwa
    from kocury k
    join bandy b on b.nr_bandy=k.nr_bandy
    where b.teren in ('CALOSC','POLE') and nvl(przydzial_myszy,0)>50
    order by 2 DESC ;
    
-- Zadanie 18 giiit

select k1.imie, k1.w_stadku_od "Poluje od" 
    from kocury k1
    join kocury k2 on k2.imie='JACEK' and k1.w_stadku_od<k2.w_stadku_od;


-- Zadanie 19 giiiit
-- a

select k1.imie,k1.funkcja, k2.imie szef1,k3.imie szef2, k4.imie szef3
    from kocury k1
    left join kocury k2 on k1.szef=k2.pseudo
    left join kocury k3 on k2.szef = k3.pseudo
    left join kocury k4 on k3.szef = k4.pseudo
    where k1.funkcja in ('MILUSIA','KOT');
    
-- b
select *
    from
    (
      select CONNECT_BY_ROOT imie "imie",imie, CONNECT_BY_ROOT funkcja "funkcja", LEVEL lvl
      from Kocury
      connect by prior szef = pseudo
      start with funkcja in ('KOT', 'MILUSIA')
    ) 
    pivot (
       min(imie) 
       for lvl in (2 szef1, 3 szef2, 4 szef3)
    );
-- c
-- instr(sys_connect_by_path(imie,'   |    '),'|',1,2) - szuka 2 wystapienia znaku | w stringu, zwraca jego miejsce
select CONNECT_BY_ROOT imie "imie", CONNECT_BY_ROOT funkcja "funkcja", substr(sys_connect_by_path(imie,'   |    '),instr(sys_connect_by_path(imie,'   |    '),'|',1,2)) "imiona kolejnych szefow"
  FROM Kocury
  where connect_by_isleaf = 1
  connect by prior szef = pseudo
  start with funkcja in ('KOT', 'MILUSIA');
  

-- Zadanie 20 giiiit
select k.imie, b.nazwa, w.imie_wroga, w.stopien_wrogosci, wk.data_incydentu 
    from kocury k
    join bandy b on b.nr_bandy=k.nr_bandy
    join wrogowie_kocurow wk on wk.pseudo=k.pseudo
    join wrogowie w on wk.imie_wroga=w.imie_wroga
    where k.plec='D' and wk.data_incydentu>'2007-01-01'
    order by 1;
-- Zadanie 21 giiit
select b.nazwa "Nazwa bandy", count(distinct wk.pseudo)
    from bandy b
    join kocury k on k.nr_bandy = b.nr_bandy
    join wrogowie_kocurow wk on wk.pseudo = k.pseudo
    group by b.nazwa;

-- Zadanie 22 giiiit
select k.funkcja, wk.pseudo ,count(wk.pseudo) "Liczba wrogow"
    from kocury k
    join wrogowie_kocurow wk on wk.pseudo = k.pseudo
    group by wk.pseudo,k.funkcja
    having count(wk.pseudo)>1;
-- Zadanie 23 giiiit 
select imie ,(nvl(myszy_extra,0)+nvl(przydzial_myszy,0))*12 "dawka roczna", 'powyzej 864' dawka
    FROM kocury
    where nvl(myszy_extra,0)>0 and (nvl(myszy_extra,0)+nvl(przydzial_myszy,0))*12>864
Union
select imie ,(nvl(myszy_extra,0)+nvl(przydzial_myszy,0))*12 "dawka roczna", 'ponizej 864' dawka
    FROM kocury
    where nvl(myszy_extra,0)>0 and (nvl(myszy_extra,0)+nvl(przydzial_myszy,0))*12<864
union 
select imie ,(nvl(myszy_extra,0)+nvl(przydzial_myszy,0))*12 "dawka roczna", '864' dawka
    FROM kocury
    where nvl(myszy_extra,0)>0 and (nvl(myszy_extra,0)+nvl(przydzial_myszy,0))*12=864
ORDER BY 2 DESC;
-- Zadanie 24 giiiit
-- a
select b.nr_bandy,b.nazwa,b.teren
    from bandy b
    left join kocury k on b.nr_bandy=k.nr_bandy
    group by b.nr_bandy,b.nazwa,b.teren
    having count(k.pseudo)=0;
-- b
select b.nr_bandy,b.nazwa,b.teren
    from bandy b
    left join kocury k on b.nr_bandy=k.nr_bandy
    group by b.nr_bandy,b.nazwa,b.teren
minus
select b.nr_bandy,b.nazwa,b.teren
    from bandy b
    join kocury k on b.nr_bandy=k.nr_bandy
    group by b.nr_bandy,b.nazwa,b.teren;
    
-- Zadanie 25 giiiiit

select k.imie, k.funkcja, nvl(k.przydzial_myszy,0)
    from kocury k
    where nvl(k.przydzial_myszy,0)>=    
                                    ALL(select 3*nvl(przydzial_myszy,0) 
                                        from kocury k
                                        join bandy b on k.nr_bandy=b.nr_bandy
                                        where funkcja='MILUSIA' and b.teren in ('SAD','CALOSC'));
                                        

-- Zadanie 26
select funkcja, round(avband,0) "Srednio najw. i najm. myszy"
    from(
    select max(av) avmin,min(av) avmax
        from(
            select AVG(nvl(przydzial_myszy,0)+nvl(myszy_extra,0)) av
                from kocury 
                where funkcja != 'SZEFUNIO'
                group by funkcja
            )
    )
    join (
        select funkcja, AVG(nvl(k2.przydzial_myszy,0)+nvl(k2.myszy_extra,0)) avband
            from kocury k2
            group by funkcja 
        ) 
    on  avband=avmin or avband=avmax;
            
    
-- Zadanie 27 giiiit

-- trzeba policzyc niepowtarzalne przydzialy myszy nie pseudo!
-- a
select  pojedynczy.pseudo, nvl(pojedynczy.przydzial_myszy,0)+nvl(pojedynczy.myszy_extra,0) Zjada
    from kocury pojedynczy
    where 
        (
        select Count(distinct ogol.przydzial_myszy+nvl(ogol.myszy_extra,0)) kotki
        from kocury ogol 
        where nvl(ogol.przydzial_myszy,0)+nvl(ogol.myszy_extra,0) > nvl(pojedynczy.przydzial_myszy,0)+nvl(pojedynczy.myszy_extra,0) 
        )<12
    order by 2 DESC;
    
-- b
select pseudo, nvl(przydzial_myszy,0)+nvl(myszy_extra,0) zjada
    from kocury
    where nvl(przydzial_myszy,0)+nvl(myszy_extra,0) in (
            select * 
                from 
                (
                select distinct nvl(przydzial_myszy,0)+nvl(myszy_extra,0)  
                from kocury 
                order by 1 DESC
                ) where ROWNUM -1<6
            );
            
    
-- c
    
select k1.pseudo, max(nvl(k1.przydzial_myszy,0)+nvl(k1.myszy_extra,0)) zjada
    from kocury k1
    left join kocury k2 on nvl(k1.przydzial_myszy,0)+nvl(k1.myszy_extra,0) < nvl(k2.przydzial_myszy,0)+nvl(k2.myszy_extra,0) 
    group by k1.pseudo
    having count(distinct k2.przydzial_myszy+nvl(k2.myszy_extra,0) )< 12
    order by 2 DESC;
    
-- d

select pseudo, zjada,miejsce
    from (select pseudo, nvl(przydzial_myszy,0)+nvl(myszy_extra,0) zjada,
        dense_rank()
        over(order by nvl(przydzial_myszy,0)+nvl(myszy_extra,0) DESC) miejsce
        from kocury)
    where miejsce -1<12;
    

-- zadanie 28 giiiit
select to_char(rok) rok, "liczba wystapien"
    from (
        select distinct extract( year from w_stadku_od) rok,count(pseudo) over(partition by extract( year from w_stadku_od)) "liczba wystapien"
            from kocury
    ) 
    where "liczba wystapien" = floor(
                                    (select avg(kotow) avgk
                                        from (
                                            select distinct extract( year from w_stadku_od) rok,count(pseudo) over(partition by extract( year from w_stadku_od)) kotow
                                                from kocury
                                            )
                                    )
                                )
union all
select 'Srednia' ,round(avg(kotow),5)
    from (
        select distinct extract( year from w_stadku_od) rok,count(pseudo) over(partition by extract( year from w_stadku_od)) kotow
            from kocury
        )
union all
select to_char(rok) rok, "liczba wystapien"
    from (
        select distinct extract( year from w_stadku_od) rok,count(pseudo) over(partition by extract( year from w_stadku_od)) "liczba wystapien"
            from kocury
            order by 2 
    ) 
    where "liczba wystapien" >(select avg(kotow) avgk
                                    from (
                                        select distinct extract( year from w_stadku_od) rok,count(pseudo) over(partition by extract( year from w_stadku_od)) kotow
                                            from kocury
                                        )
                                ) and rownum<2;

    

-- Zadanie 29 giiit
-- a
select pojedynczy.imie, MIN(nvl(ogol.myszy_extra,0)+nvl(ogol.przydzial_myszy,0)) Zjada, pojedynczy.nr_bandy, AVG(nvl(ogol.myszy_extra,0)+nvl(ogol.przydzial_myszy,0)) "Srednia bandy"
    from kocury pojedynczy
    join kocury ogol on pojedynczy.nr_bandy = ogol.nr_bandy
    where pojedynczy.plec='M'
    group by pojedynczy.nr_bandy,pojedynczy.imie
    having AVG(nvl(ogol.myszy_extra,0)+nvl(ogol.przydzial_myszy,0))>MIN(nvl(pojedynczy.myszy_extra,0)+nvl(pojedynczy.przydzial_myszy,0))
    order by 3 DESC;
    
-- b
select  k1.imie, nvl(k1.myszy_extra,0)+nvl(k1.przydzial_myszy,0) Zjada, k1.nr_bandy, av "Srednia bandy"
    from (select avg(nvl(myszy_extra,0)+nvl(przydzial_myszy,0)) av,nr_bandy nb from kocury group by nr_bandy) 
    join kocury k1 on k1.nr_bandy=nb
    where k1.plec='M' and nvl(k1.myszy_extra,0)+nvl(k1.przydzial_myszy,0)<av
    order by 3 DESC;
    
-- c
select K.imie, nvl(K.myszy_extra,0)+nvl(K.przydzial_myszy,0) Zjada,K.nr_bandy,(select avg(nvl(myszy_extra,0)+nvl(przydzial_myszy,0)) from kocury where K.nr_bandy=nr_bandy group by nr_bandy) "Srednio w bandzie"
    from kocury K
    where K.plec='M' AND nvl(K.myszy_extra,0)+nvl(K.przydzial_myszy,0)<(select avg(nvl(myszy_extra,0)+nvl(przydzial_myszy,0)) from kocury where K.nr_bandy=nr_bandy group by nr_bandy)
    order by 3 DESC;
    
-- Zadanie 30 giiiit

select k.imie,k.w_stadku_od "Wstapil do stadka", '<--- NAJMLODSZY STAZEM W BANDZIE '||nb " "
    from (
        select b.nazwa nb,b.nr_bandy nrb,max(w_stadku_od) najm
            from bandy b
            join Kocury k on k.nr_bandy=b.nr_bandy
            group by b.nazwa,b.nr_bandy
        )
    join kocury k on k.w_stadku_od = najm and nrb=k.nr_bandy
union all
select k.imie,k.w_stadku_od "Wstapil do stadka", '<--- NAJSTARSZY STAZEM W BANDZIE '||nb " "
    from (
        select b.nazwa nb,b.nr_bandy nrb,min(w_stadku_od) najs
            from bandy b
            join Kocury k on k.nr_bandy=b.nr_bandy
            group by b.nazwa,b.nr_bandy
        )
    join kocury k on k.w_stadku_od = najs and nrb=k.nr_bandy
union all
select k.imie,k.w_stadku_od "Wstapil do stadka", ' ' " "
    from (
        select b.nazwa nb,b.nr_bandy nrb,min(w_stadku_od) najs, max(w_stadku_od) najm
            from bandy b
            join Kocury k on k.nr_bandy=b.nr_bandy
            group by b.nazwa,b.nr_bandy
        )
    join kocury k on k.w_stadku_od not in (najm,najs) and nrb=k.nr_bandy
order by 1;

-- Zadanie 31 giiit
CREATE OR REPLACE VIEW zad31(nazwa_bandy,sre_spoz,max_spoz,min_spoz,koty,koty_z_dod)
AS
    select b.nazwa,avg(nvl(przydzial_myszy,0)),max(nvl(przydzial_myszy,0)),min(nvl(przydzial_myszy,0)),count(pseudo),count(myszy_extra) 
    from kocury k
    join bandy b on b.nr_bandy=k.nr_bandy
    group by b.nazwa;


select * from zad31;

select k1.pseudo,k1.imie,k1.funkcja,nvl(k1.przydzial_myszy,0) zjada, 'od '||min_spoz||' do '||max_spoz "granice spozycia", k1.w_stadku_od "lowi od"
    from kocury k1 
    join bandy b on k1.nr_bandy=b.nr_bandy
    join zad31 on b.nazwa=nazwa_bandy
    where k1.pseudo='PLACEK';
    
    
-- Zadanie 32 giiit

CREATE OR REPLACE VIEW zad32(pseudo, plec, przydzial_myszy, myszy_extra, nr_bandy)
AS
select pseudo,plec,przydzial_myszy,myszy_extra,nr_bandy
    from kocury
    where pseudo in ( select * from (select pseudo from kocury natural join bandy where nazwa='CZARNI RYCERZE' order by w_stadku_od) where rownum<4)
    or pseudo in  ( select * from (select pseudo from kocury natural join bandy where nazwa='LACIACI MYSLIWI' order by w_stadku_od) where rownum<4);

select pseudo,plec,nvl(przydzial_myszy,0) "przyd. myszy przed",nvl(myszy_extra,0) "extr. myszy przed" from zad32;


update zad32
set 
    przydzial_myszy=przydzial_myszy + case plec when 'M' then 10 else 0.10*(select min(przydzial_myszy) from kocury) end,
    myszy_extra = nvl(myszy_extra,0)+ 0.15*(select avg(nvl(myszy_extra,0)) from kocury natural join bandy where nr_bandy=zad32.nr_bandy);

select pseudo,plec,nvl(przydzial_myszy,0) "przyd. myszy po",nvl(myszy_extra,0) "extr. myszy po" from zad32;

rollback;


-- Zadanie 33

select *
from
(
    select 
      case plec when 'D' then nazwa else ' ' end "nazwa bandy",
      case plec when 'D' then 'Kotka' else 'Kocur' end plec,
      TO_CHAR(COUNT(pseudo)) "ILE",
      TO_CHAR(sum(decode(funkcja,'SZEFUNIO',przydzial_myszy+nvl(myszy_extra,0) ,0) )) "SZEFUNIO",
      TO_CHAR(sum(decode(funkcja,'BANDZIOR',przydzial_myszy+nvl(myszy_extra,0) ,0) )) "BANDZIOR",
      TO_CHAR(sum(decode(funkcja,'LOWCZY',przydzial_myszy+nvl(myszy_extra,0) ,0) )) "LOWCZY",  
      TO_CHAR(sum(decode(funkcja,'LAPACZ',przydzial_myszy+nvl(myszy_extra,0) ,0) )) "LAPACZ",  
      TO_CHAR(sum(decode(funkcja,'KOT',przydzial_myszy+nvl(myszy_extra,0) ,0) )) "KOT", 
      TO_CHAR(sum(decode(funkcja,'MILUSIA',przydzial_myszy+nvl(myszy_extra,0) ,0) )) "MILUSIA", 
      TO_CHAR(sum(decode(funkcja,'DZIELCZY',przydzial_myszy+nvl(myszy_extra,0) ,0) )) "DZIELCZY", 
      TO_CHAR(sum(przydzial_myszy+nvl(myszy_extra,0))) "SUMA" 
    from Kocury k
    join Bandy b on k.nr_bandy = b.nr_bandy
    group by nazwa, plec, k.nr_bandy
    order by nazwa
)
union all
select 'Z--------------', '------', '--------', '---------', '---------', '--------', '--------', '--------', '--------', '--------', '--------' from DUAL
union all
select 
'ZJADA RAZEM',
        ' ',
        ' ',
        TO_CHAR(sum(decode(funkcja,'SZEFUNIO',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) szefunio,
        TO_CHAR(sum(decode(funkcja,'BANDZIOR',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) bandzior,
        TO_CHAR(sum(decode(funkcja,'LOWCZY',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) lowczy,
        TO_CHAR(sum(decode(funkcja,'LAPACZ',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) lapacz,
        TO_CHAR(sum(decode(funkcja,'KOT',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) kot ,
        TO_CHAR(sum(decode(funkcja,'MILUSIA',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) milusia,
        TO_CHAR(sum(decode(funkcja,'DZIELCZY',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) dzielczy,
        TO_CHAR(sum(przydzial_myszy + nvl(myszy_extra, 0))) suma
from kocury;
-- b
select *
from
(
  select case plec_wiersz when 'D' then nazwa else ' ' end "nazwa bandy",
    case plec when 'D' then 'Kotka' else 'Kocur' end plec,
    to_char(ile) "ile",
    TO_CHAR(NVL(szef, 0)) szefunio,
    TO_CHAR(NVL(b,0)) bandzior,
    TO_CHAR(NVL(low,0)) lowczy,
    TO_CHAR(NVL(lap,0)) lapacz,
    TO_CHAR(NVL(kot,0)) kot,
    TO_CHAR(NVL(mil,0)) milusia,
    TO_CHAR(NVL(dziel,0)) dzielczy,
    TO_CHAR(NVL(suma,0)) suma
  from
  (
    select nazwa nazwa_wiersz, plec plec_wiersz, funkcja, przydzial_myszy + nvl(myszy_extra, 0) liczba_myszy from Kocury natural join bandy
  )
  pivot (
      sum(liczba_myszy) 
      for funkcja in ('SZEFUNIO' szef, 'BANDZIOR' b, 'LOWCZY' low, 'LAPACZ' lap,'KOT' kot, 'MILUSIA' mil, 'DZIELCZY' dziel)
        )  
  join 
  (
    select nazwa nazwa, plec, count(pseudo) ile, sum(przydzial_myszy + nvl(myszy_extra, 0)) suma
    from Kocury natural join bandy
    group by nazwa, plec
    order by nazwa
  ) on nazwa = nazwa_wiersz and plec = plec_wiersz
)
union all
select 'Z--------------', '------', '--------', '---------', '---------', '--------', '--------', '--------', '--------', '--------', '--------' from DUAL
union all
select 
'ZJADA RAZEM',
        ' ',
        ' ',
        TO_CHAR(sum(decode(funkcja,'SZEFUNIO',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) szefunio,
        TO_CHAR(sum(decode(funkcja,'BANDZIOR',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) bandzior,
        TO_CHAR(sum(decode(funkcja,'LOWCZY',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) lowczy,
        TO_CHAR(sum(decode(funkcja,'LAPACZ',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) lapacz,
        TO_CHAR(sum(decode(funkcja,'KOT',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) kot ,
        TO_CHAR(sum(decode(funkcja,'MILUSIA',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) milusia,
        TO_CHAR(sum(decode(funkcja,'DZIELCZY',przydzial_myszy + nvl(myszy_extra, 0),0) ) ) dzielczy,
        TO_CHAR(sum(przydzial_myszy + nvl(myszy_extra, 0))) suma
from kocury;

-- Zadanie 34
DECLARE
  func Kocury.funkcja%TYPE:='BANDZIOR';
BEGIN
  SELECT funkcja INTO func FROM Kocury WHERE funkcja = func GROUP BY funkcja;
  DBMS_OUTPUT.PUT_LINE(func);
EXCEPTION
    when NO_DATA_FOUND then DBMS_OUTPUT.PUT_LINE('BRAK TAKIEGO KOTA');
    when others then DBMS_OUTPUT.PUT_LINE('Blad');
END;
-- Zadanie 35
DECLARE
  kocur Kocury%ROWTYPE;
  nf BOOLEAN:= TRUE;
BEGIN
  SELECT * INTO kocur FROM Kocury WHERE pseudo = 'TYGRYS';

  IF (kocur.przydzial_myszy + NVL(kocur.myszy_extra, 0)) * 12 > 700 THEN
    nf := FALSE;
    DBMS_OUTPUT.PUT_LINE(kocur.imie || ' calkowity roczny przydzial myszy  > 700');
  END IF;

  IF kocur.imie LIKE '%A%' THEN
    nf := FALSE;
    DBMS_OUTPUT.PUT_LINE(kocur.imie || ' imie zawiera litere A');
  END IF;

  IF EXTRACT(MONTH FROM kocur.w_stadku_od) = 1 THEN
    nf := FALSE;
    DBMS_OUTPUT.PUT_LINE(kocur.imie || ' styczen jest miesiacem przystapienia do stada');
  END IF;

  IF nf THEN
    DBMS_OUTPUT.PUT_LINE(kocur.imie || ' nie odpowiada kryteriom');
  END IF;
EXCEPTION
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE('BRAK TAKIEGO KOTA');
END;
-- Zadanie 36

DECLARE
  CURSOR kocuryC IS 
  SELECT * FROM Kocury ORDER BY przydzial_myszy FOR UPDATE OF przydzial_myszy ;
  
  kocur kocuryC%ROWTYPE;
  suma_przydzialow NUMBER;
  zmienionych_kotow NUMBER:=0;
  licznik NUMBER:=0;
  max_funkcji NUMBER;
  po_dodaniu NUMBER;
  
BEGIN
  SELECT SUM(przydzial_myszy) INTO suma_przydzialow FROM Kocury;
  
  LOOP
    EXIT WHEN suma_przydzialow > 1050;
    OPEN kocuryC;
    LOOP
      FETCH kocuryC INTO kocur;
      EXIT WHEN kocuryC%NOTFOUND;
      EXIT WHEN suma_przydzialow > 1050;
      SELECT max_myszy INTO max_funkcji FROM Funkcje WHERE funkcja = kocur.funkcja;
      
      IF kocur.przydzial_myszy=max_funkcji THEN CONTINUE; END IF;
      
      po_dodaniu := round(kocur.przydzial_myszy * 1.1);

      IF po_dodaniu > max_funkcji THEN
        po_dodaniu := max_funkcji;
      END IF;
      
      suma_przydzialow:=suma_przydzialow + (po_dodaniu-kocur.przydzial_myszy);
      
      zmienionych_kotow:=zmienionych_kotow+1;
      
      UPDATE Kocury
      SET przydzial_myszy = po_dodaniu
      WHERE CURRENT OF kocuryC;
    END LOOP;

    CLOSE kocuryC;
  END LOOP;
   DBMS_OUTPUT.PUT_LINE('Calk. przydzial w stadku '||suma_przydzialow||' Zmian '||zmienionych_kotow);
EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

-- Zadanie 37
DECLARE 
 CURSOR koty is select pseudo, nvl(myszy_extra,0)+przydzial_myszy calkowity from Kocury order by 2 DESC;
 kot koty%ROWTYPE;
BEGIN
 open koty;
 DBMS_OUTPUT.PUT_LINE('Nr  Psedonim   Zjada');
 DBMS_OUTPUT.PUT_LINE('---------------------');
 FOR i IN 1..5 LOOP
 fetch koty into kot;
 
 DBMS_OUTPUT.PUT_LINE(i ||'    '|| RPAD(kot.pseudo,7) ||'     '|| kot.calkowity);
 END LOOP;
 close koty;
EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);
 
END;

-- Zadanie 38
DECLARE
    liczba_przelozonych NUMBER :=2;
    max_przelozonych NUMBER;
    CURSOR koty
    IS
    SELECT imie, pseudo, szef 
    FROM Kocury 
    WHERE funkcja IN ('KOT', 'MILUSIA');
    
BEGIN
    SELECT MAX(LEVEL) - 1
    INTO max_przelozonych
    FROM Kocury
    CONNECT BY PRIOR szef = pseudo
    START WITH funkcja IN ('KOT', 'MILUSIA');
    
    liczba_przelozonych := LEAST(max_przelozonych, liczba_przelozonych);

    DBMS_OUTPUT.PUT(RPAD('Imie', 15));
    
    FOR i IN 1..liczba_przelozonych LOOP
        DBMS_OUTPUT.PUT(RPAD('|  Szef ' || i, 18));
    END LOOP;
    
    DBMS_OUTPUT.NEW_LINE;
    DBMS_OUTPUT.PUT(RPAD('-', 13, '-'));
    
    FOR i IN 1..liczba_przelozonych LOOP
        DBMS_OUTPUT.PUT(' --- '||RPAD('-', 13, '-'));
    END LOOP;
    
    DBMS_OUTPUT.NEW_LINE;
    
    FOR kot IN koty 
    LOOP
        DBMS_OUTPUT.PUT(RPAD(kot.imie, 15));
        FOR i IN 1..liczba_przelozonych 
        LOOP
            IF kot.szef IS NULL THEN 
                DBMS_OUTPUT.PUT(RPAD('|', 18));   
            ELSE 
                SELECT imie, pseudo, szef INTO kot FROM Kocury WHERE kot.szef = pseudo;
                DBMS_OUTPUT.PUT(RPAD('|  ' || kot.imie, 18)); 
            END IF;
        END LOOP;
        DBMS_OUTPUT.NEW_LINE;
    END LOOP;
END;
-- Zadanie 39
DECLARE
  CURSOR bandyC IS SELECT * FROM Bandy;
  banda bandy%ROWTYPE;

  nr bandy.nr_bandy%TYPE;
  nazwa_bandy bandy.nazwa%TYPE;
  teren_bandy bandy.teren%TYPE;

    banda_nr_exc EXCEPTION;
    banda_exists EXCEPTION;
    nazwa_exists EXCEPTION;
    teren_exists EXCEPTION;
BEGIN
  nr := 10;
  nazwa_bandy := 'KAMILSI';
  teren_bandy := 'POLE';

  IF nr <= 0 THEN
    RAISE banda_nr_exc;
  END IF;

  OPEN bandyC;

  LOOP
    FETCH bandyC INTO banda;
    EXIT WHEN bandyC%NOTFOUND;

    IF nr = banda.nr_bandy THEN
      RAISE banda_exists;
    END IF;
    IF nazwa_bandy = banda.nazwa THEN
      RAISE nazwa_exists;
    END IF;
    IF teren_bandy = banda.teren THEN
      RAISE teren_exists;
    END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('poprawnie dodano bande nr'||nr);
  INSERT INTO Bandy VALUES (nr, nazwa_bandy, teren_bandy, NULL);

  EXCEPTION
  WHEN banda_exists THEN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(nr) || ' już istnieje');
  WHEN nazwa_exists THEN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(nazwa_bandy) || ' już istnieje');
  WHEN teren_exists THEN
  DBMS_OUTPUT.PUT_LINE(TO_CHAR(teren_bandy) || ' już istnieje');
  WHEN banda_nr_exc THEN
  DBMS_OUTPUT.PUT_LINE('Numer bandy nie może być <= 0');
  WHEN OTHERS THEN
  DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

-- Zadanie 40 w zadaniu 44


--  Zadanie 41

CREATE OR REPLACE TRIGGER wiekszy_od_ostatniej BEFORE INSERT ON BANDY FOR EACH ROW
DECLARE 
 max_nr_bandy Bandy.nr_bandy%TYPE;
 banda_nr_exc EXCEPTION;
BEGIN
    select MAX(nr_bandy) into max_nr_bandy from Bandy;
    IF max_nr_bandy+1 <> :NEW.NR_BANDY then :NEW.NR_BANDY:=max_nr_bandy+1;RAISE banda_nr_exc; end if;
    
EXCEPTION
 when banda_nr_exc then DBMS_OUTPUT.PUT_LINE('Nowy nr bandy musi byc wiekszy dokladnie o 1 od najwiekszego. Dlatego nr zostal zamieniony na '||:NEW.NR_BANDY);
 when OTHERS then DBMS_OUTPUT.PUT_LINE(SQLERRM);
END wiekszy_od_ostatniej;
    
 -- Zadanie 42

-- a

CREATE OR REPLACE PACKAGE wirus IS
    kara NUMBER := 0;
    nagroda NUMBER := 0;
    przydzial_tygrysa KOCURY.PRZYDZIAL_MYSZY%TYPE;
END wirus;

CREATE OR REPLACE TRIGGER zmiana_przydzialu_myszy_tygrysa before update of przydzial_myszy on kocury
declare
begin
 select przydzial_myszy into wirus.przydzial_tygrysa from kocury where pseudo = 'TYGRYS';
end zmiana_przydzialu_myszy;


CREATE OR REPLACE TRIGGER zmiany_przydzialow
    BEFORE UPDATE OF PRZYDZIAL_MYSZY
    ON KOCURY
    FOR EACH ROW
DECLARE
BEGIN
    IF :NEW.funkcja = 'MILUSIA' THEN
        IF :NEW.przydzial_myszy <= :OLD.przydzial_myszy THEN
            DBMS_OUTPUT.PUT_LINE('brak zmiany');
            :NEW.PRZYDZIAL_MYSZY := :OLD.PRZYDZIAL_MYSZY;
        ELSIF :NEW.przydzial_myszy - :OLD.przydzial_myszy < 0.1 * wirus.przydzial_tygrysa THEN
            DBMS_OUTPUT.PUT_LINE('podwyzka mniejsza niz 10% Tygrysa');
            :NEW.przydzial_myszy := :NEW.przydzial_myszy + ROUND(0.1 * wirus.przydzial_tygrysa);
            :NEW.myszy_extra := NVL(:NEW.myszy_extra, 0) + 5;
            wirus.kara := wirus.kara + CEIL(0.1 * wirus.przydzial_tygrysa);
        ELSE
            wirus.nagroda := wirus.nagroda + 5;
        END IF;
    END IF;
END zmiany_przydzialow;


CREATE OR REPLACE TRIGGER po_zmianie
    AFTER UPDATE OF PRZYDZIAL_MYSZY
    ON KOCURY
DECLARE
    przydzial KOCURY.PRZYDZIAL_MYSZY%TYPE;
    ekstra    KOCURY.MYSZY_EXTRA%TYPE;
BEGIN
    SELECT PRZYDZIAL_MYSZY, MYSZY_EXTRA
    INTO przydzial, ekstra
    FROM KOCURY
    WHERE pseudo = 'TYGRYS';
    
    przydzial := przydzial - wirus.kara;
    ekstra := ekstra + wirus.nagroda;
    
    IF wirus.kara <> 0 OR wirus.nagroda <> 0 THEN
        wirus.kara := 0;
        wirus.nagroda := 0;
        UPDATE KOCURY
        SET PRZYDZIAL_MYSZY = przydzial,
            MYSZY_EXTRA     = ekstra
        WHERE pseudo = 'TYGRYS';
    END IF;
END;

--b

create or replace trigger zmiana_przydzialow 
for update on Kocury 
compound trigger

    kara NUMBER := 0;
    nagroda NUMBER := 0;
    przydzial_tygrysa KOCURY.PRZYDZIAL_MYSZY%TYPE;
    ekstra KOCURY.MYSZY_EXTRA%TYPE;
    
before statement is 
begin
 select przydzial_myszy into przydzial_tygrysa from kocury where pseudo = 'TYGRYS';
end before statement;

before each row is
begin
    IF :NEW.funkcja = 'MILUSIA' THEN
        IF :NEW.przydzial_myszy <= :OLD.przydzial_myszy THEN
            DBMS_OUTPUT.PUT_LINE('brak zmiany');
            :NEW.PRZYDZIAL_MYSZY := :OLD.PRZYDZIAL_MYSZY;
        ELSIF :NEW.przydzial_myszy - :OLD.przydzial_myszy < 0.1 * przydzial_tygrysa THEN
            DBMS_OUTPUT.PUT_LINE('podwyzka mniejsza niz 10% Tygrysa');
            :NEW.przydzial_myszy := :NEW.przydzial_myszy + ROUND(0.1 * przydzial_tygrysa);
            :NEW.myszy_extra := NVL(:NEW.myszy_extra, 0) + 5;
            kara := kara + CEIL(0.1 * przydzial_tygrysa);
        ELSE
            nagroda := nagroda + 5;
        END IF;
    END IF;
end before each row;


after statement is
begin
    SELECT MYSZY_EXTRA
    INTO  ekstra
    FROM KOCURY
    WHERE pseudo = 'TYGRYS';
    
    przydzial_tygrysa := przydzial_tygrysa - kara;
    ekstra := ekstra + nagroda;
    
    IF kara <> 0 OR nagroda <> 0 THEN
        kara := 0;
        nagroda := 0;
        UPDATE KOCURY
        SET PRZYDZIAL_MYSZY = przydzial_tygrysa,
            MYSZY_EXTRA     = ekstra
        WHERE pseudo = 'TYGRYS';
    END IF;

end after statement;
end zmiana_przydzialow;

-- Zadanie 43
create or replace procedure zadanie43
AS

 CURSOR funkcjeC is select funkcja from funkcje natural join Kocury group by funkcja order by 1;
 CURSOR myszyFunkcje is select funkcja,to_char(sum(przydzial_myszy+nvl(myszy_extra,0))) suma from kocury group by funkcja 
                            union all 
                            select ' ',to_char(sum(przydzial_myszy+nvl(myszy_extra,0))) from kocury  order by 1 DESC ;
 CURSOR funkcjeBandy is select nazwa,funkcja,plec,SUM(przydzial_myszy+nvl(myszy_extra,0)) myszyWBandzie 
                        from Kocury K 
                        natural join bandy B 
                        group by B.nazwa,K.funkcja,plec 
                        order by 1,2,3 DESC;
 CURSOR informacjeBandy is select count(*) ilosc, SUM(NVL(PRZYDZIAL_MYSZY, 0) + NVL(MYSZY_EXTRA, 0)) sumaMyszy,Bandy.nazwa nazwa, plec 
                        from Kocury, Bandy where Kocury.nr_bandy = Bandy.nr_bandy
                        group by Bandy.nazwa, Kocury.plec
                        order by Bandy.nazwa, plec DESC;
    
 fwb funkcjeBandy%ROWTYPE;
 suma myszyFunkcje%ROWTYPE;
 
BEGIN
 DBMS_OUTPUT.PUT(RPAD('NAZWA BANDY',15) || LPAD('PLEC',10)|| LPAD('ILE',10));
 
 for fun in funkcjeC loop
 DBMS_OUTPUT.PUT(LPAD(fun.funkcja,10));
 end loop;
 DBMS_OUTPUT.PUT(LPAD('SUMA',12));
 DBMS_OUTPUT.NEW_LINE;
 
 open funkcjeBandy;
 fetch funkcjeBandy into fwb;
 for bandy in informacjeBandy loop
    
    if bandy.plec='M' then 
    DBMS_OUTPUT.PUT(RPAD(bandy.nazwa,15));
    DBMS_OUTPUT.PUT(LPAD('KOCUR',10)); 
    else DBMS_OUTPUT.PUT(RPAD(' ',15)); 
    DBMS_OUTPUT.PUT(LPAD('KOTKA',10)) ; 
    end if;
    DBMS_OUTPUT.PUT(LPAD(to_char(bandy.ilosc),8));   
    

    for funkcje in funkcjeC loop
        if fwb.nazwa = bandy.nazwa and fwb.plec=bandy.plec and funkcje.funkcja=fwb.funkcja then 
            DBMS_OUTPUT.PUT(LPAD(to_char(fwb.myszyWBandzie),10)); 
            fetch funkcjeBandy into fwb;
        else  
            DBMS_OUTPUT.PUT(LPAD(' 0',10)); 
        end if;
    end loop;
    DBMS_OUTPUT.PUT(LPAD(bandy.sumaMyszy,15));
    DBMS_OUTPUT.NEW_LINE;
 end loop;
 close funkcjeBandy;
 
 DBMS_OUTPUT.PUT(RPAD('Z-',115,'-'));
 DBMS_OUTPUT.NEW_LINE;
 DBMS_OUTPUT.PUT(LPAD(' ',35));
 
 for funkcje in myszyFunkcje loop
    DBMS_OUTPUT.PUT(LPAD(funkcje.suma,12));
 end loop;
 
 DBMS_OUTPUT.NEW_LINE;

END zadanie43;

execute zadanie43;
-- Zadanie 44


CREATE OR REPLACE PACKAGE dodaj_i_opodatkuj 
AS
    PROCEDURE dodaj_nowa_bande(nr Bandy.nr_bandy%TYPE, nazwa_bandy Bandy.nazwa%TYPE, teren_bandy bandy.teren%TYPE);
    FUNCTION oblicz_podatek(pseudonim Kocury.pseudo%TYPE) RETURN NUMBER;
END dodaj_i_opodatkuj;

CREATE OR REPLACE PACKAGE BODY dodaj_i_opodatkuj 
AS
    PROCEDURE dodaj_nowa_bande(nr Bandy.nr_bandy%TYPE, nazwa_bandy Bandy.nazwa%TYPE, teren_bandy bandy.teren%TYPE) AS
      CURSOR bandyC IS SELECT * FROM Bandy;
      banda bandy%ROWTYPE;
    
        banda_nr_exc EXCEPTION;
        banda_exists EXCEPTION;
        nazwa_exists EXCEPTION;
        teren_exists EXCEPTION;
    BEGIN
    
      IF nr <= 0 THEN
        RAISE banda_nr_exc;
      END IF;
    
      OPEN bandyC;
    
      LOOP
        FETCH bandyC INTO banda;
        EXIT WHEN bandyC%NOTFOUND;
    
        IF nr = banda.nr_bandy THEN
          RAISE banda_exists;
        END IF;
        IF nazwa_bandy = banda.nazwa THEN
          RAISE nazwa_exists;
        END IF;
        IF teren_bandy = banda.teren THEN
          RAISE teren_exists;
        END IF;
      END LOOP;
      
      INSERT INTO Bandy VALUES (nr, nazwa_bandy, teren_bandy, NULL);
      DBMS_OUTPUT.PUT_LINE('poprawnie dodano bande');
      
      EXCEPTION
      WHEN banda_exists THEN
      DBMS_OUTPUT.PUT_LINE(TO_CHAR(nr) || ' już istnieje');
      WHEN nazwa_exists THEN
      DBMS_OUTPUT.PUT_LINE(TO_CHAR(nazwa_bandy) || ' już istnieje');
      WHEN teren_exists THEN
      DBMS_OUTPUT.PUT_LINE(TO_CHAR(teren_bandy) || ' już istnieje');
      WHEN banda_nr_exc THEN
      DBMS_OUTPUT.PUT_LINE('Numer bandy nie może być <= 0');
      WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE(SQLERRM);
    END dodaj_nowa_bande;    
    
    FUNCTION oblicz_podatek(pseudonim Kocury.pseudo%TYPE) RETURN NUMBER 
    IS
        podatek NUMBER;
        podwladni NUMBER;
        wrogowie NUMBER; 
    BEGIN 
        SELECT CEIL(0.05 * (NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0))) 
        INTO podatek 
        FROM Kocury 
        WHERE pseudo = pseudonim;
        
        SELECT COUNT(*) INTO podwladni FROM Kocury WHERE szef = pseudonim;
        SELECT COUNT(*) INTO wrogowie FROM Wrogowie_Kocurow WHERE pseudo = pseudonim;
        
        IF podwladni = 0 THEN 
            podatek := podatek + 2; 
        END IF;
        
        IF wrogowie = 0 THEN 
            podatek := podatek + 1;
        END IF;
        
        IF podwladni > 3 AND pseudonim != 'TYGRYS' THEN 
            podatek := podatek + 1; 
        END IF;
        
        RETURN podatek;
        
    END oblicz_podatek;
END dodaj_i_opodatkuj;


BEGIN
        FOR kot IN (SELECT pseudo FROM Kocury)
        LOOP
            DBMS_OUTPUT.PUT_LINE(RPAD(kot.pseudo, 8) || ' podatek: ' || dodaj_i_opodatkuj.oblicz_podatek(kot.pseudo));
        END LOOP;
END;

-- Zadanie 45
CREATE TABLE Dodatki_extra(
    pseudo VARCHAR2(15) CONSTRAINT dodatki_pseudo_fk REFERENCES Kocury(pseudo),
    dod_extra NUMBER(3) DEFAULT 0    
);

CREATE OR REPLACE TRIGGER zad45
    BEFORE UPDATE OF PRZYDZIAL_MYSZY
    ON KOCURY
    FOR EACH ROW
    WHEN (LOGIN_USER <> 'TYGRYS' AND :NEW.PRZYDZIAL_MYSZY > :OLD.PRZYDZIAL_MYSZY AND :NEW.FUNKCJA = 'MILUSIA')
DECLARE
    CURSOR milusie IS SELECT PSEUDO
                FROM KOCURY
                WHERE funkcja = 'MILUSIA';
    ILE NUMBER;
    POLECENIE VARCHAR2(1000);
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
    FOR milusia IN milusie
        LOOP
            SELECT COUNT(*) INTO ILE FROM DODATKI_EXTRA WHERE pseudo = milusia.pseudo;
            IF ILE > 0 THEN
                POLECENIE:='UPDATE DODATKI_EXTRA SET dod_extra = dod_extra - 10 WHERE :mil_ps = pseudo';
            ELSE 
                POLECENIE:='INSERT INTO DODATKI_EXTRA (PSEUDO, DOD_EXTRA) VALUES (:mil_ps, -10)';
            END IF;
            EXECUTE IMMEDIATE POLECENIE USING milusia.pseudo;
        END LOOP;
        COMMIT;
    END IF;
END;

-- Zadanie 46
CREATE TABLE Wykroczenia 
(
    kto VARCHAR2(15) NOT NULL, 
    kiedy DATE NOT NULL,
    jakiemu VARCHAR2(15) NOT NULL,
    operacja VARCHAR2(15) NOT NULL
);

CREATE OR REPLACE TRIGGER trg_monitor_wykroczenia
    BEFORE INSERT OR UPDATE OF PRZYDZIAL_MYSZY
    ON KOCURY
    FOR EACH ROW
DECLARE
    min_mysz FUNKCJE.MIN_MYSZY%TYPE;
    max_mysz FUNKCJE.MAX_MYSZY%TYPE;
    curr_data DATE DEFAULT SYSDATE;
    zdarzenie VARCHAR2(20):= 'UPDATE';

BEGIN
    SELECT MIN_MYSZY, MAX_MYSZY INTO min_mysz, max_mysz FROM FUNKCJE WHERE FUNKCJA = :NEW.FUNKCJA;
    
    IF max_mysz < :NEW.PRZYDZIAL_MYSZY OR min_mysz > :NEW.PRZYDZIAL_MYSZY THEN
        IF INSERTING THEN 
            zdarzenie := 'INSERT';
        END IF;
        
        INSERT INTO Wykroczenia(kto, kiedy, jakiemu, operacja) VALUES ('SYS.LOGIN_USER', curr_data, :NEW.PSEUDO, zdarzenie);

        RAISE_APPLICATION_ERROR(-20001,'Przydzial myszy jest poza zakresem przydzialu funkcji kota, nie wykonano zmian.');
    END IF;
END;
SELECT * FROM KOCURY WHERE PSEUDO = 'DAMA';
SELECT * FROM WYKROCZENIA;
UPDATE KOCURY SET PRZYDZIAL_MYSZY = 2 WHERE PSEUDO = 'DAMA';
SELECT * FROM KOCURY WHERE PSEUDO = 'DAMA';
SELECT * FROM WYKROCZENIA
ROLLBACK;
SELECT * FROM KOCURY WHERE PSEUDO = 'DAMA';
SELECT * FROM WYKROCZENIA;