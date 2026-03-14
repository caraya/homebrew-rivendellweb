class EsbuildRw < Formula
  desc "Extremely fast bundler for the web"
  homepage "https://esbuild.github.io/"
  url "https://github.com/evanw/esbuild/archive/refs/tags/v0.27.3.tar.gz"
  sha256 "05d56070104b46d24c8921bfc4c83209d71cf583eb0396c13d0f359705bb5b61"
  license "MIT"
  revision 1

  head "https://github.com/evanw/esbuild.git", branch: "main"

  bottle do
    root_url "https://ghcr.io/v2/caraya/rivendellweb-homebrew"
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "14a48501da4495bd4f45913fd8bba4233bfcc84c02a9e7d9730bc8b7a0fe4ea2"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "114f46dbfcb8b029dcca8d348fd713101799f01769d5ed306fb558aeafc9d661"
  end

  depends_on "go" => :build
  depends_on "node" => :test

  def install
    ENV["CGO_ENABLED"] = OS.mac? ? "1" : "0"
    system "go", "build", *std_go_args(output: bin/"esbuild", ldflags: "-s -w"), "./cmd/esbuild"
  end

  test do
    (testpath/"app.jsx").write <<~JS
      import * as React from 'react'
      import * as Server from 'react-dom/server'

      let Greet = () => <h1>Hello, world!</h1>
      console.log(Server.renderToString(<Greet />))
      process.exit()
    JS

    system Formula["node"].libexec/"bin/npm", "install", "react", "react-dom"
    system bin/"esbuild", "app.jsx", "--bundle", "--outfile=out.js"

    assert_equal "<h1>Hello, world!</h1>\n", shell_output("node out.js")
  end
end
