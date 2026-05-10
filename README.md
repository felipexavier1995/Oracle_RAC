# 🚀 Oracle RAC 19c – Guia de instalação e funcionalidades aos dia a dia.

A seguir contem uma apresentação do que é um ambiente Oracle RAC. 

Inicialemnte eu vou mostrar os requisitos utilizados para as duas maquinas

<ol>
	  <li> Sistema Operacional: Oracle Linux versão 8 ou mais</li>
  	<li> Memoria Ram: 4GB</li>
  	<li> Placa de Rede: NAT and Host-only Adapter</li>
	  <li> CPU: 2 clocks</li>	
    <li> Ferramenta de SSH usada foi o Mobaxternm
</ol>

A ideia inicial do Oracle RAC é ter dois servidores (com a mesma configuração de hardware) compartilhando o mesmo disco para os ambos os servidores.
Fazendo assim, um mirror do servidor 1 para o servidor 2.
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

Teste de ping e acesso SSH.
