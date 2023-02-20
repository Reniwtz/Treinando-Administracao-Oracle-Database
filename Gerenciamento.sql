-- 1) Verifique o grupo especial ORA_DBA do sistema operacional.

-- 2) Abra o Painel de Controle, acesse Ferramentas Administrativas e abra o Gerenciamento do computador.

-- 3) Em Usu�rios e Grupos Locais, clique em Grupos e d� um duplo clique em ORA_DBA.

-- 4) Novamente no Painel de Controle, clique em Sistema e em Configura��es avan�adas do sistema. Em seguida, clique no bot�o Vari�veis de Ambiente.

-- 5) Selecione a vari�vel Path, clique em Editar e copie o caminho do Oracle: C:\app\oracle\19c\bin.

-- 6) Clique em Novo e crie as tr�s vari�veis de ambiente ORACLE_BASE (valor C:\app\oracle), ORACLE_HOME (valor C:\app\oracle\19c) e ORACLE_SDI (valor orcl1).

-- 7) Execute o Prompt de Comando como administrador e execute: sqlplus /NOLOG
 
-- 8) Em seguida, execute:

CONNECT / AS SYSDBA

--9) Depois, execute:

show user

--10) Para sair, execute:

exit

-- 11) Outra maneira de entrar no ambiente Oracle � abrir o navegador e acessar: https://:5500/em.

-- 12) Digite o usu�rio SYS e a sua senha.

-- 13) Ser� carregado o ambiente do banco de dados. Aqui, voc� poder� ver como funciona o Enterprise Manager.

-- 14) H� mais um forma de entrar no banco de dados, usando o Oracle SQL Developer.

-- 15) Agora, pratique um pouco sobre a carga dos par�metros. Para isso, execute o Prompt de Comando como administrador e entre novamente no sqlplus: sqlplus /nolog

-- 16) Conecte com o privil�gio de sysdba:
connect / as sysdba

--  17) Veja os par�metros v�lidos no momento:
select name, value from v$parameter where isbasic = 'True' order by name;

-- 18) Procure por dois par�metros: processes e sessions.

-- 19) Melhore a consulta, listando apenas esses dois par�metros:

select name, value from v$parameter where isbasic = 'True' and (name = 'processes' or name = 'sessions') order by name;

-- 20) Altere o processes de 640 para 200:
alter system set processes = 200 scope=SPFILE;

-- 21) Verifique novamente o valor dos par�metros e veja que ele n�o mudou, isso porque a altera��o foi feita no SPFILE.

-- 22) Verifique o processes e o sessions na tabela v$spparameter:
select name, value from v$spparameter where (name = 'processes' or name = 'sessions') order by name;

-- 23) Aqui o par�metro j� foi alterado.

-- 24) Para que a mudan�a reflita nas duas, pare e suba a inst�ncia. Para isso, fa�a:
startup force

-- 25) Agora, verifique o valor do par�metro nls_language:
select name, value from v$parameter where isbasic = 'True' and (name = 'nls_language') order by name;

-- 26) Mude a l�ngua para franc�s:
alter session set nls_language = 'FRENCH'

-- 27) Observe que o par�metro mudou, rodando novamente a consulta da v$parameter .

-- 28) Pare e suba o banco de novo:
startup force

-- 29) Voltando a observar o par�metro na tabela v$parameter, voc� ver� que a l�ngua voltou para o portugu�s brasileiro.

-- 30) Agora, verifique o valor do par�metro optimizer_mode:
select name, value from v$parameter where (name = 'optimizer_mode') order by name;

-- 31) Execute a altera��o:

alter system set optimizer_mode=ALL_ROWS scope=BOTH; 

-- teste