# AugurElixir

Phoenix 1.8 web application using Elixir and Erlang managed by `mise`.

## Requirements

Install the project SDKs through `mise`:

```sh
mise install
```

This project pins:

* Erlang/OTP 29.0.2
* Elixir 1.20.1-otp-29

## Setup

The app uses PostgreSQL. By default, development expects:

```text
postgresql://postgres:postgres@localhost:5432/augur_elixir_dev
```

Override it with `DATABASE_URL` when using another database.

```sh
mise exec -- mix setup
```

## Development

Start the Phoenix endpoint:

```sh
mise exec -- mix phx.server
```

Or run it inside IEx:

```sh
mise exec -- iex -S mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Quality Checks

```sh
mise exec -- mix format
mise exec -- mix lint
mise exec -- mix test
mise exec -- mix quality
mise exec -- mix dialyzer
```

`mix quality` runs compile warnings-as-errors, unused dependency checks, format checks,
Credo strict linting, and tests. `mix dialyzer` is separate because the initial PLT
build can take a while.

## Docker

Build the production image:

```sh
docker build -t augur-elixir:latest .
```

Create a local `.env` from `.env.example` on the deployment host:

```sh
DATABASE_URL=postgresql://USER:PASSWORD@HOST:5433/DB_NAME
SECRET_KEY_BASE=replace-with-output-from-mix-phx-gen-secret
PHX_HOST=example.com
POOL_SIZE=5
APP_PORT=4000
```

Run migrations explicitly before starting or after pulling a new image:

```sh
docker compose run --rm app /app/bin/migrate
docker compose up -d
```

Do not commit `.env`. Runtime secrets belong on the deployment host, not in the
image or repository.

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://phoenix.hexdocs.pm/overview.html
* Docs: https://phoenix.hexdocs.pm
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix
