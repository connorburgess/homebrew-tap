class Keepgoing < Formula
  desc "Keep long-running coding-agent loops going"
  homepage "https://github.com/connorburgess/keepgoing-agents"
  # The Sustainable Use License 1.0 is not on the SPDX list. v0.1.5 and every
  # earlier release are Apache-2.0.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.2.0/keepgoing_0.2.0_darwin_arm64.tar.gz"
      sha256 "8ef393793ccf25ac2ad69edc5cf758d7dc6f0aaf5d25693999533ca7ea6491ae"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.2.0/keepgoing_0.2.0_darwin_amd64.tar.gz"
      sha256 "43d8bfdf17d6917f15da9c5d65d07bb71dc34d02191bfd4988660fa68cfe66fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.2.0/keepgoing_0.2.0_linux_arm64.tar.gz"
      sha256 "27bcb7d48b4f1fae5187ac3cab7fbc471c398b7457c979da26f9baa2218d5f77"
    end
    on_intel do
      url "https://github.com/connorburgess/keepgoing-agents/releases/download/v0.2.0/keepgoing_0.2.0_linux_amd64.tar.gz"
      sha256 "38047ad564adde3de227226356784f077e46bbba75b275070e2779114654eb4c"
    end
  end

  def install
    bin.install "keepgoing"
    # LICENSE and README.md are installed as metafiles.
    prefix.install "LICENSING.md", "THIRD_PARTY_NOTICES", "LICENSES"
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
    assert_match "allow-changes", shell_output("#{bin}/keepgoing panel --help 2>&1")
    assert_path_exists prefix/"LICENSE"
    assert_path_exists prefix/"LICENSING.md"
    assert_path_exists prefix/"THIRD_PARTY_NOTICES"
    assert_path_exists prefix/"LICENSES/Apache-2.0.txt"
  end
end
