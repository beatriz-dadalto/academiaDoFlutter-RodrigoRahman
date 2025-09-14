# contact_bloc

Projeto para aprender sobre Bloc

## Para ter dados na tela

1. Entrar na pasta /backend
2. rodar fvm dart bin/json_server.dart


Nota:
- se o dart estiver instalado sem fvm, rode -> dart bin/json_server.dart


## Para gerar os arquivos freezed

fvm dart run build_runner clean
fvm dart run build_runner build
fvm dart run build_runner build --delete-conflicting-outputs
fvm dart pub run build_runner watch
