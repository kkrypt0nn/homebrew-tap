class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b4835500db9315978fb9f2158f67d1bddf5e454f5ea27e342b2f825cb81fe329"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-0.14.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "0fc7be2d22b2ca21d0bf125c9d920a566551595391ca36d9e0b37a4e269e38d4"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "671eb43451e66db5c29dd163135980fca08aaa90fabbe45b282c40ac9085e0f7"
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
