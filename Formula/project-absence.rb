class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "a682ed3d491346f8e8fc28a788c41ff5afcacb4c7d94fed484a8273a8ace288e"
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
