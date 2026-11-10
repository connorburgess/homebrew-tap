class Keepgoing < Formula
  desc "Keep long-running coding-agent loops going"
  homepage "https://github.com/connorburgess/keepgoing-agents"
  version "0.1.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.2/keepgoing_0.1.2_darwin_arm64.tar.gz"
      sha256 "b7a6a7ef4bf498004b3e613da698399061f5fd5707d9c0f46f6e0571362b1b92"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.2/keepgoing_0.1.2_darwin_amd64.tar.gz"
      sha256 "35de4f0db6e1cddad5936d1276f55203445d8b8e2e0dccfcb4906af295b2e93e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.2/keepgoing_0.1.2_linux_arm64.tar.gz"
      sha256 "ea3c38f240ecb19203eb4e349915986fe71ba6f7b6ae097c1a6f549f1053cc1d"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.2/keepgoing_0.1.2_linux_amd64.tar.gz"
      sha256 "343a210ee38d41d964f20afca6380292fdba33e46220d863f5cb97534378f1b5"
    end
  end

  def install
    bin.install "keepgoing"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/keepgoing version")
    assert_match "task-file", shell_output("#{bin}/keepgoing init --help 2>&1")
  end
end
