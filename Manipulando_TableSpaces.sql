-- 1) Abra o navegador e acesse https://NOME_DA_SUA_MÁQUINA/5500/em/login (substitua NOME_DA_SUA_MÁQUINA pelo nome da sua máquina).

-- 2) Entre no Oracle Enterprise Manager Database Express com o username sys.

-- 3) Verifique a funcionalidade da aplicação.

-- 4) Feche o navegador e execute o Prompt de Comando do Windows como administrador.

-- 5) Execute:
sqlplus / as sysdba

-- 6) Execute o comando:
@?/rdbms/admin/execemx emx

-- 7) Volte ao navegador e acesse novamente: https://minhamáquina/5500/em/login.

-- 8) Em outra aba do navegador, acesse https://flash.pm/browser/.

-- 9) Clique em Download FlashBrowser e execute o download da versão 64 bits.

-- 10) Instale o navegador.

-- 11) No navegador Flash Browser, acesse: https://minhamáquina/5500/em/login.

-- 12) Na tela de login, acesse com usuário sys e marque opção as sysdba. Clique em Login.

-- 13) No menu superior, acesse Storage --> Tablespaces. Você verá todas as informações das tablespaces.

-- 14) Entre no SQL Developer e utilize a conexão com o usuário system.

-- 15) Crie uma nova tablespace, executando o comando:
CREATE SMALLFILE TABLESPACE novatablespace
    DATAFILE 'C:\app\oracle\oradata\NOVATABLE.DBF' SIZE 1M
    AUTOEXTEND ON NEXT 1M MAXSIZE 10M;

-- 16) Crie uma tabela bem simples, com um campo apenas na tablespace que foi criada com o comando:
CREATE TABLE tabelanova1 (
    c1 DATE
)
TABLESPACE novatablespace;

-- 17) Verifique a criação da tabela e da tablespace.

-- 18) Agora, crie uma outra tabela, dessa vez populada:
CREATE TABLE tabelanova2
TABLESPACE novatablespace
    AS
        SELECT
            *
        FROM
            all_objects;

-- 19) Ao executar o comando, você verá um erro, pois o limite da tablespace foi ultrapassado.

-- 20) Para alterar a tablespace e criar um novo arquivo, execute:
ALTER TABLESPACE novatablespace ADD DATAFILE 'C:\app\oracle\oradata\NOVATABLE2.DBF' SIZE 1M
AUTOEXTEND ON NEXT 1M MAXSIZE 10M;

-- 21) Crie novamente a tabela e veja o impacto no disco:
CREATE TABLE tabelanova2
TABLESPACE novatablespace
    AS
        SELECT
            *
        FROM
            all_objects;

-- 22) No Enterprise Manager, veja as alterações.

-- 23) Crie uma outra tablespace, dessa vez ilimitada:
CREATE SMALLFILE TABLESPACE novatablespace2
    DATAFILE 'C:\app\oracle\oradata\NOVATABLE3.DBF' SIZE 1M
    AUTOEXTEND ON MAXSIZE UNLIMITED;

-- 24) Crie mais duas tabelas:
CREATE TABLE tabelanova3 (
    c1 DATE
)
TABLESPACE novatablespace2;

CREATE TABLE tabelanova4
TABLESPACE novatablespace2
    AS
        SELECT
            *
        FROM
            all_objects;

-- 25) Veja fisicamente como ficou e verifique também no Enterprise Manager.

-- 26) Mostre o conteúdo de TABELANOVA2:
SELECT
    *
FROM
    tabelanova2;

-- 27) Altere o tablespace para OFFLINE:
ALTER TABLESPACE novatablespace OFFLINE;

-- 28) Se você tentar executar o comando abaixo, verá um erro, pois a tablespace está OFFLINE:
SELECT
    *
FROM
    tabelanova2;

-- 29) Para voltar para ONLINE, execute o comando:
ALTER TABLESPACE novatablespace ONLINE;

-- 30) Mostre o conteúdo da tabela:
SELECT
    *
FROM
    tabelanova2;

-- 31) Apague o que foi feito:
DROP TABLE tabelanova4;

DROP TABLE tabelanova3;

DROP TABLESPACE novatablespace2;

DROP TABLE tabelanova2;

DROP TABLE tabelanova1;

DROP TABLESPACE novatablespace;

-- 32) Crie uma nova tablespace:
CREATE SMALLFILE TABLESPACE novatablespace3
    DATAFILE 'C:\app\oracle\oradata\NOVATABLESPACE3.dbf' SIZE 1M
    AUTOEXTEND ON NEXT 1M MAXSIZE 10M;

-- 33) Verifique no Enterprise Manger a criação da tablespace.

-- 34) Troque o nome da tablespace:
ALTER TABLESPACE novatablespace3 RENAME TO novatablespace4;

-- 35) Deixe a tablespace OFFLINE:
ALTER TABLESPACE novatablespace4 OFFLINE;

-- 36) Altere o nome do arquivo direto no Explorador de Arquivos.

-- 37) Altere o nome do arquivo no dicionário de dados, executando o comando:
ALTER DATABASE RENAME FILE 'C:\app\oracle\oradata\NOVATABLESPACE3.dbf' TO 'C:\app\oracle\oradata\NOVATABLESPACE4.dbf';

-- 38) Verifique que o nome foi alterado no banco de dados.

-- 39) Altere a tabela para ONLINE:
ALTER TABLESPACE novatablespace4 ONLINE;

-- 40) Crie uma nova tabela nessa tablespace:
CREATE TABLE tabela_teste (
    c1 DATE
)
TABLESPACE novatablespace4;

-- 41) Altere a tablespace para ser somente leitura, executando o comando:
ALTER TABLESPACE novatablespace4 READ ONLY;

-- 42) Mostre o conteúdo da tabela:
SELECT
    *
FROM
    tabela_teste;

-- 43) Se você tentar inserir dados na tabela:
INSERT INTO tabela_teste VALUES ( sysdate );
-- Verá um erro, pois a tabela é READ ONLY.

-- 44) Altere a tablespace para escrita:
ALTER TABLESPACE novatablespace4 READ WRITE;

-- 45) Insira dados na tabela:
INSERT INTO tabela_teste VALUES ( sysdate );

-- 46) Apague a tablespace:
DROP TABLESPACE novatablespace4;
-- Você verá um erro.

-- 47) Apague a tablespace seguindo as indicações:
DROP TABLESPACE novatablespace4 INCLUDING CONTENTS AND DATAFILES;

-- 48) A tablespace será apagada junto com o arquivo.