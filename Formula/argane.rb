class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.7.tar.gz"
  sha256 "e33be18bba3e687d972192dfd128272c9e08ac718d8108d02dccbae93d9afde1"
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
    system "#{bin}/argane", "version"
  end
end
