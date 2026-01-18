class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.1-nightly.tar.gz"
  version "0.0.1-nightly"
  sha256 "3f1d51f55696adc41c0192d34220ec0a0934cec6e46bc37b29b4db097e314ed9"
  license "Apache-2.0"
  head "https://github.com/kkrypt0nn/argane.git", branch: "main"

  depends_on "go" => :build

  def install
    ldflags = %W[
      -s
      -w
      -X github.com/kkrypt0nn/argane/core.Version=#{version}
      -X github.com/kkrypt0nn/argane/core.BuildDate=#{time.iso8601}
      -X github.com/kkrypt0nn/argane/core.GitCommit=#{tap.user}
    ].join(" ")
    system "go", "build", *std_go_args(ldflags:), "./cmd/main.go"
  end

  test do
    output = shell_output("#{bin}/argane version")
    assert_match "Application:", output
    assert_match version.to_s, output
  end
end
