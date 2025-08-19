# 🌦️ Aplicativo de Clima

Este é um aplicativo móvel, desenvolvido com React Native e Expo, que permite aos usuários pesquisar por uma cidade e obter dados meteorológicos em tempo real, além de uma previsão para os próximos dias. Os dados são fornecidos pela API da **OpenWeather**.

## ✨ Funcionalidades

- **Pesquisa de Cidades:** Busca dinâmica por nome de cidade.
- **Clima Atual:** Apresenta dados detalhados do clima atual, como temperatura, sensação térmica, umidade, velocidade do vento e condição (ensolarado, nublado, etc.).
- **Previsão Futura:** Mostra a previsão do tempo para os próximos dias.

## 🚀 Tecnologias Utilizadas

- **[Flutter](https://docs.flutter.dev/):** Framework para desenvolvimento de aplicativos móveis multiplataforma.
- **[Dart](https://dart.dev/docs):** Linguagem de programação inspirada em Java que foi desenvolvida pela Google.
- **[OpenWeather API](https://openweathermap.org/api):** Fonte dos dados meteorológicos.

---

## 📋 Pré-requisitos

Antes de começar, você precisará ter o seguinte instalado em sua máquina:
- [Flutter SDK](https://docs.flutter.dev/get-started/install/linux/android) (versão 3.x ou superior)
- [Android Studio](https://developer.android.com/studio/install?hl=pt-br#linux) (para o SDK do Android e gerenciamento de emuladores)
- Um emulador Android configurado via Android Studio ou um dispositivo **Android físico** com o modo de desenvolvedor e depuração USB ativados.
- Uma chave de API (API Key) da [OpenWeather](https://openweathermap.org/appid). É gratuito para o plano básico.

## ⚙️ Instalação e Configuração

Siga os passos abaixo para configurar e rodar o projeto localmente:

**1. Clone o repositório:**
```bash
git clone https://github.com/MagnaDevBRA/flutter_weather_app.git 
```

**2. Navegue para a pasta do projeto:**
```bash
cd flutter_weather_app
```

**3. Instale as dependências:**
```bash
flutter pub get
```

**4. Adicione a chave de API:**

Para que o aplcicativo funcione corretamente, vocé precisa adicionar sua chave de API da OpenWeather ao arquivo **src/services/OpenWeatherApi.ts**.
```bash
# lib/src/services/open_weather_api.dart
const String apiKey = 'SUA_CHAVE_AQUI';
```

## ▶️ Rodando a Aplicação

Primeiro, abra seu terminal e execute o comando:
```bash
flutter devices
```
A saída será algo parecido com isto, listando os emuladores em execução, dispositivos físicos conectados e até navegadores para web:
```bash
Found 3 connected devices:
  SM GFF00 (mobile) • FF00FF00    • android-arm64  • Android 15 (API 35)
  Linux (desktop)   • linux       • linux-x64      • Ubuntu 24.04.2 LTS 6.8.0-71-generic
  Chrome (web)      • chrome      • web-javascript • Google Chrome 138.0.7204.49
```
Para rodar o aplicativo em um dispositivo específico, execute o comando:
```bash
flutter run -d FF00FF00
```

---

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo **[LICENSE](./LICENSE)** para mais detalhes.

---

Feito por [Magna M. V. da Silva](https://github.com/MagnaDevBRA).

