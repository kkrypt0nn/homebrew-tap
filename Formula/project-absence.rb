class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.1.1.tar.gz"
  sha256 "69c82ec486352bcb6e40c9cee2bffaf0b4feb539af66b35a7f10d4c73650b1dd"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-1.0.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "5258de917d00c5208297c16a8e5da43f31c9a7fea89023b3998b9da586b5852f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "d993d35ad7387f37b63b7c84856eb73734f58906a969f5b532a839357e317fe1"
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
