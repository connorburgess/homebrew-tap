class Keepgoing < Formula
  desc "Keep long-running coding-agent loops going"
  homepage "https://github.com/connorburgess/keepgoing-agents"
  version "0.1.5"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.5/keepgoing_0.1.5_darwin_arm64.tar.gz"
      sha256 "cbaf75cd21069407a4144552d1f0bf3f777988917c196f90f2f0e48c4bb181bf"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.5/keepgoing_0.1.5_darwin_amd64.tar.gz"
      sha256 "621e22a450775d1aace7aa487ca03ba927a1942a34e4a47a056777a1e515f82a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.5/keepgoing_0.1.5_linux_arm64.tar.gz"
      sha256 "f963c3ff6b0e36b612ee9dcea32aed21b2f89da918ec323a6525c3738194ea2c"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.5/keepgoing_0.1.5_linux_amd64.tar.gz"
      sha256 "19e79ad5042017eb3e3f486c8176c12385ce75cb8872dc845b31a44ed367ea36"
    end
  end

  def install
    bin.install "keepgoing"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/keepgoing version")
    help = shell_output("#{bin}/keepgoing init --help 2>&1")
    assert_match "task-file", help
    assert_match "with-goal", help
    assert_match "max-sends", help
    assert_match "state-dir", shell_output("#{bin}/keepgoing timeline --help 2>&1")
    assert_match "private", shell_output("#{bin}/keepgoing goal show --help 2>&1")
    assert_match "registry", shell_output("#{bin}/keepgoing client status --help 2>&1")
    assert_match "thread", shell_output("#{bin}/keepgoing transfer preview --help 2>&1")
  end
end
