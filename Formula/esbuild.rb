class Esbuild < Formula
  desc "Extremely fast JavaScript bundler and minifier"
  homepage "https://esbuild.github.io/"
  url "https://github.com/evanw/esbuild/archive/refs/tags/v0.13.3.tar.gz"
  sha256 "ed55702162040ab57d729cc706fd77e35ddd9bfbeb11bbbd864c2f569c5cc8b3"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
  end

  test do
    system "false"
  end
end
