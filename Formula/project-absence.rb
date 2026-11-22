class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "774e0646db85dade29121b9fbafc53997debe3fb2c5faf9b0e63532bc912ad69"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-1.2.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "9b7372e3782dad40af0f8b3dfe73a199975f04ffed188342135a536d1ab7adf6"
    sha256 cellar: :any,                 x86_64_linux: "b2eb10b2936c213e6862527303961164feb56e6ca7b82aa1897dcf56f4f9c854"
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
