SELECT 
  cf.REG_ANS,
  o.nome_operadora,
  SUM(cf.VL_SALDO_FINAL - cf.VL_SALDO_INICIAL) AS despesa_total
FROM 
  Contas_Financeiras cf
JOIN 
  operadoras o ON cf.REG_ANS = o.Registro_ANS
WHERE 
  cf.DESCRICAO = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR'
  AND cf.DATA BETWEEN '2024-10-01' AND '2024-12-31'
GROUP BY 
  cf.REG_ANS, o.nome_operadora
ORDER BY 
  despesa_total DESC
LIMIT 10;

