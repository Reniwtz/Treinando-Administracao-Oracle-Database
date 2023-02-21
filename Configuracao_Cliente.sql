-- 1) Em Painel de Controle, acesse Ferramentas Administrativas e em seguida, Servi�os.

-- 2) Se procurar pela letra O, voc� ver� os servi�os espec�ficos do Oracle.

-- 3) Execute o Prompt de Comando como administrador e execute o comando:
sqlplus / as sysdba

-- 4) Fa�a um start do banco, sem mont�-lo:
startup nomount

-- 5) O banco retornou um erro, pois est� em execu��o.

-- 6) Execute um shutdown:
shutdown abort

-- 7) Execute novamente o comando:
startup nomount

-- 8) A inst�ncia est� montada mas o banco n�o. Para montar o banco, execute o comando:
alter database mount;

-- 9) Agora abra o banco de dados, executando:
alter database open;

-- 10) Veja que o banco est� em modo de leitura e escrita, executando:
select open mode from v$database;

-- 11) Desligue o banco com a cl�usula immediate:
shutdown immediate

-- 12) Abra o Explorador de Arquivos, acesse o diret�rio C:\app\oracle\19c\network\admin e abra o arquivo tnsnames.ora. Veja que a configura��o do listener est� dentro desse arquivo.

-- 13) Abra o Oracle Net Manager, expanda Local, clique sobre Nomea��o de servi�o e clique no bot�o para criar um novo servi�o.

-- 14) Em Nome do Servi�o de Rede, digite NEW e clique em Pr�ximo.

-- 15) Selecione TCP/IP (Protocolo de Internet) e clique em Pr�ximo.

-- 16) Em Nome do Host, digite o nome da sua m�quina local e clique em Pr�ximo.

-- 17) Em Nome do Host, digite o nome da sua m�quina local e clique em Pr�ximo.

-- 18) Em Nome do Servi�o, digite orcl1 e clique em Pr�ximo.

-- 19) Clique em Finalizar.

-- 20) No menu superior o Oracle Net Manager, selecione Arquivo --> Salvar Configura��o de Rede.

-- 21) Execute o Prompt de Comando como administrador e execute o comando:
sqlplus / as sysdba

-- 22) Fa�a um start do banco:
startup force

-- 23) Saia do sqlplus e execute o comando:
sqlplus system/system@NEW 

-- 24) Abra o Oracle SQL Developer e, em Conex�es, clique em +, para criar uma nova conex�o.

-- 25) O nome da conex�o ser� CURSO ADM ORACLE. Al�m disso, use o usu�rio system e a sua senha, e escolha o tipo de conex�o TNS.

-- 26) Em Alias da Rede, escolha NEW e fa�a a conex�o com o banco de dados.

-- 27) Em Painel de Controle, acesse Ferramentas Administrativas e em seguida, Fonte de Dados ODBC (64 bits).

-- 28) Na aba DSN de Usu�rio, clique em Adicionar e escolha o driver do Oracle 19. Em seguida, clique no bot�o Concluir.

-- 29) Em Data Source Name, digite o nome da sua m�quina local.

-- 30) Em Description, digite Conex�o Curso Oracle.

-- 31) No campo do TNS Server Name, digite NEW.

-- 32) Em User ID, escreva system.

-- 33) Teste a conex�o e clique em OK.