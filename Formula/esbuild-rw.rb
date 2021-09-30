require "language/node"

class EsbuildRw < Formula
  desc "This is a JavaScript bundler and minifier"
  homepage "https://github.com/evanw/esbuild#readme"
  url "https://registry.npmjs.org/esbuild/-/esbuild-0.13.3.tgz"
  sha256 "da5ed75590a694b28901a3af8a761f6a1e90feac77cf2d758dc36d8a89db3a02"
  license "MIT"

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
