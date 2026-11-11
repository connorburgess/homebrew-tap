class Keepgoing < Formula
  desc "Keep long-running coding-agent loops going"
  homepage "https://github.com/connorburgess/keepgoing-agents"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.4/keepgoing_0.1.4_darwin_arm64.tar.gz"
      sha256 "2e4dbc66d54ce6be0026476c8a5c38d93171e019c055e66278aaea13b6419491"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.4/keepgoing_0.1.4_darwin_amd64.tar.gz"
      sha256 "e798b84c03d9f67c0792ca6da951e3e5e9cd3e6e83507b9b1a198cf1e4042ed0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.4/keepgoing_0.1.4_linux_arm64.tar.gz"
      sha256 "7b8576536202353c5aa3a2624492dc2949c675605c23d4e0a58be0cfbb2ad98b"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.4/keepgoing_0.1.4_linux_amd64.tar.gz"
      sha256 "5d1b7be7d204dfff7773907429da7e8594633a55786dea110d02c4211e433041"
    end
  end

  def install
    bin.install "keepgoing"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/keepgoing version")
    help = shell_output("#{bin}/keepgoing init --help 2>&1")
    assert_match "task-file", help
    assert_match "max-sends", help
    assert_match "state-dir", shell_output("#{bin}/keepgoing timeline --help 2>&1")
    assert_match "private", shell_output("#{bin}/keepgoing goal show --help 2>&1")
    assert_match "registry", shell_output("#{bin}/keepgoing client status --help 2>&1")
    assert_match "thread", shell_output("#{bin}/keepgoing transfer preview --help 2>&1")
  end
end
