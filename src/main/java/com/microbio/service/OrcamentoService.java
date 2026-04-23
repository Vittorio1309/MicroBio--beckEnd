package com.microbio.service;

import com.microbio.model.Orcamento;
import com.microbio.model.Pessoa;
import com.microbio.model.Servico;
import com.microbio.repository.OrcamentoRepository;
import com.microbio.repository.PessoaRepository;
import com.microbio.repository.ServicoRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
public class OrcamentoService {

    private final OrcamentoRepository orcamentoRepository;
    private final PessoaRepository pessoaRepository;
    private final ServicoRepository servicoRepository;

    public OrcamentoService(OrcamentoRepository orcamentoRepository,
                            PessoaRepository pessoaRepository,
                            ServicoRepository servicoRepository) {
        this.orcamentoRepository = orcamentoRepository;
        this.pessoaRepository = pessoaRepository;
        this.servicoRepository = servicoRepository;
    }

    public List<Orcamento> findAll() {
        return orcamentoRepository.findAll();
    }

    public Optional<Orcamento> findById(Long id) {
        return orcamentoRepository.findById(id);
    }

    public Orcamento save(Orcamento orcamento) {
        return orcamentoRepository.save(orcamento);
    }

    public void deleteById(Long id) {
        orcamentoRepository.deleteById(id);
    }
}