class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.1.2.tar.gz"
  sha256 "ac9c5321aa5b0387f1f1ab3d888e86ce2f7c555c5b9f100d163da318801db256"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-1.1.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "64b89813d2b1783c95bc082d67065c9f264072817a0df06bb146a2ba68a9db36"
    sha256 cellar: :any,                 x86_64_linux: "b679a6811d17d5854c4ede28f49cc33a68978838452db538030e651dea47dd26"
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
