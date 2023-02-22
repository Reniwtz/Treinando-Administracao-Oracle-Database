-- 1) Entre no Oracle SQL Developer.

-- 2) Em Conexões, clique no botão com o símbolo de "mais" (+).

-- 3) O nome da conexão será CONEXÃO USUARIO SYS.

-- 4) No Nome do Usuário, coloque sys e entre com a mesma senha que usou quando criou o banco de dados ORCL1. Salve a senha.

-- 5) Em Atribuição, selecione a opção SYSDBA.

-- 6) O tipo de conexão é TNS.

-- 7) Marque ORCL1 no Alias da Rede.

-- 8) Clique em Testar e a conexão será realizada.

-- 9) Clique em Conectar e verifique a criação da conexão.

-- 10) Mais uma vez em Conexões, clique no botão com o símbolo de "mais" (+).

-- 11) O nome da conexão será CONEXÃO USUARIO SYSTEM.

-- 12) No Nome do Usuário, coloque system e entre com a mesma senha que usou quando criou o banco de dados ORCL1. Salve a senha.

-- 13) Em Atribuição, selecione a opção padrão.

-- 14) O tipo de conexão é TNS.

-- 15) Marque ORCL1 no Alias da Rede.

-- 16) Clique em Conectar e verifique a criação da conexão.

-- 17) Use a conexão CONEXÃO USUARIO SYS.

-- 18) Use a janela de script.

-- 19) Os arquivos de controle (dicionários de dados) são apresentados executando o comando:
SELECT
    *
FROM
    v$controlfile;

-- 20) Execute e veja o resultado. São apresentados os dados da tabela.

-- 21) Para mostrar a localização dos arquivos de log, digite e execute o comando:
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

-- 24) Para mostrar a localização dos arquivos de tablespace, execute o comando
SELECT
    *
FROM
    v$datafile;

-- 25) Para mostrar o conteúdo das tablespaces:
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

-- 26) Use os comandos para mostrar mais características das tablespaces, através da tabela dba_tablespaces:
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

-- 27) Crie uma nova tabela com o usuário system:
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

-- 29) Para visualizar o segmento associado à tabela que foi gravada, execute o comando:
SELECT
    tablespace_name,
    segment_type
FROM
    dba_segments
WHERE
        owner = 'SYSTEM'
    AND segment_name = 'MINHATABELA';

-- 30) Para ver as extensões que o segmento possui, execute:
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

-- 31) Altere a localização da tabela movendo para a tablespace sysaux:
ALTER TABLE system.minhatabela MOVE
TABLESPACE sysaux;

-- 32) Verifique a alteração da localização da tabela, executando:
SELECT
    tablespace_name,
    segment_type
FROM
    dba_segments
WHERE
        owner = 'SYSTEM'
    AND segment_name = 'MINHATABELA';

-- 33) Veja as extensões da tabela:
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