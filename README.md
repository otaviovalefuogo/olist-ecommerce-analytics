# 📊 Olist E-Commerce Analytics | Dashboard Executivo & Plano de Ação

> Painel de Business Intelligence desenvolvido no Power BI, focado em análise de desempenho de vendas, eficiência logística, diagnóstico de categorias de produtos e gestão da qualidade de parceiros no e-commerce brasileiro.

👉 **[🔗 Clique aqui para acessar ao Dashboard Interativo no Power BI](https://app.powerbi.com/view?r=eyJrIjoiYTExNmE2ZTQtMjU3My00ZjlkLWEwMjktNjNmMGI2ZmU0ODdmIiwidCI6IjA4ODlkYjBjLTRmYTAtNGY1NC1iYjZmLTZmM2FhN2Y4YjJkMCJ9)**

---

## 📌 Visão Geral do Projeto

Entre 2016 e 2018, a plataforma Olist registou um crescimento expressivo de quase 10x na sua operação. Contudo, o aumento do volume trouxe desafios logísticos regionais e riscos na retenção de clientes devido a divergências no nível de serviço de alguns vendedores.

Este projeto analisa os dados históricos do e-commerce e traz soluções em **recomendações acionáveis para a diretoria**.

### ⚠️ Nota Técnica sobre a Série Temporal (Visão Geral)

> **Qualidade e Truncamento de Dados:** Ao analisar o gráfico de evolução temporal na página _Visão Geral_, observa-se uma queda acentuada no final da série histórica (setembro/outubro de 2018).
>
> É importante destacar que **esta queda não reflete um declínio real nas vendas da Olist**, mas sim a **incompletude da recolha do conjunto de dados** (_data truncation_), no qual o último mês registado possui dados parciais.

---

## 📂 Dataset

- **Fonte:** [Brazilian E-Commerce Public Dataset by Olist](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce) — Kaggle
- **Volume:** ~100.000 pedidos reais | 2016 a 2018
- **Tabelas originais:** 8 arquivos CSV importados para MySQL
- **Tabela analítica gerada:** 1 view consolidada (`vw_pedidos_detalhe`) com ~113.000 linhas

---

## 🗄️ Modelagem e Engenharia de Dados (SQL)

Para garantir a integridade e otimização do painel, a extração e transformação dos dados (ETL) foram realizadas previamente na camada do banco de dados. Os _scripts_ estão disponíveis na pasta `/dataset/` deste repositório:

- **`01_schema_tabelas.sql`**: Estrutura de criação das tabelas no banco de dados.
- **`02_vw_pedidos_detalhe.sql`**: _View_ consolidada que realiza _JOINs_ , trata valores nulos (`COALESCE`), formata _strings_ (`REPLACE`) e aplica **regras de negócio nativas no banco**, como o cálculo de atrasos em SLA (utilizando `CASE`).
  A view vw_pedidos_detalhe consolida 6 tabelas via JOIN:
  orders → customers → order_items → products → sellers → order_reviews

---

## 🗂️ Estrutura do Painel

- **🏠 Home:** Menu de navegação intuitivo em estilo aplicação web.
- **📈 Visão Geral:** Evolução de faturamento, ticket médio e categorias líderes.
- **🚚 Logística:** Análise de prazos de entrega regionais, custos de frete e atrasos operacionais.
- **🛍️ Produtos:** Matriz de frete x preço, margem por categoria e avaliações.
- **👨‍💼 Vendedores:** Concentração geográfica de parceiros e análise de reputação.
- **💡 Insights & Plano de Ação:** 4 pilares estratégicos de tomada de decisão.

---

## 🔬 Metodologia

1. **Extração** — 8 CSVs importados via LOAD DATA no MySQL
2. **Transformação** — 1 view central com JOINs, CASE WHEN para SLA e COALESCE para nulos
3. **Visualização** — Power BI conectado ao MySQL via Connector/NET
4. **Análise** — KPIs definidos por página com foco em perguntas de negócio reais

---

## 🎯 Plano de Ação Estratégico

| Pilar            | Diagnóstico Identificado                                                           | Ação Recomendada                                                            |
| :--------------- | :--------------------------------------------------------------------------------- | :-------------------------------------------------------------------------- |
| **🚚 Operação**  | Tempo de espera atinge **28 dias** nos estados do Norte/Nordeste (2x mais que SP). | Criar _hubs_ de distribuição regionais no Norte para reduzir prazos.        |
| **⭐ Qualidade** | Vendedores do "Top Piores" com notas críticas entre **1,26 e 1,83**.               | Implementar suspensão imediata para parceiros com avaliação abaixo de 2,0.  |
| **📦 Margem**    | Frete representa **54%** do preço na categoria _Casa Conforto_.                    | Captar fornecedores regionais e renegociar tabelas de frete volumoso.       |
| **🎯 Receita**   | Ticket médio em _PCs_ atinge **R$ 1,3 Mil** com alta avaliação.                    | Redirecionar campanhas de marketing para segmentos de alto ticket e margem. |

---

## 🛠️ Tecnologias e Ferramentas Utilizadas

- **SQL:** Modelação de dados, criação de _Views_ e lógica de negócio (ETL).
- **Power BI:** Tratamento final, linguagem DAX para métricas e construção visual.
- **Google Slides:** _Design_ de fundos e _layouts_ customizados em _Dark Mode_.
- **Git & GitHub:** Controlo de versão e documentação do projeto.

---

## 🚀 Como Visualizar

1. Navegue pelo **[Link do Dashboard Interativo](https://app.powerbi.com/view?r=eyJrIjoiYTExNmE2ZTQtMjU3My00ZjlkLWEwMjktNjNmMGI2ZmU0ODdmIiwidCI6IjA4ODlkYjBjLTRmYTAtNGY1NC1iYjZmLTZmM2FhN2Y4YjJkMCJ9)** no seu navegador.
2. Caso prefira explorar localmente:
   - Consulte os _scripts_ de extração na pasta `/dataset/`.
   - Transfira o ficheiro `Projeto_olist.pbix` disponível neste repositório e abra-o no Power BI Desktop.

---

_Desenvolvido por Otávio Campos Valefuogo._
