-- 1) Entre no SQL Developer e faça a conexão com o usuário system.

-- 2) Crie uma nova tablespace, executando o comando:
CREATE SMALLFILE TABLESPACE tbusers
    DATAFILE 'C:\app\oracle\oradata\TBUSERS_01.dbf' SIZE 50M
    AUTOEXTEND ON NEXT 50M MAXSIZE 500M;

-- 3) Verifique a criação do arquivo físico e a criação da tablespace no Enterprise Manager.

-- 4) Voltando ao SQL Developer, crie um usuário, executando o comando:
CREATE USER alois IDENTIFIED BY alois
    DEFAULT TABLESPACE tbusers
    PASSWORD EXPIRE;

-- 5) Crie mais um usuário:
CREATE USER afra IDENTIFIED BY afra
    DEFAULT TABLESPACE tbusers
    QUOTA UNLIMITED ON tbusers;

-- 6) Crie o terceiro usuário. dessa vez padrão:
CREATE USER anja IDENTIFIED BY anja;

-- 7) No menu superior do Enterprise Manager, acesse Security --> Users, para ver a lista dos usuários.

-- 8) Dê privilégios ao usuário alois, executando os comandos:
GRANT
    CREATE SESSION
TO alois;

GRANT
    CREATE TABLE
TO alois;

-- 9) Execute o Prompt de Comando do Windows como administrador e entre no SQL*Plus:

sqlplus

-- Acesse com o usuário alois.

-- 10) No SQL Developer, em Conexões, clique no botão com o símbolo de "mais" (+) e crie uma conexão para o usuário alois:

/*Nome: CONEXÃO USUARIO ALOIS
Nome do Usuário: alois
Atribuição: padrão
Tipo de Conexão: TNS
Alias da Rede: ORCL1
Clique em Testar e depois em Conectar.*/

-- 11) Crie um novo script com a conexão o usuário alois.

-- 12) Crie uma tabela:
CREATE TABLE t1 (
    c1 DATE
);

-- 13) O usuário alois pode dar privilégios para qualquer usuário:
GRANT ALL ON t1 TO afra;

GRANT SELECT ON t1 TO anja;