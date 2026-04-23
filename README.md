# MicroBio Backend

Projeto inicial em Spring Boot para o backend do MicroBio.

## Tecnologias
- Java 17
- Spring Boot 3
- Spring Web
- Spring Data JPA
- H2 Database

## Como executar
1. Abra o projeto em sua IDE.
2. Execute `mvn spring-boot:run`.
3. Acesse `http://localhost:8080/api/health`.
4. Acesse o console H2 em `http://localhost:8080/h2-console`.

## Estrutura sugerida
- `controller/`
- `service/`
- `repository/`
- `model/`
- `dto/`

## Próximos passos
- Criar entidades e rotas de API conforme o design do Figma.
- Implementar frontend separado ou integrar com templates no Spring Boot.
