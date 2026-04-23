package com.microbio.dto;

import java.math.BigDecimal;

public record ServicoUpdateDTO(
    String nome,
    String descricao,
    BigDecimal preco
) {
}