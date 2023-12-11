#!/usr/bin/env sh

MODE=${MODE:-"run"}
ADDRESS=${ADDRESS:-"0.0.0.0"}
PORT=${PORT:"3000"}

case "$MODE" in
"run")
  echo "Running Rails server on ${ADDRESS}:${PORT}..."
    rails server --port "${PORT}" --binding "${ADDRESS}"
  ;;
"migrate")
  echo "Running database migrations..."
  rails db migrate
  ;;
*)
  echo "Unknown mode: ${MODE}"
  exit 1
  ;;
esac