class Keepgoing < Formula
  desc "Keep long-running coding-agent loops going"
  homepage "https://github.com/connorburgess/keepgoing-agents"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.3/keepgoing_0.1.3_darwin_arm64.tar.gz"
      sha256 "7907257407d0bb89a6696f05dea0dff6ee1052341432b466e3ccf9c53170a83a"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.3/keepgoing_0.1.3_darwin_amd64.tar.gz"
      sha256 "c69244ac440aa8da5535e522d9033f94d5184460cfd158f0b38fd33e27328129"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.3/keepgoing_0.1.3_linux_arm64.tar.gz"
      sha256 "49d03c4a7a8c8f3a3a6efa428909310e4f5bc986f55f6f9816a021862dcc65f1"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.3/keepgoing_0.1.3_linux_amd64.tar.gz"
      sha256 "ffd1f4cbdb3d1ac58bb366affd6bb7e9e2b48cb6d9fe5f0e40ba0884f593e77e"
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
  end
end
