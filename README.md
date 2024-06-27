# Projeto GCP DevOps com Terraform e Pipeline Jenkins (Projeto de Aprendizagem)

Este repositório demonstra uma configuração básica do Terraform e um pipeline do Jenkins para provisionar um bucket do Google Cloud Storage (GCS). Ele serve como um projeto de aprendizado para explorar princípios de infraestrutura como código (IaC) e fluxos de trabalho de integração contínua/entrega contínua (CI/CD).

## Visão Geral do Projeto

* **Terraform:** Cria um bucket GCS denominado `gcp-devops-bucket-001` no projeto `gcp-devops-427517` com a localização `US` e a prevenção de acesso público forçada.
* **Pipeline Jenkins:**
    * Faz check-out do código da branch `main` do repositório `https://github.com/Carllos166/gcp-terraform-jenkins-webhook.git`.
    * Inicializa o Terraform.
    * Executa `terraform plan` para visualizar as alterações na infraestrutura.
    * Implementa uma etapa de aprovação manual para supervisão humana.
    * Aplica a configuração do Terraform (opcional: após aprovação manual).

## Pré-requisitos

* **Projeto do Google Cloud Platform (GCP):** Crie um projeto GCP e ative as APIs necessárias (por exemplo, Cloud Storage).
* **Terraform:** Instale o Terraform de acordo com a documentação oficial ([https://www.terraform.io/](https://www.terraform.io/)).
* **Jenkins:** Configure um servidor Jenkins.
* **Plugins Jenkins:** Os seguintes plugins do Jenkins são necessários para a funcionalidade deste pipeline:
   * **Pipeline:** Define a estrutura e sintaxe do pipeline.
   * **Pipeline: API:** Fornece APIs para interagir com o pipeline durante a execução.
   * **Pipeline: SCM:** Permite o check-out do código de um sistema de controle de versão (SCM) como o Git.
   * **Pipeline: Job:** Define um estágio individual dentro do pipeline.
   * **Pipeline: Groovy:** Possibilita a execução de scripts Groovy dentro do pipeline para tarefas personalizadas.
   * **Git:** Integração com o Git para check-out do código.
   * **Github:** Suporte específico para o repositório GitHub (opcional, se aplicável).
   * **Credentials:** Gerencia credenciais usadas no pipeline, como tokens do Git e credenciais do Google Cloud.
* **Credenciais do Jenkins:** Configure credenciais para:
    * **git-token:** Acesso ao repositório Git (se estiver usando repositórios privados).
    * **gcp-key-json:** Credenciais da conta de serviço do Google Cloud com permissões suficientes para gerenciar buckets do GCS.

## Instruções

1. **Configurar o Terraform:**
    * Crie um arquivo `backend.tf` para configurar o backend de estado do Terraform (opcional, para armazenamento de estado remoto).
    * Defina variáveis de ambiente para os valores de configuração do Terraform necessários (por exemplo, `GOOGLE_CLOUD_PROJECT`) ou use um arquivo de configuração do Terraform (`variables.tf`).

2. **Configurar o Pipeline Jenkins:**
    * Atualize o Jenkinsfile com a URL do repositório Git correto e o ID de credenciais, se necessário.
    * Certifique-se de que as credenciais do Google Cloud estejam acessíveis ao pipeline do Jenkins (por exemplo, usando a variável de ambiente `GOOGLE_APPLICATION_CREDENTIALS`).

3. **Executar o Pipeline:**
    * No Jenkins, crie uma nova tarefa ou pipeline que execute o Jenkinsfile.

## Observação Importante:

Este projeto é para fins de aprendizado e não deve ser usado em ambientes de produção sem as devidas considerações de segurança e mecanismos de controle de acesso.

## Considerações Adicionais

* **Manipulação de Erros:** Implemente o tratamento de erros no pipeline para cenários inesperados.
* **Controle de Versão:** Use o controle de versão para sua configuração do Terraform para rastrear alterações e gerenciar reversões.
* **Segurança:** Proteja suas credenciais da Conta de Serviço do Google Cloud e siga as práticas recomendadas para o mínimo privilégio.
* **Infraestrutura como Código (IaC):** Explore recursos avançados do Terraform para modularidade, reutilização e parametrização.
* **Integração Contínua/Entrega Contínua (CI/CD):** Aprimore seu pipeline com etapas adicionais para testes, implantação e recursos de reversão.

## Disclaimer:**

Este é um exemplo básico e pode exigir ajustes com base em seu ambiente e requisitos específicos.
