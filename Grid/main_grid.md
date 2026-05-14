<h1>  🚀 Instalação do Oracle Grid.</h1>

A seguir contem um pequeno seguia para a instalação do Oracle Grid <br>

Primeiramente precisamos entender alguns pre-requisitos que é fundamental para o funcionamento do GRID.

O Grid é o compartilhamentodo do disco ( Share Storage) entre ambos os servidores. Dito isso, vamos criar esses discos.

OBS: como estamos utilizando o virtual box, pode gerar alguns erros, problemas de share no processo de instalação, porém, como estamos com ambiente de lab pode gerar warmins. 

A seguir, vamos criar 3 discos com ambos de 10GB cada. <br>
<img width="578" height="376" alt="image" src="https://github.com/user-attachments/assets/7f03d130-2f1f-470f-989a-ed3fca98d44b" /> <br>

Aqui contem os 3 discos de 10GB, porem, o type de ambos os discos se encontra com o "shareable"
<img width="761" height="708" alt="image" src="https://github.com/user-attachments/assets/ca464f2b-0ca7-44f5-9606-990c636e956f" />

OBS: Um detalhe, existe uma possibilidade de criar esses disco atraves do powershell, porem, eu não usei aqui por causa de praticidade.

A seguir, precisamos acesso aos servidores e vamos simplesmente colocar os arquivos do GRID e do Oracle no diretorio.

/u01/app/oracle

<img width="202" height="214" alt="image" src="https://github.com/user-attachments/assets/335344ef-9236-482b-8d0e-40fe97707c03" />

Já entra do diretorio /u01/app/oracle

Vamos digitar o seguinte comando: <br>
su - oracle  <br>
export DISPLAY=localhost:10.0  <br>
cd /u01/app/oracle/product/19.0.0/dbhome_1 <br>
./runInstaller <br>

OBS: entrar sempre com o usuário Oracle para dar andamento a instalação.
