class GitFlowPro < Formula
  desc "Enhanced Git Flow workflow management for Zsh"
  homepage "https://github.com/chornthorn/git-flow-pro"
  url "https://github.com/chornthorn/git-flow-pro/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "d83550dd4a28b1fd0ca49c58a2c00676d0a37d6e8294f984d6fdb59725d84a05"
  license "MIT"

  head "https://github.com/chornthorn/git-flow-pro.git", branch: "main"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on "git"
  depends_on "git-flow"
  depends_on "zsh"

  def install
    prefix.install "config"
    prefix.install "scripts"
  end

  def caveats
    <<~EOS
      To complete the installation, run:
      /bin/zsh -c "$(#{opt_prefix}/scripts/remote-install.sh)"

      Type 'githelp' to see available commands.

      To update: brew upgrade git-flow-pro
      To uninstall: brew uninstall git-flow-pro
    EOS
  end

  test do
    system "#{opt_prefix}/scripts/install.sh", "--help"
    assert_match "Git Flow Pro", shell_output("zsh -c 'source #{opt_prefix}/scripts/install.sh && githelp'")
    system "git", "init"
    system "git", "config", "user.name", "BrewTestBot"
    system "git", "config", "user.email", "brew@test.bot"
    assert_match "Initialized empty Git repository", shell_output("git init 2>&1")
  end
end
