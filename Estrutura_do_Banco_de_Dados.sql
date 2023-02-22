-- 1) Entre no Oracle SQL Developer.

-- 2) Em Conex�es, clique no bot�o com o s�mbolo de "mais" (+).

-- 3) O nome da conex�o ser� CONEX�O USUARIO SYS.

-- 4) No Nome do Usu�rio, coloque sys e entre com a mesma senha que usou quando criou o banco de dados ORCL1. Salve a senha.

-- 5) Em Atribui��o, selecione a op��o SYSDBA.

-- 6) O tipo de conex�o � TNS.

-- 7) Marque ORCL1 no Alias da Rede.

-- 8) Clique em Testar e a conex�o ser� realizada.

-- 9) Clique em Conectar e verifique a cria��o da conex�o.

-- 10) Mais uma vez em Conex�es, clique no bot�o com o s�mbolo de "mais" (+).

-- 11) O nome da conex�o ser� CONEX�O USUARIO SYSTEM.

-- 12) No Nome do Usu�rio, coloque system e entre com a mesma senha que usou quando criou o banco de dados ORCL1. Salve a senha.

-- 13) Em Atribui��o, selecione a op��o padr�o.

-- 14) O tipo de conex�o � TNS.

-- 15) Marque ORCL1 no Alias da Rede.

-- 16) Clique em Conectar e verifique a cria��o da conex�o.

-- 17) Use a conex�o CONEX�O USUARIO SYS.

-- 18) Use a janela de script.

-- 19) Os arquivos de controle (dicion�rios de dados) s�o apresentados executando o comando:
SELECT
    *
FROM
    v$controlfile;

-- 20) Execute e veja o resultado. S�o apresentados os dados da tabela.

-- 21) Para mostrar a localiza��o dos arquivos de log, digite e execute o comando:
SELECT
    vl.member,
    vl2.bytes
FROM
         v$logfile vl
    JOIN v$log vl2 ON vl.group# = vl2.group#;

-- 22) Outra maneira de escrever o comando:

SELECT
    vl.member,
    vl2.bytes
FROM
         v$logfile vl
    JOIN v$log vl2 USING ( group# );

-- 23) Para mostrar a quantidade de tablespace, execute o comando:
SELECT
    *
FROM
    v$tablespace;

-- 24) Para mostrar a localiza��o dos arquivos de tablespace, execute o comando
SELECT
    *
FROM
    v$datafile;

-- 25) Para mostrar o conte�do das tablespaces:
SELECT
    t.name,
    d.name,
    d.bytes
FROM
         v$tablespace t
    JOIN v$datafile d USING ( ts# )
UNION
SELECT
    t.name,
    d.name,
    d.bytes
FROM
         v$tablespace t
    JOIN v$tempfile d USING ( ts# );

-- 26) Use os comandos para mostrar mais caracter�sticas das tablespaces, atrav�s da tabela dba_tablespaces:
SELECT
    tablespace_name,
    t.contents,
    d.file_name,
    d.bytes
FROM
         dba_tablespaces t
    JOIN dba_data_files d USING ( tablespace_name )
UNION
SELECT
    tablespace_name,
    t.contents,
    d.file_name,
    d.bytes
FROM
         dba_tablespaces t
    JOIN dba_temp_files d USING ( tablespace_name );

-- 27) Crie uma nova tabela com o usu�rio system:
CREATE TABLE system.minhatabela
    AS
        SELECT
            *
        FROM
            all_objects;

-- 28) Verifique em que tablespace a tabela foi criada, executando o comando:
SELECT
    tablespace_name,
    table_name
FROM
    dba_tables
WHERE
        owner = 'SYSTEM'
    AND table_name = 'MINHATABELA';

-- 29) Para visualizar o segmento associado � tabela que foi gravada, execute o comando:
SELECT
    tablespace_name,
    segment_type
FROM
    dba_segments
WHERE
        owner = 'SYSTEM'
    AND segment_name = 'MINHATABELA';

-- 30) Para ver as extens�es que o segmento possui, execute:
SELECT
    file_name,
    extent_id,
    block_id
FROM
         dba_data_files
    JOIN dba_extents USING ( file_id )
WHERE
        owner = 'SYSTEM'
    AND segment_name = 'MINHATABELA';

-- 31) Altere a localiza��o da tabela movendo para a tablespace sysaux:
ALTER TABLE system.minhatabela MOVE
TABLESPACE sysaux;

-- 32) Verifique a altera��o da localiza��o da tabela, executando:
SELECT
    tablespace_name,
    segment_type
FROM
    dba_segments
WHERE
        owner = 'SYSTEM'
    AND segment_name = 'MINHATABELA';

-- 33) Veja as extens�es da tabela:
SELECT
    file_name,
    extent_id,
    block_id
FROM
         dba_data_files
    JOIN dba_extents USING ( file_id )
WHERE
        owner = 'SYSTEM'
    AND segment_name = 'MINHATABELA';

-- 34) Apague a tabela minhatabela:
DROP TABLE system.minhatabela;