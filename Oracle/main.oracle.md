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


Agora vamos criar o banco de dados RAC com DBCA. <br>
Dentro no servidor, vamos entrar com o usuário oracle.

Dentro do caminho a seguir:
/u01/app/oracle/product/19.0.0/dbhome_1

Basta digitar os seguintes comandos para set e para iniciar o software de instalação do banco de dados

export DISPLAY=localhost:10.0
dbca

Vai abrir a seguinte janela de instalação e deixar a opção de "Create a Database" e clicar em next
<img width="818" height="655" alt="image" src="https://github.com/user-attachments/assets/d3fedc74-a00e-4226-b6a6-af179db1e949" />


A proxima etapa é o tipo de implementação, vai deixar os seguintes campo e seus valores e depois clicar em next

| Campo | Valor |
|---|---|
| Database type | Oracle Real Application Cluster (RAC) database ✅ |
| Configuration type | Admin Managed ✅ |
| Template | General Purpose or Transaction Processing ✅ |

O template General Purpose or Transaction Processing é o mais adequado para um ambiente de laboratório RAC.

<img width="801" height="631" alt="image" src="https://github.com/user-attachments/assets/7e2637a8-3b5c-40f0-a938-83994a891326" />

Na porxima etapa é a seleção de Nodes que estão ligados, no caso vai apresentar os nossos servidores
<img width="802" height="636" alt="image" src="https://github.com/user-attachments/assets/17dff093-8e8e-4ef1-8158-0c1af5e22631" />


A seguir, vamos apresentar a identificação do banco de dados e precisamos mudar com os seguinte parametros. E em seguinda clicar em next
| Campo | Valor |
|---|---|
| Global database name | olympus.example.com |
| SID Prefix | olympus |
| Create as Container database | ✅ marcado |
| Create a Container database with one or more PDBs | ✅ marcado |
| Number of PDBs | 1 |
| PDB name | olympuspdb |


A seguir vai conter a opção de storage option
Vamos optar para a seguinte configuração, onde o +DATA/{DB_UNIQUE_NAME} é o nome da variavel, no caso do documentação é:

+DATA/OLYMPUS

<img width="800" height="634" alt="image" src="https://github.com/user-attachments/assets/33285855-dc07-43a2-9880-b8cb30f9521d" />

A proxima etapa é o fast recovery, vamos marca a opção de FRA, onde precisaria de um diskgroup separado, como +FRA ou +RECO, no nosso laboratorio vamos optar somente por +FRA <br>

Sendo desso modo, podemos habilitar área de dedicada para backup, organização de archived logs, suporte a flashback database.
<img width="799" height="633" alt="image" src="https://github.com/user-attachments/assets/585b9b40-013a-47aa-b79c-0e5a1301b046" />
<img width="802" height="631" alt="image" src="https://github.com/user-attachments/assets/638125bf-a551-48b3-9ca8-10d4e3ee34b5" />

Tambem podemos visualizar no browser, alguns detalhes do ambiente
| Diskgroup | Size | Free | Redundancy | Compatibility |
|---|---|---|---|---|
| DATA | 20472 MB | 20124 MB | EXTERNAL | 19.0.0.0.0

Fast Recovery Area: +DATA ✔️ <br>
Fast Recovery Area size: 13332 MB ✔️ <br>
Enable archiving: por enquanto desmarcado ✔️ <br>

<img width="798" height="615" alt="image" src="https://github.com/user-attachments/assets/d344a48f-23cc-455c-be6a-54a4980a6228" />

A seguinte tela não vamos preencher nada e clicar em next
<img width="802" height="630" alt="image" src="https://github.com/user-attachments/assets/1b6cbbc8-023f-4202-87df-aabf7a20cbcf" />


A seguir é a opções de configurações, vamos deixar a conforme a imagem a baixo, já as outras abas vão ficar com o seguinte modo.

| 📋 Sizing | 
|---|
| Block size e processos máximos |

| 🔤 Character sets | 
|---|
| Recomendo verificar se está AL32UTF8 — é o padrão universal e recomendado pela Oracle para novos bancos |

| 🔌 Connection mode | 
|---|
| Dedicated Server ou Shared Server |

| 📦 Sample schemas | 
|---|
| Instala schemas de exemplo como HR, OE, SH etc. |

<img width="800" height="630" alt="image" src="https://github.com/user-attachments/assets/577c6997-74ed-4a70-8a4f-a20b6cf2edeb" />


A proxima etapa é a opçoes de gerenciamento precisamos deixar com as seguinte opções
<img width="801" height="636" alt="image" src="https://github.com/user-attachments/assets/91ec1134-ba1f-4062-954e-32dcc3601668" />

Ao concluir vai ser apresentado os users com suas credencias, precisamos colocar a senha em cada um, senha essa já no arquivo chamado password <br>
<img width="801" height="634" alt="image" src="https://github.com/user-attachments/assets/0d156623-a932-4653-bb89-c1519a0b2807" />

Na proxima etapa, vamos deixar apenas a opção de create database sem qualquer valor no browse, pois esse script é para já se temos algum banco de dados, tablespaces ou usuário <br>
<img width="584" height="459" alt="image" src="https://github.com/user-attachments/assets/10f8aecd-9859-422c-be27-9e86a0f91d84" />

A seguir vai se apresentado o summary que é um resumo previo de todas as etapas e seus valores. Em seguida basta clicar em install <br>
O processo vai demorar conforme o seu hardware <br>
<img width="550" height="418" alt="image" src="https://github.com/user-attachments/assets/32e84636-81c0-441d-8fce-f5dc273df126" />

