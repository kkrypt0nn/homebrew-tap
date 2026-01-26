class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.6.tar.gz"
  sha256 "5a4ff2777e7992205598c726b8d2e55e7b2c534d719e21fdeb88d348c1ceb9de"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-0.0.6"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "28e5505605323a7533a663149e22c5942cfcda87f59c8ec296affa0f7e6c1453"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "94fb0e7301688c5055c72be885d458fc467006e5bad679ad520fb480de977812"
  end

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/kkrypt0nn/argane/internal/buildinfo.Version=#{version}
      -X github.com/kkrypt0nn/argane/internal/buildinfo.BuildDate=#{time.iso8601}
      -X github.com/kkrypt0nn/argane/internal/buildinfo.GitCommit=#{tap.user}
    ].join(" ")
    system "go", "build", *std_go_args(ldflags:), "./cmd/argane/main.go"
  end

  test do
    output = shell_output("#{bin}/argane version")
    assert_match "Application:", output
    assert_match version.to_s, output
  end
end
