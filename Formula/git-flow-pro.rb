class GitFlowPro < Formula
  desc "Enhanced Git Flow workflow management for Zsh"
  homepage "https://github.com/chornthorn/git-flow-pro"
  url "https://github.com/chornthorn/git-flow-pro/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "YOUR_TARBALL_SHA256" # Will be updated automatically by GitHub Actions
  version "1.0.0"
  license "MIT"

  depends_on "git"
  depends_on "git-flow"
  depends_on "zsh"

  def install
    prefix.install "config", "scripts"
  end

  def caveats
    <<~EOS
      🚀 To complete the installation, run:
      
      /bin/zsh -c "$(#{prefix}/scripts/remote-install.sh)"

      📝 Then type 'githelp' to see available commands.

      To update Git Flow Pro, run:
      brew upgrade git-flow-pro

      To uninstall:
      brew uninstall git-flow-pro
    EOS
  end

  test do
    system "zsh", "-c", "source #{prefix}/scripts/install.sh && githelp"
  end
end