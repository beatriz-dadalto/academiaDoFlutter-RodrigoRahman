# Processo de Serialização em 2 etapas:
- Primeiro: transforma obj em map -> toMap()
- Segundo: de map para string json -> toJson()


### Etapa 1: De obj Telefone para Map<String, dynamic>
  ```
  Map<String, dynamic> toMap() {
    return {'ddd': ddd, 'telefone': telefone};
  }
  ```

### Etapa 2: De Map<String, dynamic> para json por meio do pacote dart:convert (jsonEnconde)
```
String toJson() => jsonEncode(toMap());
```

 # Processo de Desserializacao em 2 etapas:
 
- Primeiro: json para map -> factory Telefone.fromJson()
- Segundo: de map para obj Telefone -> factory Telefone.fromMap()

```
  // etapa 2 da desserialização
  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(ddd: map['ddd'], telefone: map['telefone']);
  }
```

```
  // etapa 1 da desserialização
  factory Telefone.fromJson(String json) {
    final jsonMap = jsonDecode(json);
    return Telefone.fromMap(jsonMap);
  }
```
