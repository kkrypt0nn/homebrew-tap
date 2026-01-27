class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v0.13.0.tar.gz"
  sha256 "0939918dd997bdad5db07e991640ba0e605be1b9d05aecbd31bba3199071c471"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-0.13.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "a1791b81557f952ea45f122cf276f75ea18fdd8f5f2dc7ad7c2ea903028cec70"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9a2d85ad7534c408a47f9226e78e7ebb492693ab6569adf2a8efa7702c76444b"
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
