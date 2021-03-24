# Para buildar sem o null-safety (atualmente usamos esse método):


1. Criar arquivo launch.json na pasta .vscode na raiz do projeto.
2. Adicionar ou substituir o arquivo `launch.json` para:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Flutter: Run App",
      "type": "dart",
      "request": "launch",
      "program": "lib/main.dart",
      "args": ["--no-sound-null-safety"]
    },
    {
      "name": "Flutter: Run Test",
      "type": "dart",
      "request": "launch",
      "program": "./test/"
    }
  ]
}
```

3. Executar no terminal: `flutter clean`
4. Executar no terminal: `flutter pub get`
5. Executar o app no `F5`

> obs: Caso execute os testes, altere o método do build no ícone de build.