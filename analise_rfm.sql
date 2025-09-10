-- FASE FINAL: CRIAÇÃO DOS SCORES E SEGMENTOS RFM

-- 1. Usamos o código anterior como uma tabela temporária 'rfm_data'
WITH rfm_data AS (
    WITH dados_clientes AS (
        SELECT
            c.customer_unique_id,
            o.order_id,
            p.payment_value,
            o.order_purchase_timestamp
        FROM
            public.olist_customers_dataset AS c
        JOIN
            public.olist_orders_dataset AS o ON c.customer_id = o.customer_id
        JOIN
            public.olist_order_payments_dataset AS p ON o.order_id = p.order_id
        WHERE
            o.order_status = 'delivered'
    )
    SELECT
        customer_unique_id,
        ( (SELECT MAX(order_purchase_timestamp) FROM dados_clientes) - MAX(order_purchase_timestamp) ) AS recencia,
        COUNT(DISTINCT order_id) AS frequencia,
        SUM(payment_value) AS valor_monetario
    FROM
        dados_clientes
    GROUP BY
        customer_unique_id
),

-- 2. Criamos os scores de 1 a 5 para cada métrica RFM
rfm_scores AS (
    SELECT
        customer_unique_id,
        recencia,
        frequencia,
        valor_monetario,
        NTILE(5) OVER (ORDER BY recencia DESC) AS r_score, -- Menor recência (mais recente) = maior score
        NTILE(5) OVER (ORDER BY frequencia ASC) AS f_score,  -- Maior frequência = maior score
        NTILE(5) OVER (ORDER BY valor_monetario ASC) AS m_score -- Maior valor monetário = maior score
    FROM
        rfm_data
)

-- 3. Combinamos os scores para criar os segmentos finais
SELECT
    customer_unique_id,
    r_score,
    f_score,
    m_score,
    CASE
        WHEN r_score = 5 AND f_score >= 4 THEN 'Campeões'
        WHEN f_score >= 4 THEN 'Clientes Fiéis'
        WHEN m_score = 5 THEN 'Grandes Gastadores'
        WHEN r_score >= 4 THEN 'Clientes Recentes'
        WHEN r_score <= 2 AND f_score >= 3 THEN 'Em Risco'
        WHEN r_score <= 2 AND f_score <= 2 THEN 'Hibernando'
        ELSE 'Clientes Casuais'
    END AS segmento
FROM
    rfm_scores
ORDER BY
    (r_score + f_score + m_score) DESC;