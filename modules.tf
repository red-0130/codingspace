
module "code-server" {
  count          = data.coder_workspace.me.start_count
  source         = "registry.coder.com/coder/code-server/coder"
  version        = "1.5.1"
  agent_id       = coder_agent.main.id
  install_prefix = "/home/coder/.local/code-server"
  use_cached     = true
  extensions = [
    "usernamehw.errorlens",
    "esbenp.prettier-vscode",
    "christian-kohler.path-intellisense",
  ]
  settings = {
    "chat.disableAIFeatures" = true,
  }
}
