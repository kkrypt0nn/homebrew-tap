class Argane < Formula
  desc "Your Kubernetes pod security detective"
  homepage "https://argane.krypton.ninja"
  url "https://github.com/kkrypt0nn/argane/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "6e952bcc6e050a67ee81583c49a255e237fa24220b33bb8313daaaba259156cd"
  license "Apache-2.0"

  bottle do
    root_url "https://github.com/kkrypt0nn/homebrew-tap/releases/download/argane-1.0.0"
    sha256 cellar: :any_skip_relocation, arm64_tahoe:  "eaa18f307fa5ff0b0d7cb0afdf84e77042ad7a558c03d652b90d2a187c861c2f"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "c6c25ce7c4699004faa5cd17bf7c5bce5722a6461b2b014d4b0688dc0e26c452"
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
