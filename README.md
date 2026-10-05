# Questionnaires

Веб-приложение для анонимных медицинских опросников (сейчас это «Опросник тазовой боли»).
Человек открывает опросник по ссылке, вводит инициалы и последние 4 цифры телефона,
отвечает на вопросы. Ответы сохраняются в PostgreSQL.

## Возможности

- Список опросников на главной странице (`/`)
- Прохождение опросника по короткой ссылке: `/questionnaires/:slug` (например, `/questionnaires/pelvic-pain`)
- Вопросы разбиты на группы, порядок групп и вопросов задаётся полем `position`
- Два типа вопросов:
  - `scored` — оценка по шкале от 0 до 4 (обязательный ответ)
  - `bool` — да/нет (чекбокс)
- Респондент идентифицируется по инициалам и последним 4 цифрам телефона, без регистрации.
  После отправки его id сохраняется в сессии, и пройти опрос повторно с того же браузера нельзя.
- В браузере перед отправкой проверяется, что ответы даны на все вопросы со шкалой

## Модель данных

```
Questionnaire (name, slug)
  └── QuestionGroup (name, position)
        └── Question (content, position, answer_type: scored | bool)
              └── Answer (score) ──> User (name, last_4_digits)
```

Для `bool`-вопросов в `score` записывается `1` или `0`.

## Стек

- Ruby 3.3.0, Rails 8.0
- PostgreSQL
- Hotwire (Turbo, Stimulus) через importmap, без Node.js
- Bootstrap 5.3 (подключён с CDN)
- Solid Cache / Solid Queue / Solid Cable
- Деплой через Kamal + Thruster

## Запуск локально

```sh
bin/setup          # установит гемы, создаст БД и запустит сервер
# или по шагам:
bundle install
bin/rails db:prepare
bin/dev
```

Приложение будет доступно на http://localhost:3000.

### Данные

Сиды пустые. Опросники, группы и вопросы пока создаются вручную через `bin/rails console`
или загружаются из дампа PostgreSQL.

## Тесты и проверки

```sh
bin/rails test
bin/rubocop
bin/brakeman
```

Те же проверки запускаются в GitHub Actions (`.github/workflows/ci.yml`).

## Деплой

Конфигурация лежит в `config/deploy.yml`. Перед первым деплоем укажите там реальные
сервер, хост и registry.

```sh
bin/kamal setup    # первый раз
bin/kamal deploy
```

Healthcheck: `GET /up`.
