-- CREAZIONE TABELLA
CREATE TABLE nome_tabella()

-- ELIMINAZIONE TABELLA
DROP TABLE nome_tabella;

-- AGGIUNGERE UNA COLONNA
ALTER TABLE nome_tabella ADD COLUMN description TEXT;

-- RIMUOVERE UNA COLONNA 
ALTER TABLE nome_tabella DROP COLUMN nome_colonna;

-- RINOMINA COLONNA
ALTER TABLE nome_tabella RINOMINA COLONNA nome_vecchio TO nome_nuovo;

----------------------------------------------------------------

    -- FUNZIONI STRINGA 

-- CONCATENARE 2 STRINGHE ||
'Post' || 'greSQL'→PostgreSQL

-- RIMUOVE SPAZI BIACHI O ALTRI CARATTERI SPECIALI 

BTRIM(stringa); -- rimuove gli spazi bianchi dall'inizio alla fine
BTRIM('xyxtrimyyx', 'xyz') -- →trim  rimuove il carattere specificato

-- LUNGHEZZA DI UNA STRINGA
length()


-- TO_CHAR()

-- To_char utilizzata per convertire un valore nummerico o una data in una STRINGA di testo. 

-- numeri:

    -- conversione in numero 
    TO_CHAR(9, '999')

    -- conversione in decimale
    TO_CHAR(1234.65, '9999.99')

-- date: 

    -- ANNO, MESE E GIORNO
    TO_CHAR(2024-04-02,'YYYY-MM-DD'): '2024-04-02'

    -- Nome abbreviato mese, giorno e anno
    TO_CHAR(2024-04-02, 'Mon DD, YYYY'): 'Apr 02, 2024'

    -- Giorno della settimana, giorno, nome abbraviato mese, anno
    SELECT TO_CHAR(2024-04-02, 'Day, DD Mon, YYYY'): 'Saturday, 02 Apr, 2024'

-- orari: 

    -- Ora, minuti, secondi formato 12h
    TO_CHAR(07:53:2, 'HH12:MI:SS AM'): '07:53:21 AM'

    -- Ora, minuti fomrato 24h
    SELECT TO_CHAR(2024-04-02 12:35:57.658 +0200, 'HH24:MI'): '19:53'
    
    -- Ora, minuti e secondi formato 12h
    SELECT TO_CHAR(CURRENT_TIMESTAMP, 'HH12:MI:SS'): '07:53:21'


    -- TO_DATE

-- converte una stringa di testo in un tipo di dato DATA

TO_DATE('2024-04-02', 'YYYY-MM-DD'): 2024-04-02

    -- TO_TIMESTAMP

-- converte una stringa di testo in un valore di timestamp

TO_TIMESTAMP('2024-04-02 12:34:56', 'YYYY-MM-DD HH24:MI:SS'): 2024-04-02 12:34:56


-- FORMATTAZIONE VALORI DI DATA E ORA

/*
    HH ora del giorno (01-12)
    HH12	ora del giorno (01-12)
    HH24	ora del giorno (00-23)
    MI	minuto (00–59)
    SS	secondo (00-59)
    MS	millisecondo (000–999)
    US	microsecondo (000000–999999)
    MONTH	nome del mese completo in maiuscolo (con spazi vuoti fino a 9 caratteri)
    Month	nome del mese completo in maiuscolo (con spazi vuoti fino a 9 caratteri)
    month	nome del mese completo in minuscolo (con spazi vuoti fino a 9 caratteri)
    MON	Nome del mese abbreviato in maiuscolo (3 caratteri in inglese, la lunghezza localizzata varia)
    Mon	Nome del mese abbreviato in maiuscolo (3 caratteri in inglese, la lunghezza localizzata varia)
    mon	Nome del mese abbreviato in minuscolo (3 caratteri in inglese, la lunghezza localizzata varia)
    MM	numero del mese (01–12)
    DAY	nome del giorno completo in maiuscolo (con spazi vuoti fino a 9 caratteri)
    Day	nome del giorno completo in maiuscolo (con spazi vuoti fino a 9 caratteri)
    day	nome del giorno completo in minuscolo (con spazi vuoti fino a 9 caratteri)
    DY	Nome del giorno abbreviato in maiuscolo (3 caratteri in inglese, la lunghezza localizzata varia)
    Dy	nome del giorno abbreviato in maiuscolo (3 caratteri in inglese, la lunghezza localizzata varia)
    dy	nome del giorno abbreviato in minuscolo (3 caratteri in inglese, la lunghezza localizzata varia)
    DDD	giorno dell'anno (001–366)
*/

-- Concertire un espressione da un tipo di dato a un altro
CAST(espressione AS tipo_di_dati)
-- es: SELECT CAST('123' AS INTEGER);

-- OPERATORE DATA ORA

-- Aggiungere un numero di giorni a una data
date + integer
date '2001-09-28' + 7 -- 2001-10-05  

----------------------------------------------------------------

    -- FUNZIONI DATA E ORA 

-- age() sottrare due date producendo l'intervallo che manca
age('2024/04/05', '2024/04/02') -- 3 Days


-- clock_timestamp() -- data e ora attuali
clock_timestamp()

-- current_date() -- data corrente
current_date -- 2019-12-23

-- current_time() -- ora corrente
current_time -- 14:39:53.662522-05

-- current_timestamp data e ora correnti 
current_timestamp -- 2019-12-23 14:39:53.662522-05

-- Aggiungere o togliere un intervallo (+, -)
CURRENT_DATE + INTERVAL '3 months';
CURRENT_TIMESTAMP + INTERVAL '3 hour'

-- localtime ora attuale del giorno
localtime

-- localtimestamp data e ora attuale del giorno
localtimestamp

-- now() data e ora attuali 
now()

-- timeofday() data e ora attuali 
timeofDAY() -- Mon Dec 23 14:39:53.662522 2019 EST

-- EXTRACT() estrare una porzione di data specifica
EXTRACT(DAY FROM TIMESTAMP '2001-02-16 20:38:40') -- Risultato:16

-- date_trunc() tronca una data o un'ora ad una specifica unità temporale, restituendo la parte della data o dell'ora specificata. 
date_trunc('ora', TIMESTAMP '2001-02-16 20:38:40') --  Risultato:2001-02-16 20:00:00

/*  DATA E ORA CORRENTI

    CURRENT_DATE
    CURRENT_TIME
    CURRENT_TIMESTAMP
    CURRENT_TIME(precision)
    CURRENT_TIMESTAMP(precision)
    LOCALTIME
    LOCALTIMESTAMP
    LOCALTIME(precision)
    LOCALTIMESTAMP(precision)
*/


----------------------------------------------------------------

    -- TRIGGER 

-- Eliminare un trigger 
DROP TRIGGER IF EXISTS nome_colonna ON nome_Tabella;

-- Vedere i trigger
SELECT trigger_name,
       event_object_table AS table_name,
       action_timing AS timing,
       event_manipulation AS operation,
       action_statement AS definition
FROM information_schema.triggers;


-- Creare un trigger 

-- Definisci una funzione di trigger
CREATE OR REPLACE FUNCTION nome_funzione_trigger()
RETURNS TRIGGER AS $$
BEGIN
    -- Logica del trigger
    -- Esempio: inserire un record nella tabella di log
    INSERT INTO log_tabella (evento, data_ora)
    VALUES ('Nuova riga inserita', CURRENT_TIMESTAMP);
    
    -- Importante: restituisci NEW o OLD a seconda dell'evento del trigger
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crea il trigger associando la funzione di trigger a un evento
CREATE TRIGGER nome_trigger
AFTER INSERT OR UPDATE OR DELETE ON nome_tabella
FOR EACH ROW
EXECUTE FUNCTION nome_funzione_trigger();
