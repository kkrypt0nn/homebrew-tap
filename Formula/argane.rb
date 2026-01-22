class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.2.tar.gz"
  sha256 "c5a7a441e0ef580f610f20a0ada1f0b019a8a81df5bb456b880e26883626f9ab"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-0.0.2"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "937ba2703b366719c35711f69671a73f854927eb86747f89aaad305a14f7fd35"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "8fc0f8d7c35a2e4c6168d1fc30ad2eb0501e3cab3af370c907e9feeec980b123"
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
