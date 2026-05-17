### processo para instalar o Oracle foi usada a seguir. ###
### Entrar com usuário Oracle ###

su - oracle
export DISPLAY=localhost:10.0
cd /u01/app/oracle/product/19.0.0/dbhome_1
./runInstaller


### acesso ao banco de dados(add manualmente a variável ORACLE_SID) ###
export ORACLE_SID=olympus1 ### olympus1 é a nome da instance.
export ORACLE_HOME=/u01/app/oracle/product/19.0.0/dbhome_1
export PATH=$ORACLE_HOME/bin:$PATH


### Para entrar no SQL depois de colocar o nome da instance na variavel ORACLE_SID
sqlplus / as sysdba
