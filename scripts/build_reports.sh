#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
reports_dir="$root_dir/site/reports"

project_paths=(
  "mini-projects/ui-playwright-smoke"
  "mini-projects/api-requests-pytest"
  "mini-projects/contract-testing"
  "mini-projects/data-quality-tests"
)

mkdir -p "$reports_dir"

for path in "${project_paths[@]}"; do
  project_dir="$root_dir/$path"
  name="$(basename "$project_dir")"
  results_dir="$project_dir/allure-results"
  report_dir="$reports_dir/$name"

  if [ ! -d "$results_dir" ]; then
    continue
  fi

  allure generate "$results_dir" --clean -o "$report_dir"
done

