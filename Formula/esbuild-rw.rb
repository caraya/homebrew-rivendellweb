class EsbuildRw < Formula
  desc "Extremely fast bundler for the web"
  homepage "https://esbuild.github.io/"
  url "https://github.com/evanw/esbuild/archive/refs/tags/v0.27.3.tar.gz"
  sha256 "05d56070104b46d24c8921bfc4c83209d71cf583eb0396c13d0f359705bb5b61"
  license "MIT"

  head "https://github.com/evanw/esbuild.git", branch: "main"

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
