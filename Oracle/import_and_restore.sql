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

-- Criando um Directory:
CREATE OR REPLACE DIRECTORY dpump_dir AS '/acfs01/dpump';
GRANT READ, WRITE ON DIRECTORY dpump_dir TO <usuario_responsavel>; --- SCHEMA/usuário que vai rodar o impdp.

-- query para valiar o diretorio criado.
SELECT directory_name, directory_path 
  FROM dba_directories 
  WHERE directory_name = 'DPUMP_DIR';
