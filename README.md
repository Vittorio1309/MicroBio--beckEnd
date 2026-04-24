# MicroBio Backend

Projeto em Spring Boot para o backend do MicroBio com Maven Wrapper configurado.

## Tecnologias
- Java 8 (compatível)
- Spring Boot 2.7.15
- Spring Web
- Spring Data JPA
- H2 Database (em memória)

## Como executar

### Windows PowerShell
```powershell
# Compilar
.\mvnw.cmd clean compile

# Executar testes
.\mvnw.cmd test

# Rodar a aplicação
.\mvnw.cmd spring-boot:run

# Rodar com profile dev
.\mvnw.cmd spring-boot:run -Dspring-boot.run.profiles=dev
```

### Linux/Mac
```bash
chmod +x ./mvnw
./mvnw clean compile
./mvnw test
./mvnw spring-boot:run
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev
```

## Acessar a aplicação
- API base: `http://localhost:8080/api`
- Console H2: `http://localhost:8080/h2-console`
  - JDBC URL: `jdbc:h2:mem:microbio`
  - User: `sa`
  - Password: (deixe em branco)

## Estrutura do projeto
```
src/main/java/com/microbio/
├── controller/       # REST Controllers
├── service/         # Lógica de negócio
├── repository/      # Acesso a dados (JPA)
├── model/          # Entidades JPA
├── dto/            # Data Transfer Objects
├── config/         # Configurações (CORS, etc)
└── exception/      # Tratamento de exceções
```

## Próximos passos
- Criar entidades e rotas de API conforme o design do Figma
- Integrar com banco de dados de produção
- Implementar autenticação e autorização

