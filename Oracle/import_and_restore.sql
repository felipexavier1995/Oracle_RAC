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
Com o seguinte mensagem ()
*/


