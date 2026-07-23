-- Criando um repositorio para realizar o import e restore.
/*
Inicialmente vamos criar um diretorio para ser compartilhado entre os servidores.

-- a criação do diretorio vai ser o /acfs01/dpump
mkdir -p /acfs01/dpump
mount -t nfs 192.168.0.103:/export/dpump /acfs01/dpump


comandos para validar o diretorio
df -h /acfs01/dpump
ls -ld /acfs01/dpump

Fazer o mesmo para o outro servidor, como validar se deu certo vamos criar um arquivo teste.txt

no servidor I:
touch /acfs01/dpump/teste.txt

no servidor II:
ls -la /acfs01/dpump/

OBS: para salvar a sintaxe correta sem precisar reiniciar

umount /acfs01/dpump
mount -a
df -h /acfs01/dpump
*/

-- Criando um Directory: -- Realizar em ambos os servidores.
CREATE OR REPLACE DIRECTORY dpump_dir AS '/acfs01/dpump';
GRANT READ, WRITE ON DIRECTORY dpump_dir TO SYSTEM; --- SCHEMA/usuário que vai rodar o impdp.

-- query para valiar o diretorio criado.
SELECT directory_name, directory_path 
  FROM dba_directories 
  WHERE directory_name = 'DPUMP_DIR';

--- OBS para se citar, vai precisar verificar se ambos estão open.
SELECT inst_id, name, open_mode FROM gv$pdbs;

-- Caso não esteja, vamos alterar os PDB's
ALTER SESSION SET CONTAINER = OLYMPUSPDB;

/*
Verificando o serviço do PDB
vamos precisar ver o status do serviço que contem na instance com o comando fora do sqlplus plus
*/
srvctl start service -d olympus -service olympuspdb_svc -- caso não retorne nada, precisamos criar do zero.

--- Comandos para primeiro criar o serviço e depois "ligar" o serviço.
srvctl add service -d olympus -service olympuspdb_svc -pdb olympuspdb
srvctl start service -d olympus -service olympuspdb_svc
srvctl status service -d olympus

/*
Com o seguinte mensagem (Service olympuspdb_svc is running on instance(s) olympus1) -- O nó principal está no olympus1
*/
-- A seguir vamos criar um usuário para realizar os dump.
CREATE USER dpump_admin IDENTIFIED BY "SenhaSemArroba123";

GRANT CONNECT, RESOURCE TO dpump_admin;
GRANT EXP_FULL_DATABASE TO dpump_admin;
GRANT IMP_FULL_DATABASE TO dpump_admin;
GRANT READ, WRITE ON DIRECTORY dpump_dir TO dpump_admin;
GRANT UNLIMITED TABLESPACE TO dpump_admin;
-- senha é SenhaSemArroba123 (Tambem registrado no arquivo chamado de arquivo)

/* Observação
com o comando vi $ORACLE_HOME/network/admin/tnsnames.ora
vamos deixar do seguinte modo para fazer a conexão:

OLYMPUS =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = olympus-scan)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = olympuspdb_svc.example.com)
    )
  )
*/
------------------------ BACKUP FULL ------------------------
-- Dentro do diretorio /acfs01/dpump vamos criar os arquivos .sh de impdp e expdp.

-- Um detalhe importante para dizer: Verificar o tnsnames.ora normalmente fica no diretorio 
-- ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1
/*
Por uma questão de particularidade do laboratorio de teste vai ficar desse modo

cat > $ORACLE_HOME/network/admin/tnsnames.ora << 'EOF'
OLYMPUS =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = olympus-scan)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = olympuspdb_svc.example.com)
    )
  )

OLYMPUS_ZEUS =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = zeus)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = olympuspdb_svc.example.com)
      (INSTANCE_NAME = olympus1)
    )
  )
EOF
*/


-- Digitar o comando vi expdp_full.sh (Colar os seguintes parametros)
expdp dpump_admin/"SenhaSemArroba123"@olympus_zeus \
  DIRECTORY=dpump_dir \
  DUMPFILE=full_export_%U.dmp \
  LOGFILE=full_export.log \
  PARALLEL=1 \
  CLUSTER=NO \
  FULL=YES \
  REUSE_DUMPFILES=YES
-- Digitar o comando vi impdp_full.sh (Colar os seguintes parametros)
impdp dpump_admin/"SenhaSemArroba123"@olympus \
  DIRECTORY=dpump_dir \
  DUMPFILE=full_export_%U.dmp \
  LOGFILE=full_import.log \
  PARALLEL=4 \
  CLUSTER=YES \
  FULL=YES

------------------------ BACKUP SCHEMAS ------------------------
-- Digitar o comando vi expdp_schemas.sh (Colar os seguintes parametros)
expdp dpump_admin/"SenhaSemArroba123"@olympus \
  DIRECTORY=dpump_dir \
  DUMPFILE=schema_export_%U.dmp \
  LOGFILE=schema_export.log \
  PARALLEL=4 \
  CLUSTER=YES \
  SCHEMAS=NOME_DO_SCHEMA ---Schema que queira fazer
-- Digitar o comando vi impdp_schemas.sh (Colar os seguintes parametros)
impdp dpump_admin/"SenhaSemArroba123"@olympus \
  DIRECTORY=dpump_dir \
  DUMPFILE=schema_export_%U.dmp \
  LOGFILE=schema_import.log \
  PARALLEL=4 \
  CLUSTER=YES \
  SCHEMAS=NOME_DO_SCHEMA \ ---Schema que queira fazer
  TABLE_EXISTS_ACTION=REPLACE

/* Com os arquivos criados, precisamos dar permissão para acesar com o comando.
  chmod 700 expdp_full.sh impdp_full.sh expdp_schemas.sh impdp_schemas.sh
*/



