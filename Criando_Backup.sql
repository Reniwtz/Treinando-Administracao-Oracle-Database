-- 1) Execute o Prompt de Comando do Windows como administrador e entre no RMAN:
rman target 

-- 2) No RMAN, desligue o banco, executando o comando:
shutdown immediate;

-- 3) Para iniciar o banco no estado mount, execute:
startup mount;

-- 4) Para realizar o backup, execute:
backup database;

-- 5) Coloque o banco no ar novamente, executando:
alter database open;

-- 6) Para sair do RMAN, execute:
exit;

-- 7) Para praticar o Backup � quente entre no SQL*Plus, executando:
sqlplus / as sysdba

-- 8) Para ver o status do banco atual, fa�a a seguinte sele��o:
SELECT LOG_MODE FROM V$DATABASE;

-- 9) Para passar o banco para ARCHIVELOG, desligue o banco, executando:
shutdowm immediate;

-- 10) Suba o banco no estado mount, executando:
startup mount;

-- 11) Passe o banco para ARCHIVELOG, executando:
alter database archivelog;

-- 12) Coloque o banco no ar novamente, executando:
alter database open;

-- 13) Verifique o status do banco, executando:
SELECT LOG_MODE FROM V$DATABASE;

-- 14) Saia do SQL*Plus:
exit;

-- 15) Entre no RMAN, executando:
rman target/

-- 16) Para fazer o backup somente da tablespace sysaux, execute:
backup tablespace sysaux;

-- 17) Para fazer o backup dos arquivos de log, execute:
backup archievelog all;

-- 18) Fa�a um backup incremental n�vel zero de uma tablespace espec�fica, executando:
backup incremental level 0 tablespace sysaux;

-- 19) No Oracle SQL Developer, fa�a uma conex�o com o usu�rio system.

-- 20) Crie uma nova tabela, executando os comandos:
CREATE TABLE TABELA_BACKUP (C DATE) TABLESPACE SYSAUX;
INSERT INTO TABELA_BACKUP VALUES (SYSDATE);
COMMIT;

-- 21) Volte ao RMAN e execute:
backup incremental level 1 tablespace sysaux;;

-- 22) De volta ao SQL Developer, execute os comandos:
INSERT INTO TABELA_BACKUP VALUES (SYSDATE);
INSERT INTO TABELA_BACKUP VALUES (SYSDATE);
COMMIT;

-- 23) Volte novamente ao RMAN e execute:
backup incremental level 1 tablespace sysaux;

-- 24) De volta ao SQL Developer, execute os comandos:
INSERT INTO TABELA_BACKUP VALUES (SYSDATE);
INSERT INTO TABELA_BACKUP VALUES (SYSDATE);
INSERT INTO TABELA_BACKUP VALUES (SYSDATE);
COMMIT;

-- 25) De novo volte ao RMAN e execute:
backup incremental level 1 tablespace sysaux;

-- 26) Liste todos todos backups existentes, executando:
list backup of tablespace sysaux;
-- Veja os backups n�vel zero e n�vel um.

-- 27) Gere mais um backup incremental n�vel zero:

backup incremental level 0 tablespace sysaux;

-- 28) Liste todos todos backups existentes, executando:
list backup of tablespace sysaux;

-- 29) Veja agora que o �ltimo backup � n�vel zero.

-- 30) Saia do RMAN, executando:
exit;