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

- usuwanie

ALTER SESSION SET NLS_DATE_FORMAT = "YYYY-MM-DD";

delete from wykroczenia;
drop table wykroczenia;

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


DROP TABLE KocuryT CASCADE CONSTRAINTS;
DROP TABLE PlebsT CASCADE CONSTRAINTS;
DROP TABLE ElitaT CASCADE CONSTRAINTS;
DROP TABLE KontoT CASCADE CONSTRAINTS;
DROP TABLE IncydentyT CASCADE CONSTRAINTS;
DROP TYPE BODY KocuryO ;
DROP TYPE KocuryO FORCE;
DROP TYPE BODY ElitaO;
DROP TYPE ElitaO FORCE;
DROP TYPE BODY PlebsO;
DROP TYPE PlebsO FORCE;
DROP TYPE BODY KontoO;
DROP TYPE KontoO FORCE;
DROP TYPE BODY IncydentO;
DROP TYPE IncydentO FORCE;
DROP TYPE BODY IncydentO;
DROP TYPE IncydentO FORCE;
--Tworzenie tabeli

set serveroutput on;
-- Zadanie 47

-- KOCURY
CREATE OR REPLACE TYPE KocuryO AS OBJECT
(
    imie            VARCHAR2(15),
    plec            VARCHAR2(1),
    pseudo          VARCHAR2(15),
    funkcja         VARCHAR2(10),
    w_stadku_od     DATE,
    przydzial_myszy NUMBER(3),
    myszy_extra     NUMBER(3),
    nr_bandy        NUMBER(2),
    szef            REF KocuryO,
    MEMBER FUNCTION caly_przydzial RETURN NUMBER,
    MAP MEMBER FUNCTION info RETURN VARCHAR2
);




CREATE OR REPLACE TYPE BODY KocuryO
AS
    MEMBER FUNCTION caly_przydzial RETURN NUMBER IS
    BEGIN
        RETURN NVL(przydzial_myszy, 0) + NVL(myszy_extra, 0);
    END;
    MAP MEMBER FUNCTION info RETURN VARCHAR2 IS
    BEGIN
        RETURN imie || ', ' || plec ||', pseudo:' || pseudo || ' funkcja: '|| funkcja ||', zjada:'|| SELF.CALY_PRZYDZIAL();
    END;
END;

CREATE TABLE KocuryT OF KocuryO (
  imie CONSTRAINT kocuryo_imie_nn NOT NULL,
  plec CONSTRAINT kocuryo_plec_ch CHECK(plec IN ('M', 'D')),
  pseudo CONSTRAINT kocuryo_pseudo_pk PRIMARY KEY,
  funkcja CONSTRAINT ko_f_fk REFERENCES Funkcje(funkcja),
  szef SCOPE IS KocuryT,
  w_stadku_od DEFAULT SYSDATE,
  nr_bandy CONSTRAINT ko_nr_fk REFERENCES Bandy(nr_bandy)
);

-- PLEBS
CREATE OR REPLACE TYPE PlebsO AS OBJECT
(
    pseudo   VARCHAR2(15),
    kot       REF KocuryO,
    MEMBER FUNCTION get_details RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY PlebsO
AS
    MEMBER FUNCTION get_details RETURN VARCHAR2
        IS
        details VARCHAR2(400);
    BEGIN
        SELECT 'IMIE: ' || DEREF(kot).imie || ' PSEUDO ' || DEREF(kot).pseudo INTO details FROM dual;
        RETURN details;
    END;
END;

CREATE TABLE PlebsT OF PlebsO(
    kot SCOPE IS KocuryT CONSTRAINT plebso_kot_nn NOT NULL,
    CONSTRAINT plebso_fk FOREIGN KEY (pseudo) REFERENCES KocuryT(pseudo),
    CONSTRAINT plebso_pk PRIMARY KEY (pseudo));

-- ELITA

CREATE OR REPLACE TYPE ElitaO AS OBJECT
(
    pseudo VARCHAR2(15),
    kot      REF KocuryO,
    slugus   REF PlebsO,
    MEMBER FUNCTION get_sluga RETURN REF PlebsO
);

CREATE OR REPLACE TYPE BODY ElitaO AS
  MEMBER FUNCTION get_sluga RETURN REF PlebsO IS
    BEGIN
      RETURN slugus;
    END;
END;

CREATE TABLE ElitaT OF ElitaO(
    pseudo CONSTRAINT elitao_pseudo_pk PRIMARY KEY,
    kot SCOPE IS KocuryT CONSTRAINT elitao_kot_nn NOT NULL,
    slugus SCOPE IS PlebsT
);

-- ELITA KONTO

CREATE OR REPLACE TYPE KontoO AS OBJECT
(
    nr_myszy NUMBER(5),
    data_wprowadzenia DATE,
    data_usuniecia DATE,
    kot REF ElitaO,
    MEMBER PROCEDURE wyprowadz_mysz(dat DATE),
    MAP MEMBER FUNCTION GET_INFO RETURN VARCHAR2
);

CREATE OR REPLACE TYPE BODY KontoO AS
MAP MEMBER FUNCTION GET_INFO RETURN VARCHAR2 IS
    wl ElitaO;
    kocur KocuryO;
    BEGIN
        SELECT DEREF(kot) INTO wl FROM DUAL;
        SELECT DEREF(wl.kot) INTO kocur FROM DUAL;
        RETURN TO_CHAR(data_wprowadzenia) || ' ' || kocur.PSEUDO || TO_CHAR(data_usuniecia);
    END;
    MEMBER PROCEDURE wyprowadz_mysz(dat DATE) IS
    BEGIN
      data_usuniecia := dat;
    END;
END;

CREATE TABLE KontoT OF KontoO (
    nr_myszy CONSTRAINT kontao_n_pk PRIMARY KEY,
    kot SCOPE IS ElitaT CONSTRAINT ko_w_nn NOT NULL,
    data_wprowadzenia CONSTRAINT ko_dw_nn NOT NULL,
    CONSTRAINT ko_dw_du_ch CHECK(data_wprowadzenia <= data_usuniecia)
);


-- INCYDENTY
CREATE OR REPLACE TYPE IncydentO AS OBJECT
(
    pseudo VARCHAR2(15),
    kot REF KocuryO,
    imie_wroga VARCHAR2(15),
    data_incydentu DATE,
    opis_incydentu VARCHAR2(100),
    MEMBER FUNCTION czy_aktualny RETURN BOOLEAN,
    MEMBER FUNCTION czy_ma_opis RETURN BOOLEAN
);

CREATE OR REPLACE TYPE BODY IncydentO
AS
    MEMBER FUNCTION czy_ma_opis RETURN BOOLEAN
    IS
    BEGIN
        RETURN opis_incydentu IS NOT NULL;
    END;

    MEMBER FUNCTION czy_aktualny RETURN BOOLEAN
    IS
    BEGIN
        RETURN data_incydentu >= '2010-01-01';
    END;
END;


CREATE TABLE IncydentyT OF IncydentO (
    CONSTRAINT incydento_pk PRIMARY KEY(pseudo, imie_wroga),
    kot SCOPE IS KocuryT CONSTRAINT incydentyo_kot_nn NOT NULL,
    pseudo CONSTRAINT incydentyo_pseudo_fk REFERENCES KocuryT(pseudo),
    imie_wroga CONSTRAINT incydento_imie_wroga_fk REFERENCES Wrogowie(imie_wroga),
    data_incydentu CONSTRAINT incydentyo_data_nn NOT NULL
);

-- TRIGER ZAPOBIEGAJACY DODANIU DO ELITY KOTA Z PLEBSU
CREATE OR REPLACE TRIGGER elita_trg
    BEFORE INSERT OR UPDATE
    ON ElitaT
    FOR EACH ROW
DECLARE
    countElita INTEGER;
BEGIN
    SELECT COUNT(PSEUDO) INTO countElita FROM PlebsT P WHERE P.kot = :NEW.kot;
    IF countElita > 0 THEN
        RAISE_APPLICATION_ERROR(-20000, 'Kot nale?y ju? do plebsu.');
    END IF;

    SELECT COUNT(PSEUDO) INTO countElita FROM ElitaT E WHERE E.kot = :NEW.kot;
    IF countElita > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Kot nale?y ju? do elity.');
    END IF;
END;



-- TRIGER ZAPOBIEGAJACY DODANIU DO ELITY KOTA Z PLEBSU
CREATE OR REPLACE TRIGGER plebs_trg
    BEFORE INSERT OR UPDATE
    ON PlebsT
    FOR EACH ROW
DECLARE
    countPlebs NUMBER;
BEGIN
    SELECT COUNT(PSEUDO) INTO countPlebs FROM ElitaT E WHERE E.kot = :NEW.kot;
    IF countPlebs > 0 THEN
        RAISE_APPLICATION_ERROR(-20003, 'Kot nale?y ju? do elity.');
    END IF;

    SELECT COUNT(PSEUDO) INTO countPlebs FROM PlebsT P WHERE P.kot = :NEW.kot;
    IF countPlebs > 0 THEN
        RAISE_APPLICATION_ERROR(-20004, 'Kot nale?y ju? do plebsu.');
    END IF;
END;

-- WPROWADZANIE DANYCH DO KOCUROW

DECLARE
    CURSOR koty IS SELECT * FROM KOCURY
        CONNECT BY PRIOR PSEUDO=SZEF
        START WITH SZEF IS NULL;
    sql_string VARCHAR2(1000);
BEGIN
    FOR kot in koty
    LOOP
        sql_string:='DECLARE
            szef REF KocuryO;
            counter NUMBER(2);
        BEGIN
            szef:=NULL;
            SELECT COUNT(*) INTO counter FROM KocuryT T WHERE T.pseudo='''|| kot.szef||''';
            IF (counter>0) THEN
                SELECT REF(T) INTO szef FROM KocuryT T WHERE T.pseudo='''|| kot.szef||''';
            END IF;
            INSERT INTO KocuryT VALUES
                    (KocuryO(''' || kot.imie || ''', ''' || kot.plec || ''', ''' || kot.pseudo || ''', ''' || kot.funkcja
                    || ''','''||kot.w_stadku_od || ''', ''' || kot.przydzial_myszy ||''', ''' || kot.myszy_extra ||
                        ''',''' || kot.nr_bandy ||''',' || 'szef' || '));
            END;';
        DBMS_OUTPUT.PUT_LINE(sql_string);
        EXECUTE IMMEDIATE sql_string;
        END LOOP;
END;
SELECT * FROM KocuryT;
COMMIT;

-- WPROWADZANIE DANYCH DO INCYDENTOW
DECLARE
CURSOR zdarzenia IS SELECT * FROM Wrogowie_kocurow;
dyn_sql VARCHAR2(1000);
BEGIN
    FOR zdarzenie IN zdarzenia
    LOOP
      dyn_sql:='DECLARE
            kot REF KocuryO;
        BEGIN
            SELECT REF(K) INTO kot FROM KocuryT K WHERE K.pseudo='''|| zdarzenie.pseudo||''';
            INSERT INTO IncydentyT VALUES
                    (IncydentO(''' || zdarzenie.pseudo || ''',  kot , ''' || zdarzenie.imie_wroga || ''', ''' || zdarzenie.data_incydentu
                    || ''',''' || zdarzenie.opis_incydentu|| '''));
            END;';
       DBMS_OUTPUT.PUT_LINE(dyn_sql);
       EXECUTE IMMEDIATE  dyn_sql;
    END LOOP;
END;


select * from IncydentyT
-- WPROWADZANIE DANYCH PLEBS
DECLARE
CURSOR koty IS SELECT  pseudo
                    FROM (SELECT K.pseudo pseudo FROM KocuryT K ORDER BY K.caly_przydzial() ASC)
                    WHERE ROWNUM<= (SELECT COUNT(*) FROM KocuryT)/2;
dyn_sql VARCHAR2(1000);
BEGIN
    FOR plebs IN koty
    LOOP
      dyn_sql:='DECLARE
            kot REF KocuryO;
        BEGIN
            SELECT REF(K) INTO kot FROM KocuryT K WHERE K.pseudo='''|| plebs.pseudo||''';
            INSERT INTO PlebsT VALUES
                    (PlebsO('''|| plebs.pseudo ||''',' || 'kot' || '));
            END;';
       EXECUTE IMMEDIATE  dyn_sql;
    END LOOP;
END;

select * from PlebsT;

-- WPROWADZANIE DANYCH ELITA

DECLARE
CURSOR koty IS SELECT PSEUDO FROM (SELECT K.pseudo pseudo FROM KocuryT K ORDER BY K.caly_przydzial() DESC)
    WHERE ROWNUM <= (SELECT COUNT(*) FROM KocuryT)/2;
sql_string VARCHAR2(1000);
num NUMBER:=1;
BEGIN
    FOR elita in koty
    LOOP
        sql_string:='DECLARE
                        kot REF KocuryO;
                        sluga REF PlebsO;
                    BEGIN
                        SELECT REF(K) INTO kot FROM KocuryT K WHERE K.pseudo=''' || elita.pseudo || ''';' ||
                       'SELECT plebs INTO sluga FROM (SELECT REF(P) plebs, rownum num FROM PlebsT P) WHERE NUM=' || num ||';'||
                    'INSERT INTO ElitaT VALUES (ElitaO(''' || elita.pseudo ||''', kot, sluga)); END;';
        EXECUTE IMMEDIATE  sql_string;
        num:=num+1;
        END LOOP;
END;




-- WPROWADZANIE DANYCH KONTO
CREATE SEQUENCE nr_myszy;
DECLARE
CURSOR koty IS SELECT pseudo FROM ElitaT;
sql_string VARCHAR2(1000);
BEGIN
    FOR elita IN koty
    LOOP
      sql_string:='DECLARE
            kot REF ElitaO;
            dataw DATE:=SYSDATE;
        BEGIN
            SELECT REF(E) INTO kot FROM ElitaT E WHERE E.pseudo='''|| elita.pseudo||''';
            INSERT INTO KontoT VALUES
                    (KontoO(nr_myszy.NEXTVAL, dataw, NULL, kot));
        END;';
       DBMS_OUTPUT.PUT_LINE(sql_string);
       EXECUTE IMMEDIATE  sql_string;
    END LOOP;
END;


--METODY
SELECT E.kot.pseudo, E.slugus.pseudo, E.pseudo, E.kot.caly_przydzial() FROM ElitaT E;

select P.get_details() from PlebsT P;

--PODZAPYTANIA
-- pierwsza polowa pod wzgledem liczby zjedzonych myszy
SELECT  pseudo FROM (SELECT K.pseudo pseudo FROM KocuryT K ORDER BY K.caly_przydzial() ASC) WHERE ROWNUM<= (SELECT COUNT(*) FROM KocuryT)/2;

--GRUPOWANIE
-- suma myszy pod wladza szefa
select K.szef.info() "Informacje o szefie ",'Pod jego wladza koty zjadaja '|| SUM(K.przydzial_myszy) from KocuryT K group by K.szef ;


-- Zadanie 19a




-- Zad 37 Napisa? blok, który powoduje wybranie w p?tli kursorowej FOR pi?ciu kotów o najwy?szym ca?kowitym przydziale myszy. Wynik wy?wietli? na ekranie.

Declare 
CURSOR koty IS SELECT pseudo, przydzial_myszy+NVL(myszy_extra,0) calkowity FROM KocuryT order by 2 desc;
kot koty%ROWTYPE;

Begin 
open koty;
 DBMS_OUTPUT.PUT_LINE('Nr  Psedonim   Zjada');
 DBMS_OUTPUT.PUT_LINE('---------------------');
for i in 1..5 Loop
 fetch koty into kot;
   DBMS_OUTPUT.PUT_LINE(i ||'    '|| RPAD(kot.pseudo,7) ||'     '|| kot.calkowity);
end loop;
 close koty;
EXCEPTION
 WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE(SQLERRM);

end;




























