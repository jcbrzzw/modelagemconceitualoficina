# Modelagem Conceitual Oficina

![Alt text](image.png)

Foi criado um banco de dados chamado "oficina" que está relacionado a uma oficina mecânica. O banco de dados possui várias tabelas que armazenam informações sobre funcionários, clientes, veículos, pedidos, ordens de serviço. 

## 💡 Breve descrição de cada tabela:

#### 🔸funcionario: 
Armazena informações sobre os funcionários da oficina, como nome, código, data de nascimento, telefone, endereço, salário e tipo de regime de trabalho (por exemplo, CLT).

#### 🔸administrativo: 
Esta tabela está relacionada aos funcionários administrativos da oficina e inclui detalhes sobre o departamento em que trabalham.

#### 🔸mecanico: 
Armazena informações sobre os mecânicos da oficina, incluindo sua especialidade.

#### 🔸cliente: 
Registra dados dos clientes da oficina, como nome, telefone, endereço e CPF/CNPJ.

#### 🔸veiculo: 
Contém informações sobre os veículos que os clientes possuem, incluindo marca, modelo, ano de fabricação, ano do modelo, tipo de combustível e se possuem seguro.

#### 🔸pedido: 
Armazena detalhes dos pedidos feitos pelos clientes, incluindo o tipo de pedido, descrição e valor.

#### 🔸ordem_servico: 
Registra as ordens de serviço associadas aos pedidos, com informações sobre a data de início, data de entrega e o status da ordem.

#### 🔸mecanico_ordem_servico: 
Esta tabela é uma tabela de junção que associa mecânicos a ordens de serviço. Ela mostra quais mecânicos estão trabalhando em quais ordens de serviço.

No final do script, é realizado inserts e selects, como por exemplo, adicionar funcionários, clientes, veículos, etc. e também realizar consultas para recuperar informações conforme necessário.
