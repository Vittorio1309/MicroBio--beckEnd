package com.microbio.dto;

import java.time.LocalDateTime;

public record OrcamentoDTO(
    Long id,
    LocalDateTime dataCriacao,
    String status,
    String observacao,
    Long pessoaId,
    Long servicoId
) {
}