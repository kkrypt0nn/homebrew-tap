class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v0.14.0.tar.gz"
  sha256 "a9c0698ece59e2fe203a8588f34890d62a1921d6038aa7bc044b36fed3d1b2c7"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "875b2083a8eb79d631817107e6be6483e46b5d7eadd3fd734d2f3f406f5596a8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "43f5d5176cec4c0de1f07779925d63adb291c6f305351e56521fd7cc51f27af4"
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
