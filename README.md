# 🚀 Oracle RAC 19c – Guia de instalação e funcionalidades aos dia a dia.

A seguir contem uma apresentação do que é um ambiente Oracle RAC. 

Inicialemnte eu vou mostrar os requisitos utilizados para as duas maquinas

<ol>
	  <li> Sistema Operacional: Oracle Linux versão 8 ou mais</li>
  	<li> Memoria Ram: 4GB</li>
  	<li> Placa de Rede: NAT e 2 host-only adapter </li>
	  <li> CPU: 2 clocks</li>	
    <li> Ferramenta de SSH usada foi o Mobaxternm
</ol>

🔴 Oracle Grid Infrastructure <br>

O Oracle Grid Infrastructure é a base responsável pelo funcionamento do Oracle RAC (Real Application Clusters) e do Oracle ASM (Automatic Storage Management).
Ele fornece alta disponibilidade, gerenciamento de cluster, monitoramento de recursos e acesso compartilhado ao armazenamento entre múltiplos servidores.

Com o Oracle Grid é possível:

Implementar ambientes Oracle RAC <br>
Gerenciar recursos do cluster <br>
Monitorar serviços e instâncias <br>
Controlar o Oracle ASM <br>
Garantir alta disponibilidade e tolerância a falhas <br>

Este repositório contém: <br>

Scripts utilizados na instalação e administração do GRID <br>
Evidências e imagens do laboratório <br>
Comandos de monitoramento e troubleshooting <br>
Documentação de apoio para ambientes Oracle RAC 19c <br>


```text
🖥️ RAC 1  -----------\
                       \
                        💾 Disco Compartilhado
                       /
🖥️ RAC 2  -----------/
```

Nome do RAC 1 🖥️: Zeus<br>
IP: 192.168.0.81 <br>
Nome do RAC 2 🖥️: Ares<br>
IP: 192.168.0.103 <br>
Nome do Cluster 🗄️: Olympus <br>


Alguns pre-requisitos a ser feito antes de iniciar qualquer instalação.<br>
Teste de ping e acesso SSH. <br>

No servidor Zeus vamos fazer um ping para o Ares.
<img width="714" height="304" alt="image" src="https://github.com/user-attachments/assets/7e94d112-5dbc-4961-b22d-bff23d40b293" /> 

No servidor Ares vamos fazer um ping para o Zeus.
<img width="723" height="311" alt="image" src="https://github.com/user-attachments/assets/211e2335-83e2-42b1-a17e-398156e0e48c" />

A seguir, contem um teste de SSh para os ambos os servidores.
<img width="333" height="57" alt="image" src="https://github.com/user-attachments/assets/85db18c9-ba8f-4222-acbc-f8bc54e7d549" />

<img width="317" height="62" alt="image" src="https://github.com/user-attachments/assets/21372622-eadb-4ad3-9a25-91f55a426fc3" />


Agora está tudo certo para iniciar a instalação do Oracle Grid nos servidores. <br>
