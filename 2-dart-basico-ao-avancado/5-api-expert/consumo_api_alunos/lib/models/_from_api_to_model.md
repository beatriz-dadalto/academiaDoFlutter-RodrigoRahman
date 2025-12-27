### Para mapear os dados da API em modelos de classe:

1. Leia os tipos de dados:
- ```"nome": "Beatriz"``` será -> ```String nome```
2. Se for um array:
- ```"nomeCursos": ["Java", "Dart"]``` será uma lista de string, então -> ```List<String> nomeCursos```
3. Se for um objeto ```{}``` é um dado complexo então vira um ```model```.
- ```"cidade": {"id": 1, "nome": "Mogi das Cruzes"}``` é um obj complexo então crie um ```model```. cidade é do tipo Cidade -> ```Cidade cidade```
- ```"cursos": [{"id": 1, "nome": "ADF"}, {"id": 1, "nome": "ADF"}]``` <- é um array de objetos (crie o model) então -> é uma lista de cursos ```List<Curso> cursos```

<br>

| Crie os modelos com as propriedades primeiro. Depois crie os construtores de todos modelos por último lendo a API de trás para frente, assim facilita.


