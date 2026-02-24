class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v0.0.8.tar.gz"
  sha256 "78d610d955895f7e1ba5061448f5cfa8dff4835a909bb9ad1880885f16563d7e"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-0.0.7"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "2ec74f3a12c364a4f3483b31041c9a719a9d77a03a2bc29300c735ca6c6a7e1c"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "b0e59da32c5bba41a9acf0db4d8346afe40b4090a2bd7454bd24503257d89c13"
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
