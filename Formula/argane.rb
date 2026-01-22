class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "0ea457ef630b9db2758155b2fdb65386b7996e302c89bb12be502bff664ed7b0"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-0.0.4"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ee77bfb24efda3a93b1d31464c481971afd56c6269ed553c23c9c69fb1eaeebc"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "be7bf82dbca99df281e6d2b4472ee455f305f58a44c800ca489fbbca86c08f57"
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
