class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "ac9c5321aa5b0387f1f1ab3d888e86ce2f7c555c5b9f100d163da318801db256"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-1.1.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "73e0b0f07ce91d9c1abe6c71707330bda914b296d278d0f6154783d64c3f9fa7"
    sha256 cellar: :any,                 x86_64_linux: "bfd8c5b5724a5e0fc23ead6fee11290e4ee5eca12fc0e388cfbaf7c80a56b220"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    output = shell_output("#{bin}/project-absence --help")
    assert_match "Project Absence", output
    assert_match version.to_s, output
  end
end
