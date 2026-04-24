# Maven Wrapper Setup - MicroBio Backend

## O que foi configurado

O projeto agora possui um **Maven Wrapper** que permite executar Maven sem precisar instalá-lo globalmente no sistema Windows.

### Arquivos criados/modificados:

#### 1. **mvnw.cmd** (na raiz do projeto)
- Script batch para Windows
- Baixa automaticamente Maven 3.6.3 na primeira execução
- Armazena em: `%USERPROFILE%\.m2\wrapper\apache-maven-3.6.3`
- Executa Maven automaticamente

#### 2. **mvnw** (na raiz do projeto)
- Script shell para Linux/Mac
- Funcionalidade similar ao mvnw.cmd

#### 3. **.mvn/wrapper/maven-wrapper.properties**
- Configuração de versão do Maven
- URL para download

#### 4. **.mvn/wrapper/MavenWrapperDownloader.java**
- Classe Java auxiliar para download (opcional)

#### 5. **pom.xml** (modificado)
- Ajustado para Java 8 (compatível com seu sistema)
- Spring Boot 2.7.15 (LTS, compatível com Java 8)
- Removido Lombok para simplificar compilação
- Plugin maven-compiler-plugin versão 3.8.1

#### 6. **.gitignore** (atualizado)
- Ignora maven-wrapper.jar e JAR baixados

## Como usar

### Primeiro uso (Windows)
```powershell
cd C:\Users\VittorioAllieviUecke\Downloads\MicroBio--beckEnd
.\mvnw.cmd --version
```

Na primeira execução, o script vai:
1. Criar diretório `.m2\wrapper`
2. Baixar Maven 3.6.3 (arquivo ZIP ~10MB)
3. Descompactar
4. Executar o comando Maven

### Comandos comuns

```powershell
# Limpar e compilar
.\mvnw.cmd clean compile

# Executar testes
.\mvnw.cmd test

# Build do projeto
.\mvnw.cmd clean package

# Rodar a aplicação
.\mvnw.cmd spring-boot:run

# Com profile específico
.\mvnw.cmd spring-boot:run -Dspring-boot.run.profiles=dev

# Ver dependências
.\mvnw.cmd dependency:tree

# Instalar dependências
.\mvnw.cmd install -DskipTests
```

## Possíveis problemas e soluções

### Problema: "No compiler is provided"
**Solução**: Você precisa de um JDK (não apenas JRE)

**Opção 1**: Baixar AdoptOpenJDK 8
```
https://adoptium.net/temurin/releases/?version=8
```

**Opção 2**: Definir variável de ambiente JAVA_HOME
```powershell
[Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files\Java\jdk1.8.0_XXX", "User")
```

### Problema: "bitsadmin não reconhecido"
- Use uma versão do Windows que tenha bitsadmin
- Ou defina um proxy se necessário

### Problema: Porta 8080 já em uso
```powershell
.\mvnw.cmd spring-boot:run -Dspring-boot.run.arguments="--server.port=9090"
```

## Arquivos de configuração

### `application.properties`
```
spring.h2.console.enabled=true
spring.h2.console.path=/h2-console
spring.datasource.url=jdbc:h2:mem:microbio;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=FALSE
spring.datasource.driverClassName=org.h2.Driver
spring.datasource.username=sa
spring.datasource.password=
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=true
spring.jpa.properties.hibernate.format_sql=true
```

## Próximas etapas

1. **Instalar um JDK completo** para compilar corretamente
2. **Testar a compilação**: `.\mvnw.cmd clean compile`
3. **Rodar a aplicação**: `.\mvnw.cmd spring-boot:run`
4. **Acessar**: `http://localhost:8080`

## Referências

- Maven Wrapper: https://maven.apache.org/wrapper/
- Spring Boot: https://spring.io/projects/spring-boot
- Adoptium JDK: https://adoptium.net/

