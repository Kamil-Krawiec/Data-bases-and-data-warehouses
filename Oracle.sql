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


-- Zadanie 19


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
select funkcja,avmaxv2 "Srednio najw. i najm. myszy"
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
        select funkcja, AVG(nvl(k2.przydzial_myszy,0)+nvl(k2.myszy_extra,0)) avminv2, AVG(nvl(k2.przydzial_myszy,0)+nvl(k2.myszy_extra,0)) avmaxv2
            from kocury k2
            group by funkcja 
            ) 
    on  avminv2=avmin or avmaxv2=avmax;
            
    
-- Zadanie 27
-- a
select k1.pseudo, nvl(k1.przydzial_myszy,0)+nvl(k1.myszy_extra,0) Zjada
    from kocury k1
    where 
        (
        select Count(nvl(k2.przydzial_myszy,0)+nvl(k2.myszy_extra,0)) calosc
        from kocury k2 
        where nvl(k2.przydzial_myszy,0)+nvl(k2.myszy_extra,0) > nvl(k1.przydzial_myszy,0)+nvl(k1.myszy_extra,0)
        )<6
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
                ) where ROWNUM <7
            )
            
    
-- c
    
select k1.pseudo, MAX(nvl(k1.przydzial_myszy,0)+nvl(k1.myszy_extra,0)) zjada
    from kocury k1
    left join kocury k2 on nvl(k1.przydzial_myszy,0)+nvl(k1.myszy_extra,0) < nvl(k2.przydzial_myszy,0)+nvl(k2.myszy_extra,0)
    group by k1.pseudo
    having count(k2.pseudo)<6
    order by 2 DESC;
    
-- d

select pseudo, zjada
    from (select pseudo, nvl(przydzial_myszy,0)+nvl(myszy_extra,0) zjada,
        rank()
        over(order by nvl(przydzial_myszy,0)+nvl(myszy_extra,0) DESC) miejsce
        from kocury)
    where miejsce <=6;
    

-- zadanie 28 
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
    
    
    


