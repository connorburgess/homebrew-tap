class Keepgoing < Formula
  desc "Keep long-running coding-agent loops going"
  homepage "https://github.com/connorburgess/keepgoing-agents"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.1/keepgoing_0.1.1_darwin_arm64.tar.gz"
      sha256 "cb77cfb54c0186ef25f0959cf38ff3d526a9c9efac2b3b0ebeceeec3b95dce5e"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.1/keepgoing_0.1.1_darwin_amd64.tar.gz"
      sha256 "83d07d1b8c54cbe2c96afad24fb4a16b5937f869181d0aa1f8529e28019e0fa5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.1/keepgoing_0.1.1_linux_arm64.tar.gz"
      sha256 "e71afd21124d1d64003da751eff0f1063b69183f76c1abb1429a6be2605e1114"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.1.1/keepgoing_0.1.1_linux_amd64.tar.gz"
      sha256 "d769ae73b8cbf5c90746f5f7298ba257b0e04b5c6526c44f73cc08f863d7f57a"
    end
  end

  def install
    bin.install "keepgoing"
  end

  test do
    assert_match "v#{version}", shell_output("#{bin}/keepgoing version")
  end
end
