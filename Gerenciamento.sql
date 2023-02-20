-- 1) Verifique o grupo especial ORA_DBA do sistema operacional.

-- 2) Abra o Painel de Controle, acesse Ferramentas Administrativas e abra o Gerenciamento do computador.

-- 3) Em Usuários e Grupos Locais, clique em Grupos e dê um duplo clique em ORA_DBA.

-- 4) Novamente no Painel de Controle, clique em Sistema e em Configurações avançadas do sistema. Em seguida, clique no botão Variáveis de Ambiente.

-- 5) Selecione a variável Path, clique em Editar e copie o caminho do Oracle: C:\app\oracle\19c\bin.

-- 6) Clique em Novo e crie as três variáveis de ambiente ORACLE_BASE (valor C:\app\oracle), ORACLE_HOME (valor C:\app\oracle\19c) e ORACLE_SDI (valor orcl1).

-- 7) Execute o Prompt de Comando como administrador e execute: sqlplus /NOLOG
 
-- 8) Em seguida, execute:

CONNECT / AS SYSDBA

--9) Depois, execute:

show user

--10) Para sair, execute:

exit

-- 11) Outra maneira de entrar no ambiente Oracle é abrir o navegador e acessar: https://:5500/em.

-- 12) Digite o usuário SYS e a sua senha.

-- 13) Será carregado o ambiente do banco de dados. Aqui, você poderá ver como funciona o Enterprise Manager.

-- 14) Há mais um forma de entrar no banco de dados, usando o Oracle SQL Developer.

-- 15) Agora, pratique um pouco sobre a carga dos parâmetros. Para isso, execute o Prompt de Comando como administrador e entre novamente no sqlplus: sqlplus /nolog

-- 16) Conecte com o privilégio de sysdba:
connect / as sysdba

--  17) Veja os parâmetros válidos no momento:
select name, value from v$parameter where isbasic = 'True' order by name;

-- 18) Procure por dois parâmetros: processes e sessions.

-- 19) Melhore a consulta, listando apenas esses dois parâmetros:

select name, value from v$parameter where isbasic = 'True' and (name = 'processes' or name = 'sessions') order by name;

-- 20) Altere o processes de 640 para 200:
alter system set processes = 200 scope=SPFILE;

-- 21) Verifique novamente o valor dos parâmetros e veja que ele não mudou, isso porque a alteração foi feita no SPFILE.

-- 22) Verifique o processes e o sessions na tabela v$spparameter:
select name, value from v$spparameter where (name = 'processes' or name = 'sessions') order by name;

-- 23) Aqui o parâmetro já foi alterado.

-- 24) Para que a mudança reflita nas duas, pare e suba a instância. Para isso, faça:
startup force

-- 25) Agora, verifique o valor do parâmetro nls_language:
select name, value from v$parameter where isbasic = 'True' and (name = 'nls_language') order by name;

-- 26) Mude a língua para francês:
alter session set nls_language = 'FRENCH'

-- 27) Observe que o parâmetro mudou, rodando novamente a consulta da v$parameter .

-- 28) Pare e suba o banco de novo:
startup force

-- 29) Voltando a observar o parâmetro na tabela v$parameter, você verá que a língua voltou para o português brasileiro.

-- 30) Agora, verifique o valor do parâmetro optimizer_mode:
select name, value from v$parameter where (name = 'optimizer_mode') order by name;

-- 31) Execute a alteração:

alter system set optimizer_mode=ALL_ROWS scope=BOTH;