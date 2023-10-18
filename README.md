# Lista de Contatos em Flutter DIO
Projeto de lista de contatos em flutter - Bootcamp Santader DIO

## Requisitos:
<ol>
    <li>- [x] Criar uma aplicação Flutter​​​​</li>
    <li>- [x] Criar um banco de dados / Back4App​</li>
    <li>- [x] Fazer um cadastro de pessoa com foto de perfil​</li>
    <li>- [x] Salvar apenas o path da imagem na base de dados​​ ​</li>
    <li>- [x] Listar as pessoas em uma lista com sua respectiva foto​​ ​</li>
    <li>- [x] Usar os outros componentes aprendidos​ ​</li>
</ol>

## Fluxograma:

```mermaid
graph LR
A((Inicio)) --> Z[Tela Apresentação]
Z --> B[Home Page]
B -- Novo Cadastro --> C[Tela de Cadastro]
C -- Insere Dados --> D{Valida Dados}
D -- Dados Corretos --> E[Salva/Edita no Back4App]
D -- Dados Incorretos --> F[Trata erros e retorna]
B --> G[Listar Contatos]
G --> H[Editar Contato]
H --> D
G --> I[Excluir Contato]
I --> J[Remove o Contato do App e do Back4app]
B --> K[Dados do Perfil]
K --> L[Editar Perfil]
L --> M{Valida Dados}
M -- Dados Corretos --> N[Salva no Shared Preferences]
M -- Dados Incorretos --> O[Trata os erros e retorna]
B -- Sair --> P{Sair do Aplicativo}
P -- Confirmar Saída --> Q((Fim))
P -- Cancelar Saída --> B
```

### Minhas redes sociais, conecte-se comigo:
[![Perfil DIO](https://img.shields.io/badge/-Meu%20Perfil%20na%20DIO-30A3DC?style=for-the-badge)](https://www.dio.me/users/otavio_89908)

[![LinkedIn](https://img.shields.io/badge/-LinkedIn-000?style=for-the-badge&logo=linkedin&logoColor=30A3DC)](https://www.linkedin.com/in/ot%C3%A1vio-cunha-827560209/)

[![GitHub](https://img.shields.io/badge/-github-000?style=for-the-badge&logo=github&logoColor=30A3DC)](https://github.com/otaviotfcunha)

### Um pouco do meu GitHub:

![Top Langs](https://github-readme-stats-git-masterrstaa-rickstaa.vercel.app/api/top-langs/?username=otaviotfcunha&layout=compact&bg_color=000&border_color=30A3DC&title_color=FFF&text_color=FFF)

![GitHub Stats](https://github-readme-stats.vercel.app/api?username=otaviotfcunha&theme=transparent&bg_color=000&border_color=30A3DC&show_icons=true&icon_color=30A3DC&title_color=FFF&text_color=FFF)