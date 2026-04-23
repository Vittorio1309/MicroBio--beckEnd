package com.microbio.service;

import com.microbio.model.Servico;
import com.microbio.repository.ServicoRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ServicoService {

    private final ServicoRepository repository;

    public ServicoService(ServicoRepository repository) {
        this.repository = repository;
    }

    public List<Servico> findAll() {
        return repository.findAll();
    }

    public Optional<Servico> findById(Long id) {
        return repository.findById(id);
    }

    public Servico save(Servico servico) {
        return repository.save(servico);
    }

    public void deleteById(Long id) {
        repository.deleteById(id);
    }
}