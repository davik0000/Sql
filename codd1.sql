select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        where upper(vezeteknev || ' ' || keresztnev) like '%A%A%'
        and
        upper(vezeteknev || ' ' || keresztnev)  not like '%A%A%A%'
        ;
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        where vezeteknev like '__a%';
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        where keresztnev = 'Ella';   -- = olyan mint a like(jokernél kell) --
        
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        where vezeteknev like '%\%%' escape '\'; -- % jel keresése --
        
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        where vezeteknev like '%\_%' escape '\'; -- _ jel keresése --
        

select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        where keresztnev != 'Ella';    -- !=    <>     ^=   (nem egyenlõ operátorok) --
        
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        order by keresztnev, vezeteknev desc;    -- vez szerint csökkenõ --
        
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        order by keresztnev desc, vezeteknev desc;
        
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        order by keresztnev asc, vezeteknev desc;
        
        
select vezeteknev || ' ' || keresztnev, szuletesi_datum
        from KONYVTAR.tag 
        order by szuletesi_datum;
        
        
select vezeteknev || ' ' || keresztnev 
        from KONYVTAR.tag 
        order by 1;                         -- 1 oszlop alapján rendez --
        
        
select vezeteknev || ' ' || keresztnev, szuletesi_datum
        from KONYVTAR.tag 
        order by 2;
        
        
select tema, cim  from KONYVTAR.konyv           
        order by tema nulls last;                                          -- ctrl+space !!!!!   nulls first , nulls last --
        
        
select tema, cim  from KONYVTAR.konyv           
        order by substr(tema,2,1);                                          -- substr karakter kivagas 2.poztol 1 db kivagtunk --
        
        
select tema, cim  from KONYVTAR.konyv           
        order by length(cim);
        
        
select vezeteknev, keresztnev, TO_CHAR(szuletesi_datum, 'ds'),
        round(MONTHS_BETWEEN(SYSDATE, szuletesi_datum / 12))
    from KONYVTAR.szerzo
    where round(MONTHS_BETWEEN(SYSDATE, szuletesi_datum / 12)) > 50
        and
        lower(vezeteknev || keresztnev) like '%a%a%'
        order by vezeteknev, keresztnev;
        
        
tema isbn datum konyvek kiadas datuma   tema horror scifi tortenelem és ebben az evezredben adtak ki kiadas datuma szerint csokkeno


select CIM, ISBN, TO_CHAR(KIADAS_DATUMA, 'ds'), TEMA  
    from KONYVTAR.konyv
    where (tema = 'horror' or tema = 'sci-fi' or tema = 'történelem')
        and
        TO_CHAR(kiadas_datuma, 'yyyy') >= 2000
    order by kiadas_datuma desc;
    
    
select CIM, ISBN, TO_CHAR(KIADAS_DATUMA, 'ds'), TEMA  
    from KONYVTAR.konyv
    where tema in ('horror', 'sci-fi',  'történelem')
        and
        TO_CHAR(kiadas_datuma, 'yyyy') >= 2000
    order by kiadas_datuma desc;
    
    
select CIM, ISBN, TO_CHAR(KIADAS_DATUMA, 'ds'), TEMA  
    from KONYVTAR.konyv
    where tema in ('horror', 'sci-fi',  'történelem')
        and
        TO_CHAR(kiadas_datuma, 'yyyy') >= 2000
        and
         TO_CHAR(kiadas_datuma, 'yyyy') <= 2005
    order by kiadas_datuma desc;
    
    
select CIM, ISBN, TO_CHAR(KIADAS_DATUMA, 'ds'), TEMA  
    from KONYVTAR.konyv
    where tema in ('horror', 'sci-fi',  'történelem')
        and
        TO_CHAR(kiadas_datuma, 'yyyy') BETWEEN 2000 and 2005
    order by kiadas_datuma desc;
    
    
    
    -- összes könyv téma null nélkül --
    
select tema from KONYVTAR.konyv
where tema is not null;




--konyvek ara kiadatas datuma cim tema oldalszam   kiadas datum 1999 - 2000 között ára 1000-3000 vagy 20 oldalnal rovidebb scifi tema szerint csokkeno oldalszam szerint novekvo

select ar, TO_CHAR(kiadas_datuma, 'ds'), cim, tema, oldalszam  
    from KONYVTAR.konyv
    where to_char(kiadas_datuma, 'yyyy') between 1990 and 2000
        or
            ar between 1000 and 3000
            or
            tema = 'sci-fi' and oldalszam < 20
        order by tema desc, oldalszam;







        




        
        
        
