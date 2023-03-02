-- 1) Entre no SQL Developer e fa�a a conex�o com o usu�rio system.

-- 2) Crie uma nova tablespace, executando o comando:
CREATE SMALLFILE TABLESPACE tbusers
    DATAFILE 'C:\app\oracle\oradata\TBUSERS_01.dbf' SIZE 50M
    AUTOEXTEND ON NEXT 50M MAXSIZE 500M;

-- 3) Verifique a cria��o do arquivo f�sico e a cria��o da tablespace no Enterprise Manager.

-- 4) Voltando ao SQL Developer, crie um usu�rio, executando o comando:
CREATE USER alois IDENTIFIED BY alois
    DEFAULT TABLESPACE tbusers
    PASSWORD EXPIRE;

-- 5) Crie mais um usu�rio:
CREATE USER afra IDENTIFIED BY afra
    DEFAULT TABLESPACE tbusers
    QUOTA UNLIMITED ON tbusers;

-- 6) Crie o terceiro usu�rio. dessa vez padr�o:
CREATE USER anja IDENTIFIED BY anja;

-- 7) No menu superior do Enterprise Manager, acesse Security --> Users, para ver a lista dos usu�rios.

-- 8) D� privil�gios ao usu�rio alois, executando os comandos:
GRANT
    CREATE SESSION
TO alois;

GRANT
    CREATE TABLE
TO alois;

-- 9) Execute o Prompt de Comando do Windows como administrador e entre no SQL*Plus:

sqlplus

-- Acesse com o usu�rio alois.

-- 10) No SQL Developer, em Conex�es, clique no bot�o com o s�mbolo de "mais" (+) e crie uma conex�o para o usu�rio alois:

/*Nome: CONEX�O USUARIO ALOIS
Nome do Usu�rio: alois
Atribui��o: padr�o
Tipo de Conex�o: TNS
Alias da Rede: ORCL1
Clique em Testar e depois em Conectar.*/

-- 11) Crie um novo script com a conex�o o usu�rio alois.

-- 12) Crie uma tabela:
CREATE TABLE t1 (
    c1 DATE
);

-- 13) O usu�rio alois pode dar privil�gios para qualquer usu�rio:
GRANT ALL ON t1 TO afra;

GRANT SELECT ON t1 TO anja;