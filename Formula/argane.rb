class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.5.tar.gz"
  sha256 "c851599adfa630f236e9c2347d3facb09815030e417da61706baeed79c88fab3"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-0.0.5"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "1b7e949b23149776288cd88200da97b3f58aa51a6767bc1bb06fa53657a7c4f1"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "4693986fbd9057f92f9b8c06d19cec7a36a5bb0ae0adeac92449929e3d3a71c4"
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
