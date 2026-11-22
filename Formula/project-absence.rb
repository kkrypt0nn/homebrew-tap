class ProjectAbsence < Formula
  desc "Uncover the unseen"
  homepage "https://github.com/kkrypt0nn/project-absence"
  url "https://github.com/kkrypt0nn/project-absence/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "4410c83770fcb098bdb452db27c5e83eb41e10e5223d5a4aa74513eaf434174e"
  license "MIT"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/project-absence-1.2.1"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "958d2234212405413dc14e1be8e306514d0564f6f4db0498b21a82d29b49fffd"
    sha256 cellar: :any,                 x86_64_linux: "0abedaf0d1d209f63e2c7b3a2465d2df6c25de600e621796fe2e3bfddf0c2442"
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
