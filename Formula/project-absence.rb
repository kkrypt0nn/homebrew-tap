class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b4835500db9315978fb9f2158f67d1bddf5e454f5ea27e342b2f825cb81fe329"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "167275e553966f8fb0cdcc3c73a87736a41d490d7c17b7e1131d3755a833748b"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8feea36d4630ccad5543181e42a7ae37615288f3f4311e135640ef8086e22968"
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
