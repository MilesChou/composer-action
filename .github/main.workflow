workflow "Test the Phalcon Actions" {
  on = "push"
  resolves = [
    "Send Discord message"
  ]
}

action "Test the Composer help command" {
  uses = "./"
  args = "help"
}

action "Test the Composer require command" {
  uses = "./"
  args = "require --no-update psr/http-message"
}

action "Send Discord message" {
  uses = "appleboy/discord-action@master"
  needs = [
    "Test the Composer help command",
    "Test the Composer require command",
  ]
  secrets = [
    "WEBHOOK_ID",
    "WEBHOOK_TOKEN",
  ]
  args = "A new commit has been push to `MilesChou/composer-action`."
}
