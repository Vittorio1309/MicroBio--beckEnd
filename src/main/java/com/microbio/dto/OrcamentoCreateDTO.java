package com.microbio.dto;

public record OrcamentoCreateDTO(
    String status,
    String observacao,
    Long pessoaId,
    Long servicoId
) {
}