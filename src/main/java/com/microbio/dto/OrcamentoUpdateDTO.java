package com.microbio.dto;

public record OrcamentoUpdateDTO(
    String status,
    String observacao,
    Long pessoaId,
    Long servicoId
) {
}