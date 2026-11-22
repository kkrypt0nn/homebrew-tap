class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "774e0646db85dade29121b9fbafc53997debe3fb2c5faf9b0e63532bc912ad69"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-1.1.3"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "e4123b4814f9655d0ff16d037ee5bfbae8dd57134bed52a2b2eaa24ac4f3cb05"
    sha256 cellar: :any,                 x86_64_linux: "5638b317d3c264283b84615f362737af2a8297c0f9e39d46c592dfb2e43833a0"
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
