# GS3 Tecnologia - Desafio Flutter

## 📌 Descrição
Este projeto é um aplicativo Flutter desenvolvido para o desafio técnico da **GS3 Tecnologia**. O aplicativo permite a seleção de cartões e exibe informações sobre suas respectivas faturas e últimos lançamentos.

### O app foi feito apenas para **Android**

## 🚀 Tecnologias Utilizadas
- **Flutter** (Framework principal)  
- **Dart** (Linguagem de programação)  

## 🛠️ Dependências utilizadas
- **Provider** (Gerenciamento de estado)
- **Intl** (Parseamento de datas e números)
- **flutter_svg** (Utilizar imagens em formato SVG)
- **smooth_page_indicator** (Indicador para trabalhar com PageView)

## 🎯 Arquitetura
O projeto segue a arquitetura **MVVM (Model-View-ViewModel)**, que separa as responsabilidades em três camadas principais:  
- **Model**: Representa os dados do aplicativo.  
- **ViewModel**: Gerencia a lógica de negócios e o estado da aplicação.  
- **View**: Responsável pela interface gráfica e exibição dos dados.  

Utilizei também uma pasta **Shared** no desenvolvimento do aplicativo, que contém utilitários e widgets reutilizáveis para o uso da aplicação. Essa pasta se encontra no seguinte caminho:
``` plaintext
lib
│── app
│   │── shared
│   │   │── utils
│   │   │   │── data_parser.dart
│   │   │   │── number_parser.dart
│   │   │   │── show_bottom_dialog.dart
│   │   │── widget
│   │   │   │── cartao.dart
```

## 🗂️ Estrutura de pastas
``` plaintext
lib
│── main.dart
│── app
│   │── app_widget.dart
│   │── screens_container.dart
│   │── model
│   │   │── cartao_model.dart
│   │   │── lancamento_model.dart
│   │── shared
│   │   │── utils
│   │   │   │── data_parser.dart
│   │   │   │── number_parser.dart
│   │   │   │── show_bottom_dialog.dart
│   │   │── widget
│   │   │   │── cartao.dart
│   │── view
│   │   │── home
│   │   │   │── widgets
│   │   │   │   │── cartoes.dart
│   │   │   │   │── favoritos.dart
│   │   │   │   │── top_app_bar.dart
│   │   │   │   │── ultimos_lancamentos.dart
│   │   │   │   │── home_screen.dart
│   │   │── notfound
│   │   │   │── not_found_screen.dart
│   │   │── posting
│   │   │   │── widgets
│   │   │   │── posting_screen.dart
│   │── viewmodel
│   │   │── home_view_model.dart
test
│── app
│   │── shared
│   │   │── utils
│   │   │   │── data_parser_test.dart
│   │   │   │── number_parser_test.dart
```

## 📂 `lib/`
A pasta principal do código-fonte da aplicação.
- `main.dart` - Ponto de entrada do aplicativo.

### 📁 `app/`
Contém a organização principal do projeto.
- `app_widget.dart` - Widget raiz do aplicativo que contém o MaterialApp e a chamada do Provider.  
- `screens_container.dart` - Gerenciador de telas.  
- **📂 model/**  
  Armazena as classes de modelo, que representam os dados da aplicação.  
  - `cartao_model.dart` - Modelo para cartões.  
  - `lancamento_model.dart` - Modelo para lançamentos financeiros.  

- **📂 shared/**  
  Contém arquivos compartilhados por várias partes do aplicativo.  
  - **📂 utils/** - Funções utilitárias para manipulação de dados.  
    - `data_parser.dart` - Contém funções para manipulação de datas.  
    - `number_parser.dart` - Contém uma função para manipulação de números.  
    - `show_bottom_dialog.dart` - Exibe um diálogo modal inferior com os dados de um lançamento clicado.  
  - **📂 widget/** - Componentes reutilizáveis.  
    - `cartao_widget.dart` - Widget de cartão reutilizável.  

- **📂 view/**  
  Contém as telas e widgets da interface do usuário.  
  - **📂 home/** - Tela principal do aplicativo.  
    - **📂 widgets/** - Componentes específicos da tela inicial.  
      - `cartoes_widget.dart` - Exibição de cartões.  
      - `favoritos_widget.dart` - Lista de itens favoritos.  
      - `top_app_bar_widget.dart` - Barra superior personalizada.  
      - `ultimos_lancamentos_widget.dart` - Lista de últimos lançamentos.  
    - `home_screen.dart` - Tela principal da aplicação.  
  - **📂 notfound/** - Tela de erro para páginas não encontradas.  
    - `not_found_screen.dart` - Exibição de erro 404.  
  - **📂 posting/** - Relacionado à publicação de conteúdo.  
    - **📂 widgets/** - Widgets auxiliares.  
    - `posting_screen.dart` - Tela de lançamentos que recebem os dados de um cartão escolhido.  

- **📂 viewmodel/**  
  Contém a lógica de negócios separada da UI com ChangeNotifier e ValueNotifier.  
  - `home_view_model.dart` - Lógica da tela Home.  

## 📂 `test/`
Contém os testes do projeto.

- **📂 app/shared/utils**  
  - `data_parser_test.dart` - Testes para `data_parser.dart`.  
  - `number_parser_test.dart` - Testes para `number_parser.dart`.  

---

## Como instalar o projeto

# 🚩 Como Instalar o Projeto  

Este guia explica duas maneiras de instalar e executar o aplicativo:  

1. **Clonando o repositório e rodando no emulador**  
2. **Instalando o APK no celular**  

---

## 🏗️ Método 1: Clonando o repositório e rodando no emulador  

### 📌 **Pré-requisitos**  
Antes de começar, certifique-se de ter instalado:  
- [Flutter SDK](https://docs.flutter.dev/get-started/install)  
- [Android Studio](https://developer.android.com/studio) (ou outro ambiente de desenvolvimento)  
- Emulador configurado ou um dispositivo físico conectado  

### 🔧 **Passos de instalação**  
1. **Clone o repositório**  
   Abra o terminal e execute:  
   ```sh
   git clone <URL_DO_REPOSITORIO>
   cd <NOME_DO_PROJETO>
   ```

2. **Instale as dependências**  
    ```sh
    flutter pub get
    ```

3. **Execute no emulador ou dispositivo conectado**  
    ```sh
    flutter run
    ```
---

## 📱 Método 2: Instalando o APK no celular
### 📌 **Pré-requisitos**   
- Um smartphone com Android 
- O APK do aplicativo

### 🔧 Passos de instalação
1. **Clone o repositório**  
<a href="https://github.com/BerPGR/gs3-teste-flutter/tree/master/generated/app-release.apk" download>
    <img src="https://img.shields.io/badge/Baixar%20APK-Download-blue?style=for-the-badge" alt="Baixar APK">
</a>

2. **Habilite a instalação de fontes desconhecidas**  
   - Vá para Configurações > Segurança > Instalar apps desconhecidos
   - Permita que o gerenciador de arquivos instale aplicativos.

3. **No celular, localize o arquivo APK e toque para instalar.**  
    ```sh
    flutter run
    ```

4. **Abra o aplicativo**.
    - Após a instalação, encontre o app na lista de aplicativos e abra normalmente.
