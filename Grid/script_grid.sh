### >comando usados para verificar os sincronia dos ASM e Cluster entre os servidores. ###
/u01/app/19.0.0/grid/bin/crsctl check crs

### >Comando para verificar a instalação e funcionamento do cluster nos servidores. ###
/u01/app/19.0.0/grid/bin/crsctl status res -t

### >comando para verificar se o cluster está completamente online. ###
/u01/app/19.0.0/grid/bin/crsctl check cluster -all

### >comando para deixar o cluster com o status UP ###
### (usado somente em caso se os servidores estão com o horário diferente) ###
/u01/app/19.0.0/grid/bin/crsctl start res ora.crsd -init

### comando para deixar os horarios dos servidores com o mesmo valor (Caso for preciso) ###
date -s "$(ssh root@ares date)" 

### Listar todos os disks groups ###
oracleasm listdisks

### Processo para instalar o GRID foi usado a seguir. ###

### OBS: O path abaixo é onde se encontra os binarios do oracle

su - oracle
export DISPLAY=localhost:10.0
cd /u01/app/oracle/product/19.0.0/dbhome_1
./runInstaller

### Iniciar o ASM e o CRSD manualmente ###
/u01/app/19.0.0/grid/bin/crsctl start res ora.asm -init


