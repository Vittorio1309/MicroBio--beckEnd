package com.microbio.dto;

import java.math.BigDecimal;

public record ServicoCreateDTO(
    String nome,
    String descricao,
    BigDecimal preco
) {
}