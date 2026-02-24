class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "78d610d955895f7e1ba5061448f5cfa8dff4835a909bb9ad1880885f16563d7e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-0.0.8"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "29a26792cf3cc02ac99065dc43443ec2d6eb056be99337a4a74dbcf053d5f501"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "54f58229b8f58b6c1259100d1f99ab7edf950da08fc2a4da9e8fbc02d6f0d965"
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
