local lint = require('lint')

lint.linters_by_ft = {
  markdown = { "vale" },
  yaml = { "yamllint" },
  ghaction = { "actionlint" }
}
