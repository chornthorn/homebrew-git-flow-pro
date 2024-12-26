class GitFlowPro < Formula
  desc "Enhanced Git Flow workflow management for Zsh"
  homepage "https://github.com/chornthorn/git-flow-pro"
  url "https://github.com/chornthorn/git-flow-pro/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "03ec8b260c30b49972a70b812acd9373e196ddf685e8537df19dcbbe273eab64"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
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
    # Test Git initialization
    system "git", "init"
    system "git", "config", "user.name", "BrewTestBot"
    system "git", "config", "user.email", "brew@test.bot"
    assert_predicate testpath/".git", :exist?

    # Verify script files exist
    assert_predicate opt_prefix/"scripts/install.sh", :exist?
    assert_predicate opt_prefix/"scripts/remote-install.sh", :exist?

    # Test script is executable
    assert_predicate opt_prefix/"scripts/install.sh", :executable?
    assert_predicate opt_prefix/"scripts/remote-install.sh", :executable?
  end
end
