# Pace Blocks 🏃‍♂️

---

## 🇺🇸 English

**Pace Blocks** is a mobile application developed in Flutter for creating and managing interval running workouts. The app allows users to create personalized workouts by combining different types of exercises with flexible measurement units.

### 🎯 Objectives

- **Create personalized workouts**: Allows combining different types of exercises (walking, light running, moderate, intense, etc.) in a single session
- **Unit flexibility**: Support for different measurement units (minutes, meters, kilometers) for each exercise
- **Intuitive interface**: Clean and easy-to-use design for quick workout creation
- **Multilingual support**: Interface available in 9 languages (Portuguese, English, Spanish, French, Italian, German, Japanese, Chinese, and Russian)
- **Local storage**: All data is saved locally on the device using SQLite

### 💡 Motivation

This project was developed to address the need for a simple and efficient tool for creating interval running workouts. Many runners need an easy way to structure their workouts, combining different intensities and durations, but the options available on the market are often complex or limited.

**Pace Blocks** offers:
- **Simplicity**: Direct interface to create workouts without complications
- **Flexibility**: Free combination of exercises and units
- **Accessibility**: Support for multiple languages for global users
- **Offline**: Works without internet connection

### 🚀 Features

#### Main Resources
- ✅ Personalized workout creation
- ✅ Multiple exercise types (9 different types)
- ✅ Flexible units (minutes, meters, km)
- ✅ Multilingual interface (9 languages)
- ✅ Secure local storage
- ✅ Basic statistics dashboard

#### Available Exercise Types
- **Walking** (CA)
- **Jogging** (TR)
- **Light Run** (CL)
- **Moderate Run** (CM)
- **Strong Run** (CF)
- **Very Strong Run** (CMF)
- **VO2 Max** (VO2)
- **Rest** (DE)
- **Stretching Training** (TA)

### 🛠️ Technologies Used

- **Flutter**: Mobile development framework
- **SQLite**: Local database
- **sqflite**: Plugin for SQLite integration
- **Material Design**: User interface

### 📱 How to Use

1. **Create a Workout**: Access the "Workouts" tab and click "Add Exercise"
2. **Select Type**: Choose the desired exercise type
3. **Define Value**: Enter duration/distance and select the unit
4. **Add More**: Continue adding exercises as needed
5. **Save**: Give the workout a name and save

### 🗂️ Project Structure

```
lib/
├── data/
│   ├── dao/           # Data Access Objects
│   └── database/      # Database configuration
├── screens/
│   ├── home/          # Home screen and dashboard
│   └── create_workout/ # Workout creation
└── services/          # Business logic
```

### 📋 Project Status

The project is in active development. Implemented features:
- ✅ Complete database system
- ✅ Workout creation interface
- ✅ Multilingual support
- ✅ Basic dashboard

#### Upcoming Features
- 📊 Workout history
- 📈 Advanced statistics
- 🎯 Goals and objectives
- 📅 Workout scheduling
- 🔄 Device synchronization

---

## 🇧🇷 Português (Brasil)

**Pace Blocks** é um aplicativo móvel desenvolvido em Flutter para criação e gerenciamento de treinos de corrida intervalada. O app permite aos usuários criar treinos personalizados combinando diferentes tipos de exercícios com unidades de medida flexíveis.

### 🎯 Objetivos

- **Criar treinos personalizados**: Permite combinar diferentes tipos de exercícios (caminhada, corrida leve, moderada, forte, etc.) em uma única sessão
- **Flexibilidade de unidades**: Suporte a diferentes unidades de medida (minutos, metros, quilômetros) para cada exercício
- **Interface intuitiva**: Design limpo e fácil de usar para criação rápida de treinos
- **Suporte multilíngue**: Interface disponível em 9 idiomas (Português, Inglês, Espanhol, Francês, Italiano, Alemão, Japonês, Chinês e Russo)
- **Armazenamento local**: Todos os dados são salvos localmente no dispositivo usando SQLite

### 💡 Motivação

Este projeto foi desenvolvido para resolver a necessidade de uma ferramenta simples e eficiente para criação de treinos de corrida intervalada. Muitos corredores precisam de uma forma fácil de estruturar seus treinos, combinando diferentes intensidades e durações, mas as opções disponíveis no mercado são muitas vezes complexas ou limitadas.

O **Pace Blocks** oferece:
- **Simplicidade**: Interface direta para criar treinos sem complicações
- **Flexibilidade**: Combinação livre de exercícios e unidades
- **Acessibilidade**: Suporte a múltiplos idiomas para usuários globais
- **Offline**: Funciona sem conexão com a internet

### 🚀 Funcionalidades

#### Principais Recursos
- ✅ Criação de treinos personalizados
- ✅ Múltiplos tipos de exercícios (9 tipos diferentes)
- ✅ Unidades flexíveis (minutos, metros, km)
- ✅ Interface multilíngue (9 idiomas)
- ✅ Armazenamento local seguro
- ✅ Dashboard com estatísticas básicas

#### Tipos de Exercícios Disponíveis
- **Caminhada** (CA)
- **Trote** (TR) 
- **Corrida Leve** (CL)
- **Corrida Moderada** (CM)
- **Corrida Forte** (CF)
- **Corrida Muito Forte** (CMF)
- **VO2 Max** (VO2)
- **Descanso** (DE)
- **Treino de Alongamento** (TA)

### 🛠️ Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento móvel
- **SQLite**: Banco de dados local
- **sqflite**: Plugin para integração com SQLite
- **Material Design**: Interface de usuário

### 📱 Como Usar

1. **Criar um Treino**: Acesse a aba "Treinos" e clique em "Adicionar Exercício"
2. **Selecionar Tipo**: Escolha o tipo de exercício desejado
3. **Definir Valor**: Insira a duração/distância e selecione a unidade
4. **Adicionar Mais**: Continue adicionando exercícios conforme necessário
5. **Salvar**: Dê um nome ao treino e salve

### 🗂️ Estrutura do Projeto

```
lib/
├── data/
│   ├── dao/           # Data Access Objects
│   └── database/      # Configuração do banco de dados
├── screens/
│   ├── home/          # Tela inicial e dashboard
│   └── create_workout/ # Criação de treinos
└── services/          # Lógica de negócio
```

### 📋 Status do Projeto

O projeto está em desenvolvimento ativo. Funcionalidades implementadas:
- ✅ Sistema de banco de dados completo
- ✅ Interface de criação de treinos
- ✅ Suporte multilíngue
- ✅ Dashboard básico

#### Próximas Funcionalidades
- 📊 Histórico de treinos
- 📈 Estatísticas avançadas
- 🎯 Metas e objetivos
- 📅 Programação de treinos
- 🔄 Sincronização entre dispositivos

---

## 📄 License

This project is licensed under the Creative Commons CC BY-NC-ND 4.0.

✅ **Allowed**: For study and learning purposes.
🚫 **Prohibited**: Commercial use, creation of derivative apps, or modified redistribution.

Read more in [LICENSE](./LICENSE).
