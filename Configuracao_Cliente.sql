-- 1) Em Painel de Controle, acesse Ferramentas Administrativas e em seguida, Serviços.

-- 2) Se procurar pela letra O, você verá os serviços específicos do Oracle.

-- 3) Execute o Prompt de Comando como administrador e execute o comando:
sqlplus / as sysdba

-- 4) Faça um start do banco, sem montá-lo:
startup nomount

-- 5) O banco retornou um erro, pois está em execução.

-- 6) Execute um shutdown:
shutdown abort

-- 7) Execute novamente o comando:
startup nomount

-- 8) A instância está montada mas o banco não. Para montar o banco, execute o comando:
alter database mount;

-- 9) Agora abra o banco de dados, executando:
alter database open;

-- 10) Veja que o banco está em modo de leitura e escrita, executando:
select open mode from v$database;

-- 11) Desligue o banco com a cláusula immediate:
shutdown immediate

-- 12) Abra o Explorador de Arquivos, acesse o diretório C:\app\oracle\19c\network\admin e abra o arquivo tnsnames.ora. Veja que a configuração do listener está dentro desse arquivo.

-- 13) Abra o Oracle Net Manager, expanda Local, clique sobre Nomeação de serviço e clique no botão para criar um novo serviço.

-- 14) Em Nome do Serviço de Rede, digite NEW e clique em Próximo.

-- 15) Selecione TCP/IP (Protocolo de Internet) e clique em Próximo.

-- 16) Em Nome do Host, digite o nome da sua máquina local e clique em Próximo.

-- 17) Em Nome do Host, digite o nome da sua máquina local e clique em Próximo.

-- 18) Em Nome do Serviço, digite orcl1 e clique em Próximo.

-- 19) Clique em Finalizar.

-- 20) No menu superior o Oracle Net Manager, selecione Arquivo --> Salvar Configuração de Rede.

-- 21) Execute o Prompt de Comando como administrador e execute o comando:
sqlplus / as sysdba

-- 22) Faça um start do banco:
startup force

-- 23) Saia do sqlplus e execute o comando:
sqlplus system/system@NEW 

-- 24) Abra o Oracle SQL Developer e, em Conexões, clique em +, para criar uma nova conexão.

-- 25) O nome da conexão será CURSO ADM ORACLE. Além disso, use o usuário system e a sua senha, e escolha o tipo de conexão TNS.

-- 26) Em Alias da Rede, escolha NEW e faça a conexão com o banco de dados.

-- 27) Em Painel de Controle, acesse Ferramentas Administrativas e em seguida, Fonte de Dados ODBC (64 bits).

-- 28) Na aba DSN de Usuário, clique em Adicionar e escolha o driver do Oracle 19. Em seguida, clique no botão Concluir.

-- 29) Em Data Source Name, digite o nome da sua máquina local.

-- 30) Em Description, digite Conexão Curso Oracle.

-- 31) No campo do TNS Server Name, digite NEW.

-- 32) Em User ID, escreva system.

-- 33) Teste a conexão e clique em OK.