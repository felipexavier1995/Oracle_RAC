### >comando usados para verificar os sincronia dos ASM e Cluster entre os servidores. ###
/u01/app/19.0.0/grid/bin/crsctl check crs

### >Comando para verificar a instalação e funcionamento do cluster nos servidores. ###
/u01/app/19.0.0/grid/bin/crsctl status res -t

### >comando para verificar se o cluster está completamente online. ###
/u01/app/19.0.0/grid/bin/crsctl check cluster -all

### >comando para deixar o cluster com o status UP ###
### (usado somente em caso se os servidores estão com o horário diferente) ###
/u01/app/19.0.0/grid/bin/crsctl start res ora.crsd -init

date -s "$(ssh root@ares date)" ### comando para deixar os horarios dos servidores com o mesmo valor (Caso for preciso)

