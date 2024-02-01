<p align="left">
<span> • </span>
    <span>
        Português
    </span>
    <span> • </span>
    <a href="README_en.md">
        English
    </a>
</p>

# Electron-usual-Docker
A intenção deste repositório é possibilitar que qualquer pessoa tenha seu próprio servidor [Electrum](https://github.com/spesmilo/electrum), usando [Electrs](https://github.com/romanz/electrs ) e [Docker](https://www.docker.com/) da maneira mais fácil.

## Introdução rápida
Uma carteira Electrum geralmente se conecta a um servidor público vinculado a um nó de Bitcoin para realizar ações na rede, com seu próprio servidor electrum conectado ao seu próprio nó, você acaba se tornando completamente auto-ssoberano sobre suas ações na rede Bitcoin.

## Você precisa ter
- [Nó Bitcoin](https://github.com/bitcoin/bitcoin)
- [Docker](https://www.docker.com/)
- [Git](https://git-scm.com/)

## Rodando
Execute:
```
curl -sSL https://raw.githubusercontent.com/MoonDusk1996/docker-usual-electrs/master/quick_start.sh | bash
```

Isso executará um script que irá baixar esse repositório e criará uma imagem docker do electrs. Após terminar de criar a imagem, edite o arquivo de configuração em `/docker-usual-electrs/electrs_data` (apontando para seu nó) e suba seu contêiner de testes executando:

```
docker run --rm -v <caminho_para_electrs_data>:/electrs electrs:latest
```

Depois de ter certeza de que suas configurações estão corretas, você pode para de executar o container de testes com `Ctrl + c` e executar:

```
docker run -v <caminho_para_electrs_data>:/electrs -p 127.0.0.1:50001:50001 -d --name electrum-server electrs:latest
```
Após isso seu contêiner estará em execução, mas pode levar algumas horas para ele sincronizar e indexar com seu nó de Bitcoin. Você pode ver o status do processo executando:

```
docker logs -f electrum-server
```

Nota: Você pode adicionar qualquer diretório para armazenar o banco de dados electrs, desde que tenha um electrs.conf lá.
