class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "16079612de8f393db88a1c48f261c63e0f85f38e7f601c334266cf27cebb3983"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-1.1.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "4e59fa1f3aa36db2587509837d2778371d6b8aa5bbd9d7cbbf728aa6361fda87"
    sha256 cellar: :any,                 x86_64_linux: "55f586ea1c92b3c92a4871b604cda5969b1066d50efe95c5a095151409dc35a2"
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
    system "#{bin}/argane", "version"
  end
end
