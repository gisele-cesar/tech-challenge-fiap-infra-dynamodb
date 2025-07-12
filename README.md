# Tech Challenge FIAP - Infraestrutura DynamoDB

Este repositório contém a infraestrutura Terraform para provisionamento de uma tabela DynamoDB na AWS, utilizada para gerenciar o status de upload e processamento de vídeos que são convertidos em imagens.

## 📋 Descrição do Projeto

A tabela DynamoDB criada por esta infraestrutura tem como finalidade armazenar os atributos de status de upload de vídeos que passam por um processo de transformação em imagens. Essas imagens são posteriormente armazenadas em um bucket S3 para que os usuários possam fazer download dos arquivos processados.

## 🏗️ Arquitetura

### Recursos Provisionados

- **Tabela DynamoDB**: `fiap-video-upload`
  - **Chave Primária**: `Id` (String)
  - **Modo de Cobrança**: Provisionado
  - **Capacidade de Leitura**: 3 RCU (Read Capacity Units)
  - **Capacidade de Escrita**: 3 WCU (Write Capacity Units)
  - **Região**: us-east-1

### Estrutura da Tabela

| Atributo | Tipo | Descrição |
|----------|------|-----------|
| Id | String (S) | Identificador único do upload |

## 📁 Estrutura do Projeto

```
infra/
└── terraform/
    ├── dynamodb.tf    # Configuração da tabela DynamoDB
    ├── provider.tf    # Configuração do provider AWS
    └── outputs.tf     # Outputs da infraestrutura
```

## 🚀 Como Usar

### Pré-requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configurado
- Credenciais AWS configuradas

### Execução

1. **Clone o repositório:**
   ```bash
   git clone <repository-url>
   cd tech-challenge-fiap-infra-dynamodb
   ```

2. **Navegue até o diretório do Terraform:**
   ```bash
   cd infra/terraform
   ```

3. **Inicialize o Terraform:**
   ```bash
   terraform init
   ```

4. **Valide a configuração:**
   ```bash
   terraform validate
   ```

5. **Visualize o plano de execução:**
   ```bash
   terraform plan
   ```

6. **Aplique a infraestrutura:**
   ```bash
   terraform apply
   ```

### Destruição da Infraestrutura

Para remover todos os recursos criados:

```bash
terraform destroy
```

## 🔧 Configurações

### Provider AWS

- **Região**: us-east-1
- **Versão do Provider**: ~> 4.0

### Capacidade da Tabela

A tabela está configurada com modo de cobrança provisionado:
- **Read Capacity Units (RCU)**: 3
- **Write Capacity Units (WCU)**: 3

> **Nota**: Essas configurações podem ser ajustadas conforme a necessidade de throughput da aplicação.

## 📊 Monitoramento

Recomenda-se monitorar as seguintes métricas da tabela DynamoDB:
- Consumed Read Capacity Units
- Consumed Write Capacity Units
- Throttled Requests
- User Errors
- System Errors

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request
