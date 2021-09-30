require "language/node"

class EsbuildRw < Formula
  desc "This is a JavaScript bundler and minifier"
  homepage "https://github.com/evanw/esbuild#readme"
  url "https://registry.npmjs.org/esbuild/-/esbuild-0.13.3.tgz"
  sha256 "da5ed75590a694b28901a3af8a761f6a1e90feac77cf2d758dc36d8a89db3a02"
  license "MIT"

  bottle do
    root_url "https://github.com/caraya/homebrew-rivendellweb/releases/download/esbuild-rw-0.13.3"
    sha256 cellar: :any_skip_relocation, catalina:     "b446dcfcc37033482b090eec88d7f95eece88702135779204277d260144976d8"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "5327147419f7613e8a1d1c51a859498dc04cb6dcfc17a4e9ed55e01631b84e2b"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.js").write("console.log('hello');")
    system bin/"esbuild", "--bundle", "test.js"
    assert_equal "hello", shell_output("node test.js").chomp
  end
end
