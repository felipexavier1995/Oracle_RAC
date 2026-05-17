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
Após dado o comando ./runInstaller vai abrir uma caixa de settings do Oracle Grid. <br>
<br>
A seguir contem um janela para criar um novo cluster.
<img width="841" height="763" alt="image" src="https://github.com/user-attachments/assets/3694b0de-892b-4bd9-b8f3-9cc83b807d31" />

Vamos deixar com está na imagem abaixo, porque vamos configurar um novo Cluster entre os servidores
<img width="800" height="631" alt="image" src="https://github.com/user-attachments/assets/8927b296-85c4-4103-b0da-f0d6b88b7293" />

O nome do cluster vai ser olympus-cluster <br>
O scan port vai ser o numero da protocolo 1521 (Numero esse que vai ser usado para ser conectado entre os servidores)<br>
<img width="809" height="633" alt="image" src="https://github.com/user-attachments/assets/95531eca-97e2-4d4a-b2f4-33b41f5143ea" />

Seguir contem o acesso ao SSH entre o outro servidor (ARES)
<img width="801" height="628" alt="image" src="https://github.com/user-attachments/assets/ef12391f-3d06-4c62-b6ee-c1d71a070535" />

No caso podemos ver ambos os servidores (ARES e ZEUS)
<img width="799" height="520" alt="image" src="https://github.com/user-attachments/assets/b18be890-6264-45b6-8b51-b1a66faadf4b" />


```text
🖥️ Servidor Zeus  -----------\
                               \
                                💾 Cluster Olympus
                               /
🖥️ Servidor Ares  -----------/
```
Entrar com o username do "oracle" e sua senha e depois fazer o test. Se apresentar o Sucessfully quer quiser já está estabelecido entre os servidores. <br>
<img width="798" height="629" alt="image" src="https://github.com/user-attachments/assets/ba5ee985-85bb-4cc4-bdf2-73b017d3df15" />
<img width="800" height="632" alt="image" src="https://github.com/user-attachments/assets/edb6dcb6-ba9c-4e7b-9212-f39b85cab3e1" />


A seguir. vamos configurar as interfaces do Grid e depois clicar em Next
<img width="803" height="632" alt="image" src="https://github.com/user-attachments/assets/aaff8a6a-70bb-461a-abaf-4124024d648c" />


Então, como estamos em um ambiente de labotorio, vamos contem alguns warnins como esse a seguir, basta clicar em yes e dar continuidade.
<img width="804" height="629" alt="image" src="https://github.com/user-attachments/assets/44a495da-dbd9-4b15-8925-a1d2a4365203" />

A seguir, vamos utilizar a primeira opção (use oracle flex asm for stotage), porque precisamos compartilhar o disco para ambos os servidores
<img width="800" height="631" alt="image" src="https://github.com/user-attachments/assets/6319ceb3-4138-4c9d-8b0f-2a8deacf6bb0" />

```text
🌐 Funcionamento do RAC 

RAC Nodes
    ↓
Oracle Grid Infrastructure
    ↓
ASM
    ↓
Shared Disks
```

A seguir veremos a data file, porém aqui podemos ter um erro grave
<img width="802" height="632" alt="image" src="https://github.com/user-attachments/assets/9ed88d10-8ff5-425e-8c18-f07cb5db6342" />
<img width="804" height="626" alt="image" src="https://github.com/user-attachments/assets/9287e483-9a91-4ed7-a1b2-3da017a030b9" />

Aqui, vamos optar para seguinte configuração <br>
Selecione os 3 discos: DATA1, DATA2 e FRA1 <br>
Mude Redundancy para External <br>
O ASM não espelha os dados — adequado para laboratório <br>

A seguir, vamos set uma senhar para o sys e para o ASMSNMP <br>

1qaz@WSX
E depois clicar em next
<img width="802" height="631" alt="image" src="https://github.com/user-attachments/assets/04a47158-4783-4d4f-93fa-e9e156e08649" />

Na opção a seguir, vamos utlizar a opção de IPMI, porque estamos ultilizando o virtual box para a criação do lab, IPMI é usado em servidores fisicos para gerenciar o hardware de ambos os servidores. Depois clica em Next
<img width="803" height="629" alt="image" src="https://github.com/user-attachments/assets/5b3a678e-fea7-4d59-bc71-7329e1e18b7d" />

A seguir, vamos deixar desmarcado, porque estamos utilizando ambiente de on-premisses 
<img width="799" height="627" alt="image" src="https://github.com/user-attachments/assets/7dcfb71a-7bd9-4c64-85ba-f8c2687b35c3" />

Nos systens groups vamos deixar com as seguintes opções.
<img width="802" height="634" alt="image" src="https://github.com/user-attachments/assets/3c8f37f0-06ce-4efb-9f90-e494dd5d6786" />


| Grupo | Valor |
|---|---|
| Oracle ASM Administrator (OSASM) | `dba` ✅ |
| Oracle ASM DBA (OSDBA for ASM) | `oinstall` ✅ |
| Oracle ASM Operator (OSOPER for ASM) | `vazio` *(opcional)* ✅ |

Porém, aqui vai contem um warning, basta ignorar clicando no YES
<img width="801" height="632" alt="image" src="https://github.com/user-attachments/assets/6af87e72-075e-4b4b-854a-3118335246ff" />

Como padrão se encontra com esses diretorios 

| Campo | valor |
|---|---|
| Oracle base | `/u01/app/oracle` ✅ |
| Software location | `/u01/app/19.0.0/grid` ✅ |

<img width="804" height="631" alt="image" src="https://github.com/user-attachments/assets/16a019f2-b475-4773-84d2-34d272da5d14" />


O Inventory Directory deve está no path a seguir /u01/app/oraInventory e depois clicar em next
<img width="801" height="628" alt="image" src="https://github.com/user-attachments/assets/eb648640-3aa2-4c8b-bbb0-a10712b0ed67" />

OBS: Pode gerar esse warning, porem é normal
<img width="802" height="628" alt="image" src="https://github.com/user-attachments/assets/51785319-5e05-4a82-b9d9-4677a7ca52d6" />

A seguir  vamos optar para a primeira opção, vai usar o usuário root e sua senha, porque o instalador executa os scripts automaticamente sem você precisar intervir <br>
<img width="801" height="625" alt="image" src="https://github.com/user-attachments/assets/f9b682f2-5abc-4228-bbf4-c2d60dce7bab" />

Depois vai ser realizado um checking validando até o momento, agora vai apresentar alguns warnings, porém, como estamos em ambiente de laboratorio pode clicar em "ignore all" e seguir para a proximo passo <br>

Resumo:

| Check | Status | Ação
|---|---|---|
| Physical Memory  | Warning ❗| RAM abaixo de 8GB — normal para lab |
| Swap Size | Warning ❗| Swap pequeno — normal para lab |
| Package: cvuqdisk-1.0.10-1 | Warning ❗| Precisa instalar ✅ Fixable |
| resolv.conf Integrity | Failed ❌ | Precisa corrigir |
| /dev/shm mounted as temporary file system | Warning ❗ | Normal para lab |
| DNS/NIS name service | Failed ❌| Precisa corrigir |

<img width="797" height="627" alt="image" src="https://github.com/user-attachments/assets/2193254f-d5ed-484d-8182-6de5dd35a778" />

Para ser corrigido alguns Failed com o comando a seguir:

cvuqdisk instalado nos dois servidores! ✅
yum install -y cvuqdisk 

o oracle exige no maximo 3 nameservers IPv4.

cat /etc/resolv.conf

cat > /etc/resolv.conf << 'EOF'                <br>              
search example.com                             <br>
nameserver 181.213.132.2                       <br>
nameserver 181.213.132.3                       <br>
nameserver 8.8.8.8                             <br>
EOF                                            <br>


A seguir contem a correção e suas descrições:
| Check | Motivo para ignorar | 
|---|---|
| Physical Memory  | Ambiente de lab com 2GB — abaixo do mínimo de 8GB mas funciona | 
| Swap Size | Swap pequeno — aceitável para lab |  
| resolv.conf Integrity | Usamos /etc/hosts no lugar do DNS | 
| /dev/shm mounted as temporary file system | Não afeta a instalação em lab | 
| DNS/NIS name service | Usamos /etc/hosts no lugar do DNS | 


Quando apresentar os seguintes status, basta clicar em Ignore All e clicar em next, vai apresentar esse warning, porem podemos ignorar e seguir <br>
<img width="793" height="631" alt="image" src="https://github.com/user-attachments/assets/c9786775-a647-4214-bd86-74fd86c44d17" />

A seguir vai ter um summary que é um resumo das opções que a gente colocou. Basta clicar em INSTALL.
<img width="798" height="631" alt="image" src="https://github.com/user-attachments/assets/f1d2c305-90e5-46eb-a4ef-543431f1fd34" />

| Configuração | Valor | 
|---|---|
| Cluster Name | olympus-cluster ✅ | 
| Hub nodes | zeus, ares ✅ | 
| SCAN | olympus-scan ✅| 
| SCAN Port | 1521 ✅ |
| Public Interface | enp0s3 ✅ | 
| Private Interface | enp0s8 ✅ | 
| ASM & Private | enp0s9 ✅ | 
| Storage Type | Oracle ASM ✅ | 
| ASM Disk Group | DATA ✅ | 
| Storage Redundancy | EXTERNAL ✅ | 
| Disks | DATA1, DATA2 ✅ | 
| Inventory | /u01/app/oraInventory ✅ | 


Ai clicar em "Install" vai demorar um tempo relativo conforme ao seu hardware. <br>
Ao Concluir a instalação, vamos rodar alguns comando para evidenciar o cluster de ambos os servidores <br>

Vamos executar o seguinte comando nos servidores Zeus e Ares

/u01/app/19.0.0/grid/bin/crsctl status res -t

| Recurso | Servidor Zeus | Servidor Ares | 
|---|---|---|
| ora.LISTENER.lsnr | ONLINE ✅ | ONLINE ✅ |
| ora.net1.network  | ONLINE ✅ | ONLINE ✅ |
| ora.ons  | ONLINE ✅ | ONLINE ✅ |
| ora.asm  | ONLINE ✅ | ONLINE ✅ |
| ora.DATA.dg  | ONLINE ✅ | ONLINE ✅ |
| ora.zeus.vip  | ONLINE ✅ | - |
| ora.ares.vip  | ONLINE ✅ | - |
| ora.scan1.vip  | - | ONLINE ✅ |
| ora.scan2.vip  | ONLINE ✅ | - |
| ora.scan3.vip  | ONLINE ✅ | - |







