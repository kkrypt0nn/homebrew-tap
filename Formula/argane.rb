class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "c5a7a441e0ef580f610f20a0ada1f0b019a8a81df5bb456b880e26883626f9ab"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-0.0.2"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "ecc8392d0939077fb1558808231a0a5bd2564ce8ccf806a955f0dd3c20845214"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "0114096ea7ad5a853cbb1de447238064c995dedd8de621e619d28945e64d03a8"
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
