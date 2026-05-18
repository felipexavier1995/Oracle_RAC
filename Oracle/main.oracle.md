<h1>  🚀 Instalação do Banco de Dados Oracle. </h1>


Ai acesso o servidor (no meu caso eu acesso ao servidor Zeus) vamos trocar para o usuário oracle com o comando. <br>

su - oracle

vai pedir a senha que já definimos, já com usuário oracle, devemos entrar no seguinte caminho: <br>

cd /u01/app/oracle/product/19.0.0/dbhome_1

Essa caminho contem os arquivos binarios que são necessarios para a instalação. Agora vamos dar o comando:

./runInstaller

Vai apresentar a seguinte tela de instalação do Oracle Database.

<img width="893" height="679" alt="image" src="https://github.com/user-attachments/assets/53e9cd40-84f4-4f96-828f-b3bd6c22e2a7" />

Vamos precisar selecionar a seguinte opção:

Set Up Software Only ✅

Isso quer dizer que vamos somente instalar o software da Oracle.

O proximo passo é optar para a seguinte opção:

Oracle Real Application Clusters database installation ✅
<img width="834" height="643" alt="image" src="https://github.com/user-attachments/assets/681ae4e9-23eb-4ba8-a900-58987b15dcea" />

Na parte do Nodes Selection, vamos acessar ao servidor Ares (o meu outro servidor) no caso a instalação do servidor Ares vai ser atraves do SSH
| Node | Hostname | Função |
|---|---|---|
| 1 | Zeus | Nó primário (onde você está instalando) |
| 2 | Ares | Nó secundário (instalação automática via SSH) |

<img width="808" height="638" alt="image" src="https://github.com/user-attachments/assets/0702d1b8-5e23-4a7e-898a-6d552678514a" />

Ao clicar em next, vamos deixar a opção de Enterprise Edition
<img width="799" height="631" alt="image" src="https://github.com/user-attachments/assets/47f3bae0-f063-40cd-8323-57ba5fd1bdb2" />


Na parte Installation location, vamos deixar nos seguinte caminhos
| Node | Hostname | 
|---|---|
| Oracle base | /u01/app/oracle ✅ | 
| Software location | /u01/app/oracle/product/19.0.0/dbhome_1 ✅ | 
<img width="803" height="635" alt="image" src="https://github.com/user-attachments/assets/83cfe2b4-759b-4f28-8c4e-add8935151cc" />


Agora contem o system groups que tem na instalação.

| Grupo | Valor |
|---|---|
| Database Administrator (OSDBA) | dba ✅ | 
| Database Operator (OSOPER) | oper ✅ | 
| Database Backup and Recovery (OSBACKUPDBA) | backupdba ✅ | 
| Data Guard administrative (OSDGDBA) | dgdba ✅ | 
| Encryption Key Management (OSKMDBA |  kmdba ✅ | 
| Real Application Cluster administrative (OSRACDBA) | racdba ✅ | 
<img width="801" height="632" alt="image" src="https://github.com/user-attachments/assets/75b1916a-0e50-4f4a-acf5-237e2cfe9df0" />

A seguir vai ser apresentado que root script, deixa marcado na opção Automatically Run configuration scripts, basta digitar a senha de root <br>
<img width="800" height="636" alt="image" src="https://github.com/user-attachments/assets/bca70e1a-b52b-460d-8b73-135510ead082" />


Depois vai apresentar um resumo até o momento aqui, basta clicar em ignore all e depois clica em YES <br>
Como estamos criando um ambiente de laboratorio, sabemos que podem contem alguns warnings no ambiente <br>
<img width="801" height="635" alt="image" src="https://github.com/user-attachments/assets/b335d445-2a70-4f33-a5eb-ab45c82437ea" />
<img width="805" height="633" alt="image" src="https://github.com/user-attachments/assets/095b0634-e832-40e5-beb4-38443cd7b93e" />

A seguir, clica em INSTALL <br>

Um resumo da instalação:
| Configuração | Valor |
|---|---|
| Database Edition | Enterprise Edition (Set Up Software Only) ✅ |
| Oracle base | /u01/app/oracle ✅ |
| Software location | /u01/app/oracle/product/19.0.0/dbhome_1 ✅ |
| Root script execution | Root user credential ✅ |
| Cluster Nodes | zeus, ares ✅ |
<img width="809" height="641" alt="image" src="https://github.com/user-attachments/assets/6d219a18-a622-4590-9218-981fbad15ac4" />

A instalação demora conforme ao seu hardware que está sendo utilizado.
<img width="804" height="629" alt="image" src="https://github.com/user-attachments/assets/b8bcef8e-a5a1-469b-a59d-d2f185fd73eb" />

🎉 ORACLE DATABASE 19c INSTALADO COM SUCESSO! 🎉
<img width="801" height="626" alt="image" src="https://github.com/user-attachments/assets/fe3a9a9a-b6e0-4008-9462-0f82d1a7e505" />


Agora vamos criar o banco de dados RAC com DBCA.



