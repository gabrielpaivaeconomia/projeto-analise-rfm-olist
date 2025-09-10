Análise RFM e Segmentação de Clientes com SQL e Power BI

🎯 Objetivo do Projeto
Analisar a base de clientes de um e-commerce brasileiro (Olist) para identificar padrões de comportamento de compra e segmentá-los em grupos de valor utilizando o modelo RFM (Recência, Frequência, Monetário). O objetivo final é fornecer uma ferramenta de BI que permita direcionar estratégias de marketing, vendas e retenção de forma personalizada para cada segmento.

📊 Dashboard Interativo (Demonstração)
A análise foi consolidada em um dashboard interativo no Power BI. A demonstração abaixo exibe a funcionalidade de filtragem cruzada, onde a seleção de um segmento de cliente atualiza dinamicamente todos os outros visuais.

O relatório interativo completo está disponível no arquivo .pbix deste repositório.


Clique para ver a imagem estática do Dashboard completo: ![print dashboard](https://github.com/user-attachments/assets/a121df9b-f250-4c04-8bd2-a4a2bcd6a1e2)




❓ Perguntas de Negócio e Insights Gerados
Este projeto foi guiado para responder as seguintes perguntas:

Quais cidades geram mais volume de vendas versus mais receita?
A análise revelou que as cidades com maior volume de pedidos (como São Paulo) não são necessariamente as de maior Ticket Médio (valor médio por pedido). Cidades como Salvador e Rio de Janeiro, embora com menos pedidos, apresentam um valor médio por compra significativamente maior, indicando oportunidades para a venda de produtos de maior valor agregado.

Como podemos classificar e entender os diferentes perfis de clientes?
Utilizando o modelo RFM, a base de clientes foi dividida em segmentos estratégicos como "Campeões" (clientes de alto valor, fiéis e recentes), "Clientes em Risco" (bons clientes que não compram há muito tempo) e "Hibernando" (clientes inativos). Cada segmento possui características e pontuações médias de R, F e M distintas, permitindo ações direcionadas.

Onde estão concentrados nossos melhores clientes?
O mapa geográfico revelou que a maioria dos clientes do segmento "Campeões" está concentrada nos estados do Sudeste, principalmente São Paulo, mas com uma presença relevante em outras capitais, validando a importância estratégica dessas regiões para ações de fidelização.

🛠️ Detalhes Técnicos
Ferramentas Utilizadas
Banco de Dados: PostgreSQL
Linguagem de Consulta: SQL
Ferramenta de BI: Microsoft Power BI
Controle de Versão: Git e GitHub

Estrutura dos Arquivos
analise_rfm.sql: Contém todo o script SQL utilizado para a criação das tabelas, carga dos dados (ETL), e a análise e segmentação RFM.
dashboard_rfm.pbix: O arquivo fonte do Power BI, contendo o modelo de dados, relacionamentos e o dashboard interativo.
screenshot_dashboard.png: Imagem estática do dashboard finalizado.
dashboard_interativo.gif: GIF animado demonstrando a funcionalidade interativa do dashboard.

🚀 Como Reproduzir o Projeto
Para executar este projeto em seu ambiente local, siga os passos abaixo:

Pré-requisitos:
Tenha o PostgreSQL e o Microsoft Power BI Desktop (gratuito) instalados.
Faça o download do dataset público da Olist no Kaggle.

Configuração do Banco de Dados:
Crie um novo banco de dados no seu servidor PostgreSQL (ex: olist_db).
Crie uma pasta pública no seu sistema (ex: C:/pg_temp) e mova os arquivos .csv do dataset para lá.
Execute o script analise_rfm.sql na sua ferramenta de consulta. Ele criará as tabelas e importará todos os dados necessários. Lembre-se de ajustar os caminhos dos arquivos no comando COPY dentro do script.

Visualização no Power BI:
Abra o arquivo dashboard_rfm.pbix.
Na primeira vez, o Power BI solicitará que você edite as credenciais da fonte de dados. Aponte a conexão para o seu servidor PostgreSQL local.
Atualize os dados e o dashboard estará pronto para uso.

👨‍💻 Autor
Gabriel Paiva
